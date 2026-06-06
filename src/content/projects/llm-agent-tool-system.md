---
title: "LLM Agent 工具调用系统"
description: "一个面向任务执行的 Agent 原型，支持工具 schema、任务规划、执行日志和失败恢复。"
date: 2026-03-24
techStack: ["TypeScript", "Node.js", "Tool Calling", "Agent", "Observability"]
github: "https://github.com/your-name/llm-agent-tool-system"
demo: "/projects/llm-agent-tool-system/demo"
demoImage: "/demo/llm-agent-tool-system.png"
featured: false
---

## 项目目标

探索大模型如何在受控权限下调用工具完成多步骤任务。

## 系统设计

- 工具注册与参数 schema 校验。
- Planner 生成候选步骤。
- Executor 调用工具并记录结果。
- Controller 限制最大轮次并处理异常。

## 工程重点

Agent 系统需要可观测、可暂停、可恢复。只看最终答案不够，还要能检查每一步为什么发生。
