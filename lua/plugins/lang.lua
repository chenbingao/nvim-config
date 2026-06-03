return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "markdown",
          "markdown_inline",
          "lua",
          "vim",
          "vimdoc",
          "query",
        },
        auto_install = true,
        highlight = { enable = true },
      }

      -- Override nvim-treesitter's set-lang-from-info-string! directive.
      -- The original calls vim.treesitter.get_node_text on nodes that may
      -- be invalid under Neovim 0.12, crashing in get_range -> node:range().
      local aliases = {
        ex = "elixir",
        pl = "perl",
        sh = "bash",
        uxn = "uxntal",
        ts = "typescript",
      }
      vim.treesitter.query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
        local node = match[pred[2]]
        if not node then
          return
        end
        local ok, text = pcall(vim.treesitter.get_node_text, node, bufnr)
        if not ok or not text then
          return
        end
        local alias = text:lower()
        metadata["injection.language"] = vim.filetype.match({ filename = "a." .. alias })
          or aliases[alias]
          or alias
      end, { force = true, all = false })
    end,
  },
  { "limitLiu/nvim-treesitter-rescript" },
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
      "nvim-treesitter/nvim-treesitter",
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
