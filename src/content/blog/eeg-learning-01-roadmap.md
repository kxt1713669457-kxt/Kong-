---
title: "从 RAG 到 EEG 智库 Agent：我的学习路线和项目全景"
description: "从项目目标、技术栈到一个月的学习路线，梳理 EEG 智库 Agent 的整体设计。"
date: 2026-09-30
tags: ["EEG", "RAG", "Agent", "学习路线"]
category: "学习路线"
draft: false
---

> 本文为事后整理的系列回顾，日期用于栏目归档；实际学习与工程时间以文中说明为准。[系列总览](../eeg-learning-01-roadmap/)。

<img src="../../images/eeg-learning/eeg-learning-01-roadmap.svg" alt="从 RAG 到 EEG 智库 Agent：我的学习路线和项目全景流程图" />

## 为什么做这个项目

学习大模型应用时，我想把零散知识放到同一个具体问题里：面对 EEG 论文、数据集说明和脑电分析任务，能否先找到可靠资料，再让系统调用受控工具，最后给出可追溯的结果？这个项目由已有 RAG 应用逐步扩展为 EEG 智库 Agent，重点是理解每一层的职责和边界。

这个系列依据项目代码和带教记录回顾整理。项目的课程记录从 **2026 年 10 月 7 日**开始；配合博客阅读节奏，文章归档在 9 月末至 10 月末。归档日期是栏目编排，不表示当日实际完成或发表。工程实现、运行和排错由带教协助完成，我主要沿着源码学习、复述设计并参与理解练习；工程通过不等于我独立完成所有实现。

## 技术栈地图

| 层次 | 技术 | 在项目中的作用 |
| --- | --- | --- |
| 接口与编排 | Python、FastAPI、图式工作流 | 接收请求，组织检索与受控执行 |
| 数据准备 | MinerU、Markdown、DOCX 适配 | 解析多格式资料，保留结构和图片 |
| 存储与检索 | MinIO、MongoDB、Milvus | 分别管理原件、会话与任务、向量索引 |
| 检索模型 | BGE-M3、BGE reranker | 编码候选与对候选重新排序 |
| 工具与模型 | MCP、CBraMod | 网页检索接入、已登记脑电样本表征 |

## 我的学习顺序

先从请求进入后端开始，再看文件入库和切块，然后学习向量检索、HyDE、RRF 和重排。之后把 RAG 封装成 Agent 工具，加入有限计划与观察，最后接入单样本 EEG 编码器和任务工作台。每一环都问自己三个问题：输入输出是什么、失败时发生什么、如何核对结果。

系列导航：[请求与架构](../eeg-learning-02-request/) · [文档入库](../eeg-learning-03-ingestion/) · [切块与向量](../eeg-learning-04-chunking/) · [检索与重排](../eeg-learning-05-retrieval/) · [证据与引用](../eeg-learning-06-evidence/) · [Agent 工具](../eeg-learning-07-agent/) · [脑电模型](../eeg-learning-08-model/) · [工作台与复盘](../eeg-learning-09-workbench/)

参考：[LangGraph：Workflows and agents](https://docs.langchain.com/oss/python/langgraph/workflows-agents)。
