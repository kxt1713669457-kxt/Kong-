---
title: "LangChain 学习 Day 3：Chains 与 Runnable 编排"
description: "理解 Chains、RunnableSequence、RunnableParallel 和 LCEL，掌握把模型调用组合成工程流水线的方法。"
date: 2026-07-22
tags: ["LangChain", "Chains", "Runnable", "LCEL", "面试八股"]
category: "大模型框架"
draft: false
---

![Runnable 链式编排](/images/langchain-week/runnable-chain.svg)

今天学习 Chains。单次模型调用只能解决一个局部问题，但真实业务往往需要“输入清洗 -> 检索上下文 -> 组装提示词 -> 模型生成 -> 输出解析 -> 结果评测”。Chains 的作用就是把这些步骤组织成稳定流程。

LangChain 新版本中更推荐围绕 Runnable 来理解链式编排。`RunnableSequence` 用于顺序执行，前一步输出会进入下一步；`RunnableParallel` 用于并行执行，比如同时检索知识库、查询历史记录、生成用户画像摘要，再把结果合并给下游 Prompt。

## Runnable 的工程价值

Runnable 的好处是统一接口。Prompt、Model、Parser、Retriever 都可以被当作可运行单元组合起来。这样代码从“函数套函数”变成“可读的流程定义”，后续替换模型、替换解析器或插入日志节点都更简单。

如果面试官问“你怎么设计一个 RAG 问答链”，不能只说“先检索再生成”。更好的回答是：我会把问题改写、向量检索、上下文压缩、提示词组装、模型生成、结构化解析和引用校验拆成 Runnable 节点，再通过 Sequence 或 Parallel 组合。

## 常见链路设计

最基础链路是 Prompt -> Model -> Parser。进阶一点会加入 Retriever，把外部知识检索结果作为上下文输入。再进一步可以并行获取多路信息，例如向量库召回、关键词召回和会话历史，然后统一交给重排或摘要节点。

在复杂项目中，Chains 还需要考虑失败降级。比如检索为空时走通用回答，解析失败时重试一次，模型超时时切换备用模型。这些不是算法炫技，而是上线系统必须面对的稳定性问题。

## 面试八股问答

**Q：Chain 和普通函数调用有什么区别？**  
A：普通函数调用只关注代码执行，Chain 更强调大模型应用中的组件化编排。它把 Prompt、Model、Retriever、Parser 等统一成可组合节点，方便扩展、替换、调试和复用。

**Q：RunnableSequence 和 RunnableParallel 分别适合什么场景？**  
A：Sequence 适合严格前后依赖的流程，例如提示词到模型再到解析器；Parallel 适合多路信息并行准备，例如同时检索知识库、读取历史和计算附加上下文。

**Q：LCEL 的优势是什么？**  
A：LCEL 让链路声明更简洁，组件边界更清晰，同时便于异步、批处理、流式输出和运行时观测。

## HR / 简历表达

可以写成：“掌握 LangChain Runnable 编排思想，能够使用 RunnableSequence 与 RunnableParallel 组织 RAG 和问答链路，并设计结构化解析、异常重试与降级流程。”

## 今日复盘

Chains 是从 Demo 走向工程的分水岭。真正的项目能力不在于能写一个 prompt，而在于能把多步骤流程拆清楚，并让每个环节都有输入、输出和异常边界。
