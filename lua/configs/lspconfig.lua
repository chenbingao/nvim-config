-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- 自动获取 Poetry 虚拟环境路径
local handle = io.popen "poetry env info --path"
local pythonPath = ""
if handle then
  local poetry_venv = handle:read("*a"):gsub("%s+", "") .. "/bin/python3"
  pythonPath = poetry_venv
  vim.g.python3_host_prog = poetry_venv
  handle:close()
end

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp == "pyright" then
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      settings = {
        python = { pythonPath = pythonPath },
      },
    }
  else
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
