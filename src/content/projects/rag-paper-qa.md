---
title: "RAG 论文问答系统"
description: "面向论文阅读的检索增强问答系统，支持文档切分、向量检索、引用片段和答案生成。"
date: 2026-03-01
techStack: ["Python", "LangChain", "FAISS", "Embedding", "LLM"]
github: "https://github.com/your-name/rag-paper-qa"
demo: "/projects/rag-paper-qa/demo"
demoImage: "/demo/rag-paper-qa.png"
featured: true
---

## 项目目标

帮助研究者快速围绕论文内容提问，并返回带引用片段的答案。

## 核心模块

- PDF 文本抽取与 chunk 切分。
- Embedding 向量化和 FAISS 检索。
- rerank 与上下文压缩。
- 答案生成与引用展示。

## 后续计划

补充多论文对比、公式区域识别和阅读卡片自动生成。
