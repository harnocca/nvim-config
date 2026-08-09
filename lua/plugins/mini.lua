return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.icons").setup()
      require("mini.icons").mock_nvim_web_devicons()
      require("mini.pairs").setup({})
      require("mini.ai").setup({})
      require("mini.bufremove").setup({})
      require("mini.surround").setup({
        mappings = {
          add = "ys",
          delete = "ds",
          replace = "cs",
        },
      })
      require("mini.comment").setup({})
    end,
  },
}
