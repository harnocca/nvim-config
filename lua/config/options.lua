-- Global defaults: 4 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4 -- Number of spaces for backspace

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = "a"

-- Sync clipboard between OS and nvim, scheduled after `UiEnter` for increased startup-time
vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)

-- Wait for 300ms before timeout
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.breakindent = true -- Ensure consistent indentation when wrapping lines
vim.opt.smartindent = true -- Indent correctly after {
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI

-- Set NeoVim theme according to P10K theme
vim.g.global_theme = os.getenv("GLOBAL_THEME") or "catppuccin"

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Save undo history
vim.opt.undofile = true
vim.opt.autoread = true

-- Sets how neovim will display certain whitespace characters in the editor
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Speed up popup display and CursorHold (default is 4000ms)
vim.opt.updatetime = 1000

-- Make floating preview rounded :D
local orig_floating_preview = vim.lsp.util.open_floating_preview

--- @diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded" -- Set default border to rounded
  return orig_floating_preview(contents, syntax, opts, ...)
end
