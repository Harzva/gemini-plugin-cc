# gemini-plugin-cc

English | [中文](README_CN.md)

Bridge Gemini CLI workflows into a Claude Code-friendly adapter layer.

## Goal

This repository is a provider-specific implementation repo under the umbrella project:

- <https://github.com/Harzva/everything-agent-cli-to-claude-code>

It focuses on Gemini-specific details:

- CLI invocation
- auth expectations
- model mapping
- workflow wrappers
- future skill packaging

## Current Scope

First generation is intentionally lightweight.

It currently includes:

- a command wrapper for Gemini CLI
- a small example workflow
- a short design note

## Files

- `bin/gemini-review.sh`
- `docs/design.md`
- `examples/review-prompt.txt`

## Status

- repository status: prototype
- command wrapper status: initial
- auth mode: local Gemini CLI credentials
