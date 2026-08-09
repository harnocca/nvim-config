-- Global defaults: 4 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4 -- Number of spaces for backspace

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.numberwidth = 4
vim.signcolumn = "yes"

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

-- Lazy redraw
vim.opt.updatetime = 500
vim.opt.lazyredraw = true

-- LSP settings

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

local dap_signs = {
  DapBreakpoint = { text = "", texthl = "DapBreakpoint" },
  DapBreakpointCondition = { text = "", texthl = "DapBreakpoint" },
  DapLogPoint = { text = "", texthl = "DapLogPoint" },
  DapBreakpointRejected = { text = "", texthl = "DapBreakpoint" },
  DapStopped = { text = "", texthl = "DapStopped", linehl = "DapStopped" },
}

for name, config in pairs(dap_signs) do
  vim.fn.sign_define(name, {
    text = config.text,
    texthl = config.texthl,
    linehl = config.linehl or "",
    numhl = config.numhl or "",
  })
end
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#993939" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })

-- Speed up the popup display (default is 4000ms)
vim.opt.updatetime = 1500

-- Make floating preview rounded :D
local orig_floating_preview = vim.lsp.util.open_floating_preview

--- @diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded" -- Set default border to rounded
  return orig_floating_preview(contents, syntax, opts, ...)
end
