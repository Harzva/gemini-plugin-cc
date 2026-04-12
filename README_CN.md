# gemini-plugin-cc

[English](README.md) | 中文

> `everything-agent-cli-to-claude-code` 体系下的 Gemini 独立实现仓库。

## 仓库角色

这个仓库专门负责 Gemini 相关的实现细节：

- CLI 调用方式
- 本地登录假设
- wrapper 行为
- 后续 skill 封装

总仓库：

- <https://github.com/Harzva/everything-agent-cli-to-claude-code>

## 当前状态

| 模块 | 状态 |
| --- | --- |
| 仓库骨架 | ready |
| Gemini wrapper | initial |
| skills 目录 | ready |
| 认证假设 | 本机 Gemini CLI 已登录 |

## 当前包含内容

- `bin/gemini-review.sh`
- `docs/design.md`
- `examples/review-prompt.txt`
- `skills/usecli-gemini.md`
- `tests/test_wrapper.sh`

## 测试与验证

运行本地 smoke test：

```bash
bash tests/test_wrapper.sh
```

当前覆盖：

- `--help` 可用
- `--prompt-file` 可读
- 在 mock `gemini` 二进制下，wrapper 会拼出预期命令

## 适合的方向

- 宽口径 review
- 结构化批注
- 第一轮分析

## 下一步

1. 把 wrapper 提升成更完整的 provider 适配器
2. 增加更多 Gemini 专属动作
3. 按总仓库 `usecli:*` 规范继续收口
