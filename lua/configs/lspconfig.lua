local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local default_config = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

local custom_overrides = {
  clangd = {
    filetypes = { "c", "cpp", "objc", "objcpp" },
  },
}

local function setup_servers()
  local servers = { "html", "cssls", "clangd", "pyright", "buf_ls" }

  for _, lsp in ipairs(servers) do
    local config = vim.tbl_deep_extend("force", default_config, custom_overrides[lsp] or {})
    lspconfig[lsp].setup(config)
  end
end

setup_servers()
