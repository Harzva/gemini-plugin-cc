# gemini-plugin-cc

English | [中文](README_CN.md)

> Gemini-specific adapter work for the `everything-agent-cli-to-claude-code` ecosystem.

## Repository Role

This repository focuses on Gemini-specific implementation details:

- CLI invocation shape
- local auth expectations
- wrapper behavior
- future skill packaging

Umbrella project:

- <https://github.com/Harzva/everything-agent-cli-to-claude-code>

## Current State

| Area | Status |
| --- | --- |
| Repo scaffold | ready |
| Gemini wrapper | initial |
| Skills directory | ready |
| Auth assumption | local Gemini CLI login |

## Included Today

- `bin/gemini-review.sh`
- `docs/design.md`
- `examples/review-prompt.txt`
- `skills/usecli-gemini.md`

## What It Is Good For

- broad review
- structured critique
- first-pass analysis

## Next Steps

1. turn the wrapper into a richer provider adapter
2. add more Gemini-specific actions
3. align with umbrella `usecli:*` conventions

