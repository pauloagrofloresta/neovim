local M = {}

function M.setup()
  require("bufferline").setup({
    options = {
      mode = "buffers",
      style_preset = require("bufferline").style_preset.default,
      themable = true,
      numbers = "none",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = {
        icon = '▎',
        style = 'none',
      },
      buffer_close_icon = '◼',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 30,
      max_prefix_length = 30,
      truncate_names = true,
      tab_size = 21,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      custom_filter = function(buf_number, buf_numbers)
        if vim.bo[buf_number].filetype ~= "nvim-tree" then
          return true
        end
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true
        }
      },
      color_icons = false,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      duplicates_across_groups = true,
      persist_buffer_sort = true,
      move_wraps_at_ends = false,
      separator_style = "slant",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      auto_toggle_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
      sort_by = 'insert_at_end',
    },
    highlights = {
      background = {
        fg = '#7c7d83',
        bg = '#1e1e2e'
      },
      buffer_selected = {
        fg = '#cdd6f4',
        bg = '#313244',
        bold = true,
        italic = false,
      },
      buffer_visible = {
        fg = '#9399b2',
        bg = '#1e1e2e'
      },
      close_button = {
        fg = '#7c7d83',
        bg = '#1e1e2e'
      },
      close_button_visible = {
        fg = '#9399b2',
        bg = '#1e1e2e'
      },
      close_button_selected = {
        fg = '#7c7d83',
        bg = '#313244'
      },
      tab_selected = {
        fg = '#cdd6f4',
        bg = '#313244'
      },
      tab = {
        fg = '#7c7d83',
        bg = '#1e1e2e'
      },
      tab_close = {
        fg = '#f38ba8',
        bg = '#1e1e2e'
      },
      duplicate_selected = {
        fg = '#fab387',
        bg = '#313244',
        italic = true,
      },
      duplicate_visible = {
        fg = '#fab387',
        bg = '#1e1e2e',
        italic = true,
      },
      duplicate = {
        fg = '#fab387',
        bg = '#1e1e2e',
        italic = true,
      },
      modified = {
        fg = '#f9e2af',
        bg = '#1e1e2e'
      },
      modified_selected = {
        fg = '#f9e2af',
        bg = '#313244'
      },
      modified_visible = {
        fg = '#f9e2af',
        bg = '#1e1e2e'
      },
      separator = {
        fg = '#1e1e2e',
        bg = '#1e1e2e'
      },
      separator_selected = {
        fg = '#313244',
        bg = '#313244'
      },
      separator_visible = {
        fg = '#1e1e2e',
        bg = '#1e1e2e'
      },
      indicator_selected = {
        fg = '#89b4fa',
        bg = '#313244'
      },
      pick_selected = {
        fg = '#f38ba8',
        bg = '#313244',
        bold = true,
        italic = true,
      },
      pick_visible = {
        fg = '#f38ba8',
        bg = '#1e1e2e',
        bold = true,
        italic = true,
      },
      pick = {
        fg = '#f38ba8',
        bg = '#1e1e2e',
        bold = true,
        italic = true,
      },
      offset_separator = {
        fg = '#1e1e2e',
        bg = '#1e1e2e'
      },
    }
  })
end

return M