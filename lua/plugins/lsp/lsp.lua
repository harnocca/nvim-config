return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      { "mfussenegger/nvim-jdtls" },
    },
    config = function()
      local icons = require("config.icons")

      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
          },
        },
        update_in_insert = false,
      })

      require("mason").setup({
        ui = {
          icons = {
            package_installed = "◍",
            package_pending = "➜",
            package_uninstalled = "○",
          },
        },
      })

      require("mason-lspconfig").setup({
        automatic_enable = {
          exclude = {
            "jdtls", -- Java needs to be manually configured
          },
        },
      })
    end,
  },
}
