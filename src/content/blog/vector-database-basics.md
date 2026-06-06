---
title: "向量数据库基础"
description: "梳理向量数据库在 RAG 系统中的作用，包括 embedding、索引、召回和元数据过滤。"
date: 2026-03-02
tags: ["Vector DB", "Embedding", "RAG"]
category: "工程系统"
draft: false
---

## 向量数据库做什么

向量数据库负责存储文本、图片或其他数据的向量表示，并根据相似度快速召回相关内容。在 RAG 系统中，它通常承担知识检索入口的角色。

## 常见概念

- embedding：把文本映射到语义向量空间。
- index：加速近似最近邻检索的数据结构。
- top-k：控制召回候选数量。
- metadata filter：按文档来源、章节、时间等字段过滤。

## 工程注意

向量数据库不是越复杂越好。早期项目可以先用 FAISS 或 Chroma 验证流程，再根据数据规模、权限控制和部署需求选择更完整的方案。
