return {
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    enabled = (vim.g.global_theme == "gruvbox"),
    lazy = false, -- Load on startup
    priority = 1000, -- Ensure it loads before other plugins

    config = function()
      vim.g.gruvbox_material_transparent_background = 0 -- This kinda clashes with my wallpaper, so no...
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
