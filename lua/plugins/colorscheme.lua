return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require "config.theme.catppuccin"
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require "config.theme.kanagawa"
    end,
  },
  { "neanias/everforest-nvim", lazy = false, priority = 1000 },
  { "EdenEast/nightfox.nvim" },
}
