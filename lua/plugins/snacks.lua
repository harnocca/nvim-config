return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true, animate = { enabled = false } },
    input = { enabled = true },
    picker = {
      -- To toggle hidden M^h, to toggle ignored M^i
      enabled = true,
      sources = {
        files = {
          hidden = false, -- Disables showing hidden files in find_files
        },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },

  keys = {
    {
      "<leader>sn",
      function() Snacks.picker.notifications() end,
      desc = "Search Notification",
    },
    {
      "<leader>sf",
      function() Snacks.picker.files() end,
      desc = "Search Files",
    },
    {
      "<leader>sg",
      function() Snacks.picker.grep() end,
      desc = "Search by Grep (Live)",
    },
    {
      "<leader>sh",
      function() Snacks.picker.help() end,
      desc = "Search Help",
    },
    {
      "<leader>sw",
      function() Snacks.picker.grep_word() end,
      desc = "Search current Word",
    },
    {
      "<leader>sk",
      function() Snacks.picker.keymaps() end,
      desc = "Search Keymaps",
    },
    {
      "<leader>sr",
      function() Snacks.picker.recent() end,
      desc = "Search Recent Files",
    },
    {
      "<leader>sb",
      function() Snacks.picker.buffers() end,
      desc = "Search Buffers",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.lines({
          layout = { preset = "vscode", preview = false },
        })
      end,
      desc = "Fuzzily search in current buffer",
    },
    {
      "<M-t>",
      function() Snacks.terminal.toggle() end,
      mode = { "n", "t" },
      desc = "Toggle Terminal",
    },
    {
      "<leader>dsb",
      function() Snacks.dashboard.open() end,
      desc = "Open Dashboard",
    },
  },
}
