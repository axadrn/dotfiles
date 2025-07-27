return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "templ", "astro", "javascript", "typescript", "react", "html", "css", "scss", "sass" },
  root_markers = { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts", "postcss.config.js", "postcss.config.cjs", "package.json", ".git" },
  init_options = {
    userLanguages = {
      templ = "html"
    }
  },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      includeLanguages = {
        templ = "html",
      },
    },
  },
}