import mdx from "@astrojs/mdx";
import { defineConfig } from "astro/config";

const base = process.env.BASE_PATH ?? "/";
const site = process.env.SITE ?? "https://example.github.io";

export default defineConfig({
  site,
  base,
  output: "static",
  integrations: [mdx()],
});
