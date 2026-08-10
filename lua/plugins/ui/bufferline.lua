return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    {
      "<C-w>x",
      function() require("mini.bufremove").delete(0, false) end,
      desc = "Close Current Buffer",
    },
    {
      "<M-h>",
      "<cmd>BufferLineMovePrev<CR>",
      desc = "Move Buffer Left",
    },
    {
      "<M-l>",
      "<cmd>BufferLineMoveNext<CR>",
      desc = "Move Buffer Right",
    },
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, _, _)
          local icons = require("config.icons")
          local icon = icons.diagnostics[level] or " "
          return " " .. icon .. count
        end,
      },
    })
  end,
}
