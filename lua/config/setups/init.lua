local M = {}

function M.setup()
  -- Configurações básicas que não dependem de plugins
  require('config.setups.nvim-tree').setup()
  require('config.setups.bufferline').setup()
  require('config.setups.lualine').setup()
  require('config.setups.gitsigns').setup()
  require('config.setups.autopairs').setup()
  require('config.setups.scrollbar').setup()
  require('config.setups.devicons').setup()
  require('config.setups.treesitter').setup()
  require('config.setups.twilight').setup()
  require('config.setups.blame').setup()
  require('config.setups.comment').setup()
  require('config.setups.conform').setup()
  require('config.setups.codecompanion').setup()

  -- LSP e autocompletion
  require('config.setups.lsp').setup()
  require('config.setups.cmp').setup()

  -- Debug
  require('config.setups.dap').setup()
end

return M