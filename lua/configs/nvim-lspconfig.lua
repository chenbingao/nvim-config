-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "pyright", "buf_ls", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

local custom_overrides = {
  clangd = {
    filetypes = {
      "c",
      "cpp",
      "objc",
      "objcpp",
    },
  },
}

local default_config = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  local config = vim.tbl_deep_extend("force", default_config, custom_overrides[lsp] or {})
  lspconfig[lsp].setup(config)
end
