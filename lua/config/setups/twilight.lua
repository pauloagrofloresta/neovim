local M = {}

function M.setup()
  require("twilight").setup({
    dimming = {
      alpha = 0.25,
      color = { "Normal", "#ffffff" },
      inactive = false,
    },
    context = 1,
    treesitter = false,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
      "class",
    },
    exclude = {},
  })
end

return M