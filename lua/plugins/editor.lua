return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "config.nvimtree"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "config.telescope"
    end,
  },
  { "nvim-pack/nvim-spectre" },
  {
    "numToStr/Comment.nvim",
    opts = {
      opleader = {
        line = "gc",
        bock = "gb",
      },
    },
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require "config.illuminate"
    end,
  },
  {
    "nvimdev/hlsearch.nvim",
    event = "BufRead",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require "config.ident_blankline"
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.stdpath "state" .. "/sessions/",
      options = { "buffers", "curdir", "tabpages", "winsize" },
      need = 1,
      branch = true,
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      require "config.actions_preview"
    end,
  },
  {
    "nvim-lua/plenary.nvim",
    dependencies = {
      "nvim-pack/nvim-spectre",
      "folke/trouble.nvim",
    },
  },
}
