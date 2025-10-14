local M = {}

function M.setup()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "pyright",
      "gopls",
      "jdtls",
      "html",
      "ts_ls",
      "rust_analyzer",
      "bashls",
      "sqlls",
      "jsonls",
      "lua_ls",
    }
  })

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local servers = {
    'pyright',
    'gopls',
    'jdtls',
    'html',
    'ts_ls',
    'rust_analyzer',
    'bashls',
    'sqlls',
    'jsonls',
    'lua_ls',
    "django-template-lsp",
    "docker-language-server",
    "djlint",
  }

  for _, server in ipairs(servers) do
    vim.lsp.config[server] = {
      capabilities = capabilities
    }
  end
end

return M