local set_key = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
set_key("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Moving through split windows
set_key("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set_key("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set_key("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set_key("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Use Alt + arrows to resize windows (can't think of anything better)
set_key("n", "<M-Up>", ":resize +2<CR>", { desc = "Increase height of current window" })
set_key("n", "<M-Down>", ":resize -2<CR>", { desc = "Decrease height of current window" })
set_key("n", "<M-Left>", ":vertical resize -2<CR>", { desc = "Increase width of current window" })
set_key("n", "<M-Right>", ":vertical resize +2<CR>", { desc = "Decrease width of current window" })

-- Split window: = is horizontal and "" is vertical && c for close
set_key("n", '<M-">', ":vsplit<CR>", { desc = "Vertical Split" })
set_key("n", "<M-=>", ":split<CR>", { desc = "Horizontal Split" })
set_key("n", "<M-c>", ":close<CR>", { desc = "Close current window" })

-- Jump back to workspace without exiting terminal
set_key("t", "<C-k>", "<C-\\><C-n><C-w><C-k>", { desc = "Jump out of terminal" })

-- Move current line up & down
set_key("n", "<M-j>", "<cmd>m .+1<cr>== ", { desc = "Move Line Down" })
set_key("n", "<M-k>", "<cmd>m .-2<cr>== ", { desc = "Move Line Up" })

-- Quick Commands
set_key("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })
set_key("n", "<leader><leader>x", "<cmd>source<cr>", { desc = "Source File" })
set_key("n", "<leader>w", "<cmd>write<cr>", { desc = "Write" })
set_key("n", "<leader>lr", "<cmd>lsp restart<cr>", { desc = "Lsp Restart" })
set_key("n", "<leader>ju", "<cmd>JdtUpdateConfig<cr>", { desc = "JDTLS Update Config" })
