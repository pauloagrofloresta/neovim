local M = {}

function M.setup()
  require("codecompanion").setup({
    opts = {
      language = "Portuguese",
    },
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
        keymaps = {
          accept_change = {
            modes = { n = "ga" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "gr" },
            description = "Reject the suggested change",
          },
        },
      },
    },
    display = {
      chat = {
        icons = {
          pinned_buffer = " ",
          watched_buffer = "👀 ",
        },
        window = {
          layout = "vertical",
          position = "right",
          border = "single",
          height = 0.8,
          width = 0.45,
          relative = "editor",
          full_height = true,
          opts = {
            breakindent = true,
            cursorcolumn = false,
            cursorline = false,
            foldcolumn = "0",
            linebreak = true,
            list = false,
            numberwidth = 1,
            signcolumn = "no",
            spell = false,
            wrap = true,
          },
        },
      },
      inline = {
        layout = "vertical",
      },
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Prompt ",
        provider = "telescope",
        opts = {
          show_default_actions = true,
          show_default_prompt_library = true,
        },
      },
    },
  })
end

return M