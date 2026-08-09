# Neovim Config

A minimal Neovim configuration built around [lazy.nvim](https://github.com/folke/lazy.nvim), LSP, and a curated set of plugins.

## Prerequisites

- **Neovim >= 0.11**
- **Git** (bootstraps lazy.nvim)
- **Nerd Font** (for icons)
- **Language tooling** installed via Mason as needed:
  - `lua-language-server`, `stylua`
  - `pyright`, `ruff`
  - `typescript-language-server`, `prettierd`
  - `gopls`, `gofumpt`, `goimports-reviser`
  - `jdtls`, `google-java-format`
  - `shfmt`
  - Debug adapters: `debugpy`, `codelldb`

## Components

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Picker, dashboard, terminal, notifier, indent guides |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/DAP/formatter installer |
| [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | Mason + lspconfig bridge |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion engine |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debugger |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Debugger UI |
| [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Mason + DAP bridge |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) | Java LSP support |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File explorer |
| [persisted.nvim](https://github.com/olimorris/persisted.nvim) | Session management |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs |
| [mini.nvim](https://github.com/nvim-mini/mini.nvim) | Pairs, surround, comment, textobjects, icons, buffer remove |
| [nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua) | Color preview |
| [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) | Inline diagnostics |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown rendering |
| [marks.nvim](https://github.com/chentoast/marks.nvim) | Mark visualization |
| [catppuccin](https://github.com/catppuccin/nvim) | Default colorscheme |
| [gruvbox-material](https://github.com/sainnhe/gruvbox-material) | Alternate colorscheme |

The active theme is selected by the `GLOBAL_THEME` environment variable (`catppuccin` or `gruvbox`).

## Common Keybinds

Leader key: `<Space>`

### Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between splits |
| `<M-Up/Down/Left/Right>` | Resize splits |
| `<M-">` | Vertical split |
| `<M-=>` | Horizontal split |
| `<M-c>` | Close window |

### Files / Search

| Key | Action |
|-----|--------|
| `<leader>o` | Open Oil file explorer |
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep word under cursor |
| `<leader>sb` | List buffers |
| `<leader>sr` | Recent files |
| `<leader>/` | Fuzzy search current buffer |

### Editing

| Key | Action |
|-----|--------|
| `<Esc>` | Clear search highlight |
| `<M-j>` / `<M-k>` | Move line down / up |
| `<C-M-l>` | Format file |
| `ys{motion}{char}` | Add surround |
| `ds{char}` | Delete surround |
| `cs{old}{new}` | Replace surround |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `<leader>r` | Rename |
| `<leader>ca` | Code action |
| `<leader>lr` | Restart LSP |

### Debug

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |
| `<leader>du` | Toggle debug UI |

### Buffers / Terminal

| Key | Action |
|-----|--------|
| `<C-w>x` | Close buffer |
| `<M-h>` / `<M-l>` | Move buffer left / right |
| `<M-t>` | Toggle terminal |
| `<leader>w` | Write file |
| `<leader>q` | Quit all |
