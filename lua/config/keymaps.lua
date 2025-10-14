local M = {}

function M.setup()
  -- Keymaps para debug
  vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
  vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
  vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
  vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

  -- NvimTree keymaps
  vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle NvimTree' })
  vim.keymap.set('n', '<Leader>e', ':NvimTreeFocus<CR>', { silent = true, desc = 'Focus NvimTree' })
  vim.keymap.set('n', '<Leader>w', '<C-w>w', { silent = true, desc = 'Alternar entre janelas' })

  -- Debug e TagBar
  vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
  vim.keymap.set('n', '<Leader>t', ':TagbarToggle<CR>', { silent = true })

  -- LSP keymaps
  vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { desc = 'Abrir diagnóstico flutuante' })
  vim.keymap.set('n', '<Leader>k', vim.lsp.buf.hover, { desc = 'Exibir informações do símbolo' })
  vim.keymap.set('n', '<Leader>df', vim.lsp.buf.definition, { desc = 'Ir para definição' })
  vim.keymap.set('n', '<Leader>dc', vim.lsp.buf.declaration, { desc = 'Ir para declaração' })
  vim.keymap.set('n', '<Leader>i', vim.lsp.buf.implementation, { desc = 'Listar implementações' })
  vim.keymap.set('n', '<Leader>dt', vim.lsp.buf.type_definition, { desc = 'Ir para definição de tipo' })
  vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.references, { desc = 'Listar referências' })
  vim.keymap.set('n', '<Leader>s', vim.lsp.buf.signature_help, { desc = 'Exibir assinatura da função' })
  vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, { desc = 'Renomear símbolo' })
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { desc = 'Ações de código' })
  vim.keymap.set('n', '<Leader>db', vim.diagnostic.goto_prev, { desc = 'Ir para diagnóstico anterior' })
  vim.keymap.set('n', ']<Leader>dp', vim.diagnostic.goto_next, { desc = 'Ir para próximo diagnóstico' })
end

return M