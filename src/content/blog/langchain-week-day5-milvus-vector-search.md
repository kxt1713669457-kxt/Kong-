---
title: "LangChain 学习 Day 5：Milvus 向量库与检索实践"
description: "围绕 Collection、Schema、Index、Insert、Delete、Vector Search、Scalar Search 和结果融合理解 Milvus。"
date: 2026-07-24
tags: ["Milvus", "Vector Database", "RAG", "LangChain", "面试八股"]
category: "大模型框架"
draft: false
---

![Milvus 向量检索系统](/images/langchain-week/milvus-search.svg)

今天重点是 Milvus。RAG 需要一个能存储向量、执行相似度搜索、支持元数据过滤并承受一定数据规模的系统，Milvus 就是常见选择之一。

从文档内容看，Milvus 学习不能只停留在“向量数据库”这个名词上，而要理解 Collection、Schema、数据类型、索引、插入、删除、向量检索、标量检索和结果融合这些工程概念。

## Collection 与 Schema

Collection 可以理解为一张向量数据表。Schema 定义每条数据有哪些字段，例如主键、原始文本、向量字段、来源、页码、章节、时间戳、标签等。对于 RAG 项目来说，元数据字段非常重要，因为它能支持按文档来源、权限范围或更新时间做过滤。

向量字段可以是 dense vector，也可以结合 sparse vector。dense vector 更适合语义相似度，sparse vector 更接近关键词匹配。实际项目常会融合多路召回，再做重排。

## 索引与检索

索引用于加速向量相似度搜索。选择索引时需要权衡召回质量、查询速度、内存占用和构建成本。写入数据后，问答阶段会根据用户问题生成 query embedding，在 Milvus 中做 TopK 搜索，再把召回片段交给后续 Prompt。

标量检索也很关键。比如用户只想问某篇论文、某个项目或某个时间段的资料，就需要结合元数据过滤，而不是在全库里盲目搜索。

## 结果融合与生成

文档中还涉及类似 RRF 的排序融合思想。它的意义是把不同检索通道的结果进行融合，降低单一召回方式的偏差。融合后还可以做去重、上下文压缩和引用拼接，最后交给模型生成答案。

## 面试八股问答

**Q：Milvus 在 RAG 中承担什么角色？**  
A：Milvus 负责存储文档向量和元数据，并在用户提问时执行相似度搜索与过滤召回，为大模型生成答案提供外部知识上下文。

**Q：向量检索和标量过滤为什么要结合？**  
A：向量检索负责语义相关性，标量过滤负责业务约束，例如权限、时间、文档类型和来源。两者结合才能让召回既相关又合规。

**Q：为什么需要结果重排或融合？**  
A：单一召回方式可能漏召或误召。融合关键词召回、向量召回和业务过滤后，再重排，可以提升最终上下文质量。

## HR / 简历表达

可以写成：“熟悉 Milvus 向量库在 RAG 中的使用，能够设计 Collection Schema、构建索引、写入文档向量，并结合向量检索、标量过滤和结果重排提升召回质量。”

## 今日复盘

Milvus 的学习重点是把“语义检索”落成数据库设计问题。一个合格的 RAG 项目，不只是会调用 embedding，更要能设计字段、权限、索引、召回和评测策略。
