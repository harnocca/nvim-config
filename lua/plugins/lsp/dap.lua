return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui", -- Debug UI
    "nvim-neotest/nvim-nio", -- Async IO
    "theHamsta/nvim-dap-virtual-text", -- Virtual text
    "mason-org/mason.nvim", -- Require mason
    "jay-babu/mason-nvim-dap.nvim", -- Bridges between mason and dap
  },
  keys = {
    { "<F5>", function() require("dap").continue() end, desc = "Debug Start/Continue" },
    { "<F1>", function() require("dap").step_into() end, desc = "Debug Step Into" },
    { "<F2>", function() require("dap").step_over() end, desc = "Debug Step Over" },
    { "<F3>", function() require("dap").step_out() end, desc = "Debug Step Out" },
    { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    {
      "<leader>B",
      function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
      desc = "Set Conditioned Breakpoint",
    },
    { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle Debug UI" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      ensure_installed = { "python", "codelldb" },
      automatic_installation = true,
      handlers = {},
    })

    dapui.setup()
    require("nvim-dap-virtual-text").setup({})

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
  end,
}
