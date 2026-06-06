---
title: "Prompt Engineering 基础"
description: "总结 prompt 的角色设定、任务约束、示例设计和输出格式控制。"
date: 2026-02-10
tags: ["Prompt", "Instruction", "Evaluation"]
category: "应用开发"
draft: false
---

## Prompt 的作用

Prompt 是人类意图和模型行为之间的接口。好的 prompt 会明确任务、边界、输入格式、输出格式和质量标准。

## 常用技巧

- 明确角色和目标，但不要堆砌无关设定。
- 提供少量高质量示例。
- 使用结构化输出，例如 JSON、表格或分段文本。
- 把复杂任务拆成可验证步骤。
- 用评测样例反复检查稳定性。

## 工程视角

Prompt 不应该只停留在手工调参。更好的方式是把 prompt 版本化，配合测试集、日志和回归评测，让模型行为可追踪。
