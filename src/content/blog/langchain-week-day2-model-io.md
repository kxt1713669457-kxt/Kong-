---
title: "LangChain 学习 Day 2：Model I/O 与结构化输出"
description: "梳理模型平台接入、环境变量管理、OpenAI SDK、LangChain init_chat_model、Ollama 本地模型和输出解析。"
date: 2026-07-21
tags: ["LangChain", "Model I/O", "Ollama", "OutputParser", "面试八股"]
category: "大模型框架"
draft: false
---

![Model I/O 与结构化输出流程](/images/langchain-week/model-io-flow.svg)

今天的重点是 Model I/O。它看起来只是“把问题发给模型，再拿到回答”，但在真实项目里，Model I/O 决定了模型调用是否稳定、结果能否被程序消费、不同模型平台能否平滑替换。

文档里涉及多个模型平台：CloseAI、OpenRouter、阿里云百炼、百度千帆、硅基流动等。工程上最重要的是把 `API_KEY`、`BASE_URL` 和模型名从代码中抽离，用 `.env` 或系统环境变量管理。这样既能保护密钥，也方便在开发、测试、部署环境中切换模型服务。

## 模型调用链路

基础调用可以用 OpenAI SDK，也可以使用 LangChain 的 `init_chat_model`。SDK 更贴近底层 API，适合理解参数与响应结构；LangChain 更适合把模型调用接入后续的 PromptTemplate、OutputParser、Runnable 和 Agent。

本地模型部分使用 Ollama。核心流程是安装 Ollama、下载模型、指定模型目录、通过 `ollama run qwen3:8b` 验证，再在 LangChain 中调用本地模型。本地部署的价值不只是省成本，也方便在离线、隐私数据和实验验证场景中快速迭代。

## 输出解析

输出解析是今天最需要重视的部分。大模型自然语言回答对人友好，但对程序不稳定。项目中应该尽量把输出约束为 JSON 或 Pydantic schema，并通过 JsonOutputParser、PydanticOutputParser 或模型供应商的结构化输出能力，把结果转成可校验的数据对象。

提示词里也要明确格式要求，例如字段名、字段类型、是否允许空值、输出语言和错误处理方式。否则看似“回答正确”，实际进入业务系统时可能因为字段缺失、格式不合法而失败。

## 面试八股问答

**Q：Model I/O 包含哪些内容？**  
A：包含输入提示词构造、模型调用、消息格式管理、模型响应接收和输出解析。LangChain 中通常由 Prompt、ChatModel、OutputParser 等组件共同完成。

**Q：为什么要做结构化输出？**  
A：因为业务系统需要稳定字段，而不是一段不可控自然语言。结构化输出能提升结果可校验性，方便入库、渲染、评测和后续流程编排。

**Q：本地模型和云端模型怎么选？**  
A：云端模型能力强、接入快，适合产品验证；本地模型更适合隐私数据、成本控制、离线实验和可控部署。实际项目中可以通过统一模型接口做切换。

## HR / 简历表达

可以写成：“熟悉多模型平台接入方式，能够通过环境变量管理密钥与服务地址，并使用 LangChain 完成 PromptTemplate、ChatModel、OutputParser 的结构化调用链路。”

## 今日复盘

Model I/O 的关键不是“能不能调通”，而是“能不能稳定交付”。一个可靠的大模型应用，必须从第一天就考虑密钥管理、模型替换、输出解析和异常处理。
