return {
  "stevearc/oil.nvim",
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Open Oil in Current Directory" },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
    confirmation = {
      border = "rounded",
    },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
}
