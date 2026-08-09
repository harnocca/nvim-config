return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = { "*" },
    user_default_options = {
      names = false,
      RGB = true,
      RRGGBB = true,
      RRGGBBAA = true,
      AARRGGBB = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      tailwind = true,
      -- Options: 'background', 'foreground', 'virtualtext'
      mode = "background",
    },
  },
}
