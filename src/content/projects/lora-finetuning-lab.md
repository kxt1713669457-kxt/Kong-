---
title: "LoRA 微调实验"
description: "围绕指令数据构建的 LoRA 微调实验项目，记录数据准备、训练配置、评测和失败样例。"
date: 2026-03-12
techStack: ["PyTorch", "Transformers", "PEFT", "LoRA", "WandB"]
github: "https://github.com/your-name/lora-finetuning-lab"
demo: "/projects/lora-finetuning-lab/demo"
demoImage: "/demo/lora-finetuning-lab.png"
featured: true
---

## 项目目标

建立一套可复现的 LoRA 微调流程，便于比较不同数据集、rank 和学习率对模型行为的影响。

## 实验内容

- 指令数据清洗和模板化。
- PEFT 参数配置。
- 训练过程记录。
- 人工评测与自动评测结合。

## 经验记录

低质量数据会让模型更快学到错误模式。训练前的数据审计比训练后的反复调参更重要。
