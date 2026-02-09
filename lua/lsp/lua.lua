local common = require "lsp.common"
return {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        disable = { "different-requires" },
      },
    },
  },
}
