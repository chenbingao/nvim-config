local common = require "lsp.common"

-- Update this path
local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb"
local this_os = vim.uv.os_uname().sysname

if this_os:find "Windows" then
  codelldb_path = extension_path .. "adapter\\codelldb.exe"
  liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

local cfg = require "rustaceanvim.config"

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
  dap = {
    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
  },
}
