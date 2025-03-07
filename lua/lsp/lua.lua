local capabilities = require("cmp_nvim_lsp").default_capabilities()
local builtin = require "telescope.builtin"

return {
  on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set("n", "K", function()
    --   require("lsp_signature").toggle_float_win()
    -- end, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

    vim.keymap.set("n", "gn", function()
      vim.diagnostic.goto_next()
    end, bufopts)

    vim.keymap.set("n", "gp", function()
      vim.diagnostic.goto_prev()
    end, bufopts)

    vim.keymap.set("n", "gd", builtin.lsp_definitions, bufopts)
    vim.keymap.set("n", "gt", builtin.lsp_type_definitions, bufopts)
    vim.keymap.set("n", "gi", builtin.lsp_implementations, bufopts)
    vim.keymap.set("n", "gr", builtin.lsp_references, bufopts)

    vim.keymap.set("n", "<leader>lc", function()
      require("actions-preview").code_actions()
    end, bufopts)

    vim.keymap.set("n", "<leader>lr", function()
      vim.lsp.buf.rename()
    end, bufopts)
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
