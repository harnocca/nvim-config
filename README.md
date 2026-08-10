# Neovim Config

A minimal Neovim setup built around [lazy.nvim](https://github.com/folke/lazy.nvim), LSP, and a curated set of plugins.

## Prerequisites

- **Neovim >= 0.11** and **Git** (bootstraps lazy.nvim)
- A **Nerd Font** for icons
- Language tooling installed on demand via **Mason** (`:Mason`)

## Layout

| Path | What lives there |
|------|------------------|
| `lua/config/` | Options, keymaps, autocmds, jdtls setup |
| `lua/plugins/` | Plugin specs, organized by area (`ui/`, `lsp/`, `theme/`) |

## Usage

- Leader key: `<Space>` — explore keybinds with `<leader>sk` (keymap picker) or `:map`.
- Theme: set `GLOBAL_THEME=catppuccin|gruvbox` (defaults to `catppuccin`).
- `:Lazy` to manage plugins, `:Mason` to install LSP/DAP/formatters, `:checkhealth` to verify.

Find the full keybind reference in `lua/config/keymaps.lua` and the per-plugin specs under `lua/plugins/`.
