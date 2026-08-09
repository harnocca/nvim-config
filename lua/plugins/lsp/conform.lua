return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<C-M-l>",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end,
      desc = "Format File",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" }, -- Extremely fast Python formatting
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      sh = { "shfmt" },
      go = { "gofumpt", "goimports-reviser" },
      java = { "google-java-format" },
    },
    formatters = {
      ["google-java-format"] = {
        prepend_args = { "--aosp" },
      },
    },
    -- Auto-format on save
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
