---@type vim.lsp.Config
--
-- Per-server LSP overrides live in `after/lsp/<server>.lua`.
-- They are merged on top of nvim-lspconfig's defaults (`cmd`, `filetypes`,
-- `root_markers`, `on_attach`, ...), so only the deltas belong here.
return {
  settings = {
    basedpyright = {
      analysis = {
        -- basedpyright defaults to "recommended", which is much stricter than
        -- pyright's "basic". Options: off | basic | standard | strict | recommended | all
        typeCheckingMode = "basic",
      },
    },
  },
}
