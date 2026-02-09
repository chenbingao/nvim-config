local servers = {
  lua_ls = "lsp.lua",
  pbls = "lsp.proto",
  jsonls = "lsp.json",
  zls = "lsp.zig",
  clangd = "lsp.c",
  cmake = "lsp.cmake",
  rescriptls = "lsp.rescript",
  hls = "lsp.haskell",
  ts_ls = "lsp.ts",
  sourcekit = "lsp.swift",
  autotools_ls = "lsp.make",
  neocmake = "lsp.cmake",
}

for name, mod in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.config(name, require(mod))
end
