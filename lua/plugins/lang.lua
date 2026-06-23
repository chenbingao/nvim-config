return {
  {
    "romus204/tree-sitter-manager.nvim",
    config = function()
      local ensure_installed = {
        "rust",
        "haskell",
        "zig",
        "typescript",
      }
      if vim.fn.has "mac" == 1 then
        vim.list_extend(ensure_installed, { "swift" })
      end

      require("tree-sitter-manager").setup {
        ensure_installed = ensure_installed,
        auto_install = true,
      }
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
      require "lsp.rust"
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "lawrence-laz/neotest-zig",
      "rouge8/neotest-rust",
    },
    config = function()
      require "config.neotest"
    end,
  },
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "config.xcodebuild"
    end,
  },
  {
    "ojroques/nvim-osc52",
    config = function()
      require "config.nvim-osc52"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "config.conform"
    end,
  },
}
