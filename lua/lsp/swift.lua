local common = require "lsp.common"
return {
  on_attach = function(client, bufnr)
    common.on_attach(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", ",ss", "<cmd>XcodebuildSetup<CR>", bufopts)
    vim.keymap.set("n", ",sr", "<cmd>XcodebuildBuildRun<CR>", bufopts)
  end,
  capabilities = common.capabilities,
}
