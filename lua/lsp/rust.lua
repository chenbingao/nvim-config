-- Update this path
local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb"
local this_os = vim.uv.os_uname().sysname

-- The path is different on Windows
if this_os:find "Windows" then
  codelldb_path = extension_path .. "adapter\\codelldb.exe"
  liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
  -- The liblldb extension is .so for Linux and .dylib for MacOS
  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local cfg = require "rustaceanvim.config"
local builtin = require "telescope.builtin"

vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      vim.bo[bufnr].tabstop = 2
      vim.bo[bufnr].softtabstop = 2
      vim.bo[bufnr].shiftwidth = 2
      vim.bo[bufnr].expandtab = true

      vim.keymap.set("n", "K", function()
        vim.cmd.RustLsp { "hover", "actions" }
      end, bufopts)

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
  },
  dap = {
    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
  },
}
