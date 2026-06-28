local common = require "lsp.common"

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      common.on_attach(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      vim.bo[bufnr].tabstop = 2
      vim.bo[bufnr].softtabstop = 2
      vim.bo[bufnr].shiftwidth = 2
      vim.bo[bufnr].expandtab = true

      -- Override K with Rust-specific hover
      vim.keymap.set("n", "K", function()
        vim.cmd.RustLsp { "hover", "actions" }
      end, bufopts)
    end,
    capabilities = common.capabilities,
  },
  dap = {},
}
