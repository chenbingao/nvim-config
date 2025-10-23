require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    proto = { "buf" },
    json = { "prettierd", "prettier", stop_after_first = true },
    zig = { "zigfmt" },
    cmake = { "gersemi" },
    haskell = { "ormolu" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters = {
    rustfmt = {
      options = { default_edition = "2024" },
    },
  },
}

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format { bufnr = args.buf }
--   end,
-- })
