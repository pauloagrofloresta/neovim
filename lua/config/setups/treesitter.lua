local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
      "python", "ruby", "javascript", "arduino", "awk", "c_sharp", "cmake",
      "clojure", "asm", "cpp", "css", "csv", "dart", "dockerfile", "diff",
      "editorconfig", "erlang", "gleam", "go", "gomod", "helm", "haskell",
      "html", "htmldjango", "java", "json", "json5", "kotlin", "nasm",
      "ocaml", "ocaml_interface", "proto", "regex", "rust", "sql", "svelte",
      "toml", "typescript", "yaml", "vue", "xml",
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
  })
end

return M