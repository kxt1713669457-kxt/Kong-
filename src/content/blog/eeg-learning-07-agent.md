---
title: "从固定 RAG 到受控 Agent：工具、计划与观察"
description: "通过白名单和参数契约理解 Agent 如何真正调用工具。"
date: 2026-10-20
tags: ["Agent", "LangGraph", "MCP"]
category: "大模型框架"
draft: false
---

> 本文为事后整理的系列回顾，日期用于栏目归档；实际学习与工程时间以文中说明为准。[系列总览](../eeg-learning-01-roadmap/)。

<img src="../../images/eeg-learning/eeg-learning-07-agent.svg" alt="从固定 RAG 到受控 Agent：工具、计划与观察流程图" />

## 模型提出调用，不等于工具已经执行

固定 RAG 图通常按预设步骤运行；Agent 可以依据任务提出有限计划，再由程序决定是否允许执行。这里最关键的分工是：模型产生工具名称与参数建议，后端检查白名单和 schema，再运行真实 handler。一个看起来合理的工具调用 JSON，并不是实际查询完成的证明。

项目把本地知识检索、网页搜索、文档上下文读取、证据比较等能力封装为工具。网页搜索返回的摘要和 URL 并不自动等于完整网页正文；读取相邻切片也必须限制在对应文档和索引批次内。

## 一份计划如何落地

记录中的 `/agent/query` 先生成并检查完整计划，再按依赖执行；计划非法时可有限重试，仍不合法就结束，不应先执行其中一部分。执行轨迹保存工具状态、来源和耗时，最终回答仍需使用实际拿到的证据。

10 月 27 日进一步加入执行后观察和有限补查：根据已有结果决定是否进行最多一次补充工具调用，而不是无限循环。工具预算、白名单和参数检查依然有效。这是特定工程约束下的有限 Agent，并非已经具备任意自主研究能力。

## 为什么要做这些限制

限制能让失败变得可解释：是参数不合法、工具失败、没有来源，还是证据不足？对学习而言，把计划、执行与观察拆开，比仅展示一段最终答案更容易发现问题。

参考：[LangGraph Workflows and agents](https://docs.langchain.com/oss/python/langgraph/workflows-agents)；[LangChain Tools](https://docs.langchain.com/oss/python/langchain/tools)。
