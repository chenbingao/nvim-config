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
  pattern = "*",
  callback = function()
    vim.schedule(function()
      local mason = require "mason-registry"
      local installed = mason.get_installed_package_names()
      local tools = {
        "pyright",
        "html-lsp",
        "black",
        "clangd",
        "codelldb",
        "css-lsp",
        "isort",
        "lua-language-server",
        "prettier",
        "prettierd",
        "rust-analyzer",
        "stylua",
        "typescript-language-server",
        "rescript-language-server",
        "buf",
        "zls",
      }
      for _, tool in ipairs(tools) do
        local is_installed = false
        for _, installed_tool in ipairs(installed) do
          if installed_tool == tool then
            is_installed = true
            break
          end
        end
        if not is_installed then
          print("Tool " .. tool .. " is missing. Installing...")
          vim.cmd("MasonInstall " .. tool)
        end
      end
    end)
  end,
})

local lspconfig = require "lspconfig"

lspconfig.pyright.setup(require "lsp.python")
lspconfig.lua_ls.setup(require "lsp.lua")
lspconfig.buf_ls.setup(require "lsp.proto")
lspconfig.jsonls.setup(require "lsp.json")
lspconfig.zls.setup(require "lsp.zig")
lspconfig.clangd.setup(require "lsp.c")
