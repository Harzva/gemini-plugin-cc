#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  gemini-review.sh --prompt "<text>"
  gemini-review.sh --prompt-file <path>
EOF
}

prompt=""
prompt_file=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --prompt)
      prompt="$2"
      shift 2
      ;;
    --prompt-file)
      prompt_file="$2"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -n "$prompt" && -n "$prompt_file" ]]; then
  echo "use either --prompt or --prompt-file, not both" >&2
  exit 1
fi

if [[ -n "$prompt_file" ]]; then
  [[ -f "$prompt_file" ]] || { echo "prompt file not found: $prompt_file" >&2; exit 1; }
  prompt="$(cat "$prompt_file")"
fi

[[ -n "$prompt" ]] || { echo "no prompt supplied" >&2; exit 1; }
command -v gemini >/dev/null 2>&1 || { echo "provider executable not found: gemini" >&2; exit 1; }

exec gemini -p "$prompt" -o text
