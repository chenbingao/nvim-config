require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.lsp.inlay_hint.enable(true)
vim.o.clipboard = "unnamed,unnamedplus"

vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = true}"
