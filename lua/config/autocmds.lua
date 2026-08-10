-- Filetype-specific overrides for 2-space indentation
-- Includes Web, Config, and modern Scripting languages
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("indent-overrides", { clear = true }),
  pattern = {
    "json",
    "yaml",
    "lua", -- Configs
    "html",
    "css",
    "javascript", -- Web Basic
    "typescript",
    "typescriptreact", -- TS / TSX
    "javascriptreact", -- JSX
    "sh",
    "zsh", -- Shell Scripts
    "ruby",
    "nix", -- Modern Scripting
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Rename files
vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("lsp-rename-detect", { clear = true }),
  pattern = "OilActionsPost",
  callback = function(event)
    local action = event.data and event.data.actions and event.data.actions[1]
    if action and action.type == "move" then
      Snacks.rename.on_rename_file(action.src_url, action.dest_url)
    end
  end,
})

-- Automatic external file change detector.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("auto-detect-file-change", { clear = true }),
  callback = function()
    if vim.bo.buftype ~= "nofile" then vim.cmd("checktime") end
  end,
})

-- LSP-specific keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user-lsp-config", { clear = true }),
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

-- Load JDTLS manually
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("jdtls-attach", { clear = true }),
  pattern = "java",
  callback = function(_) require("config.jdtls"):setup() end,
})
