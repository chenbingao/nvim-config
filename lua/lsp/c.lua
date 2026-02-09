local common = require "lsp.common"
return {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp" },
}
