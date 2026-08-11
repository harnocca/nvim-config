return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    {
      "<C-w>x",
      function()
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })

        require("mini.bufremove").delete(0, false)

        if #buffers == 1 then vim.schedule(function() require("snacks").dashboard.open() end) end
      end,
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
    {
      "<leader>p",
      "<cmd>BufferLinePick<CR>",
      desc = "Pick Buffer",
    },
  },

  opts = {
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

      name_formatter = function(buf)
        local name = buf.name

        if name:match("^%%3") then
          local class = name:match("%%28(.+)$")
          if class then return class end
        end

        return name
      end,
    },
  },
}
