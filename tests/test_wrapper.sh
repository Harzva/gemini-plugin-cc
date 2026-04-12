#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

mock_bin="$tmp_dir/bin"
mkdir -p "$mock_bin"

cat > "$mock_bin/gemini" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
printf 'BIN=gemini\n'
printf 'ARGS='
for arg in "$@"; do
  printf '[%s]' "$arg"
done
printf '\n'
EOF
chmod +x "$mock_bin/gemini"

prompt_file="$tmp_dir/prompt.txt"
printf 'review this file\n' > "$prompt_file"

assert_contains() {
  local haystack="$1"
  local needle="$2"
  local label="$3"
  if [[ "$haystack" != *"$needle"* ]]; then
    echo "assertion failed: $label" >&2
    echo "expected: $needle" >&2
    echo "actual: $haystack" >&2
    exit 1
  fi
}

bash "$repo_root/bin/gemini-review.sh" --help >/dev/null

out="$(PATH="$mock_bin:$PATH" bash "$repo_root/bin/gemini-review.sh" --prompt-file "$prompt_file")"
assert_contains "$out" 'BIN=gemini' 'should call gemini binary'
assert_contains "$out" 'ARGS=[-p][review this file][-o][text]' 'should pass prompt and text mode'

echo "gemini-plugin-cc smoke test passed"
