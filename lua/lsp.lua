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
        "html-lsp",
        "clangd",
        "cmake-language-server",
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

vim.lsp.enable "lua_ls"
vim.lsp.config("lua_ls", require "lsp.lua")

vim.lsp.enable "pbls"
vim.lsp.config("pbls", require "lsp.proto")

vim.lsp.enable "jsonls"
vim.lsp.config("jsonls", require "lsp.json")

vim.lsp.enable "zls"
vim.lsp.config("zls", require "lsp.zig")

vim.lsp.enable "clangd"
vim.lsp.config("clangd", require "lsp.c")

vim.lsp.enable "cmake"
vim.lsp.config("cmake", require "lsp.cmake")

vim.lsp.enable "rescriptls"
vim.lsp.config("rescriptls", require "lsp.rescript")

vim.lsp.enable "hls"
vim.lsp.config("hls", require "lsp.haskell")

vim.lsp.enable "ts_ls"
vim.lsp.config("ts_ls", require "lsp.ts")

vim.lsp.enable "sourcekit"
vim.lsp.config("sourcekit", require "lsp.swift")
