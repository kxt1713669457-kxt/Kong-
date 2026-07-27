# AGENTS.md

## 项目定位

这是 Kong 的个人技术博客，主要用于记录大模型学习笔记、项目作品、论文阅读、研究记录和个人简历。站点面向 GitHub Pages 部署，因此保持为纯静态网站。

## 维护指令

- 以后如果对本项目做任何更改，包括代码、样式、内容、配置、部署流程、资源文件或项目结构调整，都必须同步检查并更新本文件。
- 如果更改影响技术路径、目录结构、内容维护方式、部署方式、设计原则或开发命令，必须在本文件中补充说明。
- 如果更改不影响本文件现有说明，也需要在交付前确认本文件仍然准确。
- `README.md` 用于 GitHub 仓库首页展示，内容应与本文件保持同步；更新本文件后，需要同步更新 `README.md`。

## 技术路径

- 框架：Astro
- 语言：TypeScript
- 样式：Tailwind CSS，通过 PostCSS 接入
- 内容：Markdown / MDX
- 内容集合：
  - `src/content/blog` 存放博客文章
  - `src/content/projects` 存放项目记录
- 部署：GitHub Actions 自动构建并发布到 GitHub Pages
- 输出：静态 HTML、CSS 和图片资源，适合部署到 GitHub Pages

## 目录说明

- `src/pages`：页面路由，包括首页、文章、分类页、项目、项目演示页、研究、关于、简历、联系页
- `src/components`：可复用组件，包括导航、页脚、首页介绍、文章卡片、项目卡片和技术标签
- `src/layouts`：全站基础布局
- `src/styles/global.css`：全局样式和博客阅读样式
- `src/content.config.ts`：内容集合 schema
- `src/content/blog`：博客文章 Markdown / MDX
- `src/content/projects`：项目记录 Markdown / MDX
- `src/utils/categories.ts`：文章分类 slug 与跳转路径工具
- `src/utils/paths.ts`：GitHub Pages 子路径适配工具
- `public/demo`：项目概念演示图
- `public/images`：站点图片资源，包括个人头像
- `public/images/langchain-week`：LangChain / LangGraph 一周学习专题配图
- `.github/workflows/deploy.yml`：GitHub Pages 自动部署流程

## 开发命令

```bash
npm run dev
npm run build
npm run preview
```

## 自动推送脚本

- `deploy.bat` 是 Windows 一键推送脚本。
- 双击运行后会先执行 `npm run build`。
- 构建通过后会自动执行 `git add .`、创建提交，并推送到 `origin/main` 与 `security/main`。
- 如果需要自定义提交信息，可以在命令行中传入参数，例如：

```bat
deploy.bat "Update blog content"
```

- 如果构建失败，脚本会停止，不会推送到 GitHub。

## Cloudflare Pages 部署

- `.github/workflows/cloudflare-pages.yml` 用于部署到 Cloudflare Pages。
- 每次推送到 `main` 后，workflow 会执行 `npm ci`、`npm run build`，并将 `dist` 目录部署到 Cloudflare Pages。
- 当前 Cloudflare Pages 项目名：`kong-blog`
- 当前 Cloudflare Pages 默认访问域名：`https://kong-blog.pages.dev`
- workflow 需要在 GitHub 仓库中配置以下 Repository secrets：
  - `CLOUDFLARE_API_TOKEN`
  - `CLOUDFLARE_ACCOUNT_ID`
  - `CLOUDFLARE_PROJECT_NAME`
- 如果这些 secrets 没有配置完整，workflow 会构建项目但跳过 Cloudflare 部署，避免仓库 Actions 直接失败。
- Cloudflare Pages 项目建议使用以下配置：
  - Production branch：`main`
  - Build command：`npm run build`
  - Build output directory：`dist`

## 内容维护方式

新增博客文章时，在 `src/content/blog` 下创建 Markdown 或 MDX 文件，并填写：

```yaml
title: "文章标题"
description: "文章摘要"
date: 2026-01-01
tags: ["标签"]
category: "分类"
draft: false
```

新增项目时，在 `src/content/projects` 下创建 Markdown 或 MDX 文件，并填写：

```yaml
title: "项目标题"
description: "项目摘要"
date: 2026-01-01
techStack: ["技术栈"]
github: "https://github.com/your-name/project"
demo: "/projects/project-slug/demo"
demoImage: "/demo/project-slug.png"
featured: true
```

新增文章分类时，需要同步更新 `src/utils/categories.ts` 中的分类映射，确保首页、文章页和分类页都能正确跳转。

当前已使用的专题分类包括：

- `大模型框架`：LangChain、LangGraph、Agent、RAG、Milvus 等框架学习与面试复盘内容。

## 设计原则

- 优先保证文章阅读体验，首页应像博客索引而不是产品落地页。
- 除 LLM、RAG、LoRA、Agent、GitHub、Markdown、MDX、TypeScript 等专有名词外，界面文案尽量使用中文。
- 个人身份信息只在关于页中详细呈现，首页和公共导航区域保持简洁。
- 保持静态部署友好，不引入需要服务端运行的功能。
- 新增组件时优先复用现有视觉规范：纸面背景、细边框、低饱和强调色、清晰标题层级。
