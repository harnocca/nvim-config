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
    if event.data.actions[1].type == "move" then
      Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
    end
  end,
})

-- vim.api.nvim_create_autocmd("BufFilePost", {
--   group = vim.api.nvim_create_augroup("auto-detect-ft", { clear = true }),
--   callback = function()
--     vim.cmd("filetype detect")
--     vim.treesitter.start()
--   end,
-- })

-- This might fix stuff
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("auto-detect-ft", { clear = true }),
  callback = function()
    if vim.bo.filetype == "" then vim.cmd("filetype detect") end
    if vim.bo.filetype ~= "" then pcall(vim.treesitter.start) end
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("auto-detect-file-change", { clear = true }),
  callback = function()
    if vim.bo.buftype ~= "nofile" then vim.cmd("checktime") end
  end,
})
