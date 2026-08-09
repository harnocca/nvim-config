return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            { path = "snacks.nvim", words = { "Snacks" } },
          },
        },
      },
      { "mfussenegger/nvim-jdtls" },
    },
    config = function()
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
