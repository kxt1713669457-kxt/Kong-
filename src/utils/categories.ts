import { withBase } from "./paths";

export const categorySlugMap: Record<string, string> = {
  工程系统: "engineering-systems",
  应用开发: "application-development",
  部署实践: "deployment",
  模型微调: "model-finetuning",
  模型原理: "model-principles",
  论文阅读: "paper-reading",
  学习路线: "learning-roadmap",
  大模型框架: "llm-frameworks",
};

export function getCategorySlug(category: string): string {
  return categorySlugMap[category] ?? encodeURIComponent(category);
}

export function getCategoryHref(category: string): string {
  return withBase(`/blog/categories/${getCategorySlug(category)}`);
}

export function getCategoryNameBySlug(slug: string): string | undefined {
  return Object.entries(categorySlugMap).find(([, value]) => value === slug)?.[0];
}
