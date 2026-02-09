return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      ---@diagnostic disable-next-line: different-requires
      require "config.lualine"
    end,
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = true
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
      require "config.dashboard-nvim"
    end,
  },
  {
    "j-hui/fidget.nvim",
    lazy = false,
    config = function()
      require "config.fidget"
    end,
  },
}
