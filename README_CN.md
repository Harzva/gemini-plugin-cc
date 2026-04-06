# gemini-plugin-cc

[English](README.md) | 中文

这是 `everything-agent-cli-to-claude-code` 体系下的 Gemini 独立子仓库。

总仓库：

- <https://github.com/Harzva/everything-agent-cli-to-claude-code>

## 仓库目标

这个仓库专门沉淀 Gemini 相关的实现细节：

- Gemini CLI 调用方式
- 登录与认证说明
- 模型映射
- workflow 包装
- 后续 skill 封装

## 当前范围

第一版先做轻量命令封装，不追求一开始就做成复杂插件。

目前包含：

- Gemini 命令包装脚本
- 一个简单示例 prompt
- 一份设计文档

## 当前状态

- 仓库状态：prototype
- 命令包装状态：initial
- 认证方式：依赖本机 Gemini CLI 已登录
