return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gitsign = require("gitsigns")

      local function map(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc }) end
      map("n", "<leader>gs", gitsign.stage_hunk, "Git Stage Hunk")
      map("n", "<leader>gS", gitsign.stage_buffer, "Git Stage Buffer")
      map("n", "<leader>gr", gitsign.reset_hunk, "Git Reset Hunk")
      map("n", "<leader>gR", gitsign.reset_buffer, "Git Reset Buffer")
      map("n", "<leader>gp", gitsign.preview_hunk_inline, "Git Preview Hunk Inline")
      map("n", "<leader>gP", gitsign.preview_hunk, "Git Preview Hunk")
      map("n", "<leader>gb", gitsign.blame_line, "Git Blame Line")
      map("n", "<leader>gb", gitsign.blame, "Toggle Git Blame")
    end,
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
}
