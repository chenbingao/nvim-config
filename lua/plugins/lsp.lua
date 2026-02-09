return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = { "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" },
        opts = { lsp = { auto_attach = true } },
      },
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.schedule(function()
            local registry = require "mason-registry"
            local installed = registry.get_installed_package_names()
            local ensure_installed = {
              "html-lsp",
              "clangd",
              "neocmakelsp",
              "gersemi",
              "codelldb",
              "css-lsp",
              "lua-language-server",
              "prettierd",
              "rust-analyzer",
              "stylua",
              "typescript-language-server",
              "rescript-language-server",
              "pbls",
              "ormolu",
              "autotools-language-server",
            }
            for _, tool in ipairs(ensure_installed) do
              if not vim.tbl_contains(installed, tool) then
                vim.notify("Mason: installing " .. tool .. "...", vim.log.levels.INFO)
                vim.cmd("MasonInstall " .. tool)
              end
            end
          end)
        end,
      })
    end,
  },
}
