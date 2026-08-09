return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    {
      "<C-w>c",
      function()
        -- Filter to get only listed and valid buffers
        local listed_bufs = vim.tbl_filter(
          function(buf) return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted end,
          vim.api.nvim_list_bufs()
        )

        -- If no listed buffers would remain, open snacks dashboard
        if #listed_bufs == 1 then
          local cur_buf = vim.api.nvim_get_current_buf()
          Snacks.dashboard.open()
          Snacks.bufdelete(cur_buf)
        elseif #listed_bufs <= 0 then
          Snacks.dashboard.open()
        else
          Snacks.bufdelete()
        end
      end,
      desc = "Close Current Buffer",
    },
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })
  end,
}
