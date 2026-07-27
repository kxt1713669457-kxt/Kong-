---
title: "LangGraph 学习 Day 7：状态图、节点、边与可恢复 Agent"
description: "复盘 LangGraph 的 StateGraph、状态 schema、Reducer、Checkpoint、节点缓存、重试、人工审核和条件边。"
date: 2026-07-26
tags: ["LangGraph", "StateGraph", "Checkpoint", "Agent", "面试八股"]
category: "大模型框架"
draft: false
---

![LangGraph 状态图执行模型](/images/langchain-week/langgraph-state-flow.svg)

今天把学习重点放到 LangGraph。LangGraph 适合处理复杂多步骤 Agent：流程中有共享状态、有条件分支、有循环、有人工审核、有失败恢复，也可能需要追踪每一步历史状态。

如果 LangChain 更像“组件编排工具箱”，LangGraph 就更像“状态化流程引擎”。它通过 StateGraph 定义节点和边，每个节点读取状态、返回状态更新，Reducer 负责合并更新，Checkpoint 负责保存执行过程。

## 快速入门流程

LangGraph 的基础流程是：定义状态结构，编写节点函数，创建 `StateGraph`，添加节点，添加边，编译图，然后调用图。文档里的示例围绕 RAG + Web Search 问答图展开，体现了 LangGraph 把多个能力组织成可控流程的思路。

状态定义非常重要。可以用 `state_schema` 定义内部共享状态，也可以用 `input_schema` 和 `output_schema` 隔离输入输出。这样外部调用方不需要知道图内部所有字段，节点之间也能保持清晰的数据边界。

## Reducer 与 Checkpoint

Reducer 用于合并节点返回的状态更新。例如多个节点都更新消息列表时，Reducer 可以定义是覆盖、追加还是自定义合并。没有清晰 Reducer，复杂图很容易出现状态覆盖或数据丢失。

Checkpoint 解决多轮上下文和断点续传。调用图时传入 `thread_id`，图执行过程会保存状态。后续可以用同一个 thread_id 继续执行，或者在失败后从断点恢复。这一点是 LangGraph 区别于普通 Chain 的关键能力。

## 节点、边与人机协同

节点是执行单元，可以负责检索、生成、评估、调用工具或人工审核。节点可以配置缓存，避免重复计算；也可以配置重试，提高不稳定工具或模型调用的容错性。

边定义执行方向。普通边表示固定流程，条件边表示根据状态决定下一步，可控制循环则适合“生成 -> 评估 -> 不合格则重试”的场景。人工审核节点适合高风险动作，例如发送消息、提交代码或调用外部系统前先等待确认。

## 面试八股问答

**Q：LangGraph 为什么适合复杂 Agent？**  
A：因为它用状态图表达流程，支持共享状态、条件分支、循环、Checkpoint、历史状态查看、节点缓存、重试和人工审核，比线性 Chain 更适合长流程 Agent。

**Q：Checkpoint 有什么作用？**  
A：Checkpoint 可以保存图执行过程中的状态，用于多轮对话记忆、失败恢复、断点续传和历史追踪。

**Q：Reducer 解决什么问题？**  
A：Reducer 定义多个节点更新同一状态字段时如何合并，避免状态覆盖和数据冲突。

## HR / 简历表达

可以写成：“熟悉 LangGraph StateGraph 编排方式，能够定义状态 schema、节点、边、条件路由、Reducer 和 Checkpoint，并用于构建可恢复、可审核的复杂 Agent 流程。”

## 一周总结

这一周从 LangChain 的 Model I/O、Chains、RAG、Milvus、Agent，一直学习到 LangGraph 的状态图。整体收获是：大模型开发不是只会调 API，而是把模型能力组织进稳定、可观测、可恢复、可评测的工程系统。
