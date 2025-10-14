local M = {}

function M.setup()
  local dap = require('dap')
  local dapui = require('dapui')

  dapui.setup()
  require('dap-go').setup()
  require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
end

return M