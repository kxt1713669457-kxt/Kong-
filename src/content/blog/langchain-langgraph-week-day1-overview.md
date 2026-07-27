---
title: "LangChain 与 LangGraph 一周学习复盘：框架认知篇"
description: "把 LangChain 和 LangGraph 放在同一张工程地图里理解：一个偏应用组件编排，一个偏状态图与复杂 Agent 控制。"
date: 2026-07-20
tags: ["LangChain", "LangGraph", "LLM", "Agent", "面试八股"]
category: "大模型框架"
draft: false
---

![LangChain 与 LangGraph 一周学习路线](/images/langchain-week/week-map.svg)

这一周的学习主线是两件事：先用 LangChain 理解大模型应用开发的常用模块，再用 LangGraph 理解复杂 Agent 为什么需要状态图、检查点和可控流程。LangChain 更像一套大模型应用开发工具箱，覆盖模型调用、提示词模板、输出解析、链式编排、RAG 和工具调用；LangGraph 则更像“执行控制层”，重点解决多节点、多轮状态、人机协同和失败恢复。

从面试角度看，不能只说“LangChain 是一个调用大模型的框架”。更专业的表述应该是：LangChain 把 Prompt、Model、Parser、Retriever、Tool 等能力抽象成可组合组件，使大模型应用从脚本调用升级为可维护的工程流水线。它解决的是“怎么把一次模型调用放进业务流程里”的问题。

![LangChain 核心模块架构](/images/langchain-week/langchain-architecture.svg)

## 今日学习重点

LangChain 的核心模块可以拆成四类。第一类是 Model I/O，负责输入提示词、模型调用和输出解析。第二类是 Chains，负责把多个步骤串联或并联。第三类是 Retrieval / RAG，负责把外部知识库接入生成流程。第四类是 Agents，负责让模型根据任务选择工具、执行动作并根据结果继续推理。

LangGraph 的定位不是替代 LangChain 的全部能力，而是处理更复杂的执行流。比如一个 Agent 需要多轮规划、检索、调用工具、人工审核、失败重试和断点恢复，这时单纯的 Chain 会显得不够清晰，状态图更容易表达流程边界。

## 面试八股问答

**Q：为什么已经能直接调 OpenAI SDK，还要用 LangChain？**  
A：直接 SDK 适合简单调用，但工程项目还需要提示词模板管理、输出解析、RAG 接入、工具调用、链式编排和可观测调试。LangChain 将这些环节抽象为统一接口，降低多模型、多组件组合的维护成本。

**Q：LangChain 和 LangGraph 的区别是什么？**  
A：LangChain 偏组件生态和应用链路，适合构建 Prompt、Model、Retriever、Tool 组合；LangGraph 偏状态化流程控制，适合复杂 Agent、多分支流程、循环控制、人工审核和断点续传。

**Q：大模型框架最重要的工程价值是什么？**  
A：把不可控的一次性模型调用，改造成输入可约束、过程可组合、输出可解析、失败可恢复、效果可评测的工程系统。

## HR / 简历表达

可以写成：“系统学习 LangChain 与 LangGraph，掌握 Model I/O、Chains、Retrieval、Agents、StateGraph、Checkpoint 等模块，能够将大模型 API 调用封装为可维护的 RAG 与 Agent 应用流程。”

## 今日复盘

今天先建立框架地图：LangChain 解决大模型应用组件化，LangGraph 解决复杂 Agent 的状态化编排。后续几天会按模型调用、链式编排、RAG、Milvus、Agent、LangGraph 状态图逐步展开。
