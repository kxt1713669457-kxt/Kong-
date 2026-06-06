---
title: "本地部署大模型"
description: "记录本地推理环境、量化模型、推理服务和资源评估的基础路径。"
date: 2026-02-01
tags: ["Deployment", "Quantization", "Inference"]
category: "部署实践"
draft: false
---

## 为什么要本地部署

本地部署适合学习推理链路、保护私有数据、降低实验成本，也方便验证 RAG、Agent 和微调模型的端到端效果。

## 常见选择

- llama.cpp：适合 GGUF 量化模型和 CPU/GPU 混合推理。
- Ollama：适合快速拉起本地模型服务。
- vLLM：适合高吞吐服务化推理。
- Transformers：适合研究和自定义模型逻辑。

## 评估维度

部署前要估算显存、上下文长度、吞吐、首 token 延迟和并发需求。一个可用系统的关键不是“能跑”，而是稳定、可监控、可恢复。
