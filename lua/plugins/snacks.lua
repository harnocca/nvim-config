return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "", key = "S", desc = "Select Session", action = ":Persisted select" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
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
      desc = "Search by Grep",
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
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Search Marks",
    },
    {
      "<leader>st",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Search Themes",
    },
    {
      "<M-t>",
      function() Snacks.terminal.toggle() end,
      mode = { "n", "t" },
      desc = "Toggle Terminal",
    },
  },
}
