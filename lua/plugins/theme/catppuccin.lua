return {
  {
    "catppuccin/nvim",
    enabled = (vim.g.global_theme == "catppuccin"),
    name = "catppuccin",
    priority = 1000, -- Ensure it loads before other plugins

    opts = {
      flavour = "frappe",
      transparent_background = true,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      -- Set the colorscheme after setup
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
