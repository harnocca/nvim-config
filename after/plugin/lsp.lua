vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local function map(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc }) end

    map("n", "gd", function() Snacks.picker.lsp_definitions() end, "Go to Definition")
    map("n", "gr", function() Snacks.picker.lsp_references() end, "Go to References")
    map("n", "gi", function() Snacks.picker.lsp_implementations() end, "Go to Implementation")
    map("n", "gt", function() Snacks.picker.lsp_type_definitions() end, "Go to Type")
    map("n", "gD", function() Snacks.picker.lsp_declarations() end, "Go to Declaration")
    map("n", "gs", function() Snacks.picker.lsp_symbols() end, "Go to Symbols")
    map("n", "gS", function() Snacks.picker.lsp_workspace_symbols() end, "Go to workspace Symbols")
    map("n", "K", vim.lsp.buf.hover, "Show Documentation")
    map("n", "<leader>r", vim.lsp.buf.rename, "Rename")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(_) require("config.jdtls"):setup() end,
})
