---
title: "Transformer 架构入门"
description: "从注意力机制、位置编码和编码器-解码器结构理解 Transformer 为什么适合大模型。"
date: 2026-01-05
tags: ["Transformer", "Attention", "LLM"]
category: "模型原理"
draft: false
---

## 核心问题

Transformer 的关键变化是用自注意力替代循环结构，让模型可以并行处理序列，并直接建模任意两个 token 之间的关系。

## 主要模块

- Token Embedding：把离散 token 映射到连续向量空间。
- Positional Encoding：补充序列顺序信息。
- Multi-Head Attention：在多个子空间中学习不同关系。
- Feed Forward Network：对每个位置进行非线性变换。
- Residual + LayerNorm：稳定深层网络训练。

## 学习建议

先手推一次 scaled dot-product attention，再阅读 encoder block 和 decoder block 的区别。理解 mask 后，再看 GPT 类模型的自回归生成会顺畅很多。
