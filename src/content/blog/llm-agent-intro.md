---
title: "LLM Agent 入门"
description: "介绍 Agent 的规划、记忆、工具调用和执行反馈循环。"
date: 2026-02-18
tags: ["Agent", "Tool Calling", "Planning"]
category: "工程系统"
draft: false
---

## Agent 的基本结构

LLM Agent 通常由大模型、工具集合、任务状态、记忆模块和执行控制器组成。模型负责理解目标和选择动作，系统负责执行动作并把结果反馈给模型。

## 关键能力

1. Planning：把复杂目标拆成步骤。
2. Tool Calling：调用搜索、数据库、代码执行等外部工具。
3. Memory：保存用户偏好、历史状态或长期知识。
4. Reflection：根据执行结果修正下一步策略。

## 风险点

Agent 容易出现无效循环、工具误用和权限风险。工程上需要设置最大步数、工具 schema、权限边界和可观测日志。
