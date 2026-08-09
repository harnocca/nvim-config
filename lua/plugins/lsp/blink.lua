return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.*",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<C-space>"] = false, -- This is my tmux leader, so no
        ["<C-a>"] = { "show", "show_documentation", "hide_documentation" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      signature = {
        enabled = true,
        window = { border = "rounded", show_documentation = true },
      },

      completion = {
        trigger = {
          show_on_trigger_character = true,
        },

        menu = {
          border = "rounded",
        },

        documentation = {
          window = {
            border = "rounded",
          },
          auto_show = false,
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
