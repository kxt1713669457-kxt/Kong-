---
title: "注意力机制学习笔记"
description: "从 Query、Key、Value 的计算过程理解自注意力为什么能捕捉长距离依赖。"
date: 2026-02-24
tags: ["Attention", "Transformer", "QKV"]
category: "模型原理"
draft: false
---

## 为什么关注注意力

注意力机制是理解 Transformer 的入口。它让模型在处理一个 token 时，可以动态关注序列中的其他 token，而不是只依赖固定窗口或循环状态。

## 学习重点

先理解 Q、K、V 的来源，再看点积、缩放、softmax 和加权求和。多头注意力可以看成在多个表示子空间里同时学习关系。

## 复盘问题

阅读代码时要重点观察张量维度变化。只要能说清楚 batch、head、sequence length 和 hidden size 的变化，很多实现细节就会变得清楚。
