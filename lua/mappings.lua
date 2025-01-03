require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fs", "<cmd> w <cr>", { desc = "file save" })
map("n", "K", function()
  vim.lsp.buf.hover()
end, { desc = "hover" })
map("n", "gn", function()
  vim.diagnostic.goto_next()
end, { desc = "diagnostic jump next" })
map("n", "gp", function()
  vim.diagnostic.goto_prev()
end, { desc = "diagnostic jump prev" })
map("n", "gd", "<cmd>Trouble lsp_definitions<CR>", { desc = "lsp definitions (Trouble)" })
map("n", "gt", "<cmd>Trouble lsp_type_definitions<CR>", { desc = "lsp type definitions (Trouble)" })
map("n", "gi", "<cmd>Trouble lsp_implementations<CR>", { desc = "lsp implementations (Trouble)" })
map("n", "gr", "<cmd>Trouble lsp_definitions<CR>", { desc = "lsp ddfinitions (Trouble)" })
map("n", "<leader>lc", function()
  vim.lsp.buf.code_action()
end, { desc = "code action" })
map("n", "<leader>lr", function()
  vim.lsp.buf.rename()
end, { desc = "rename" })
map("n", ",k", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })
map("n", ",n", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>ds", "<cmd>Trouble diagnostics toggle focus=true<CR>", { desc = "Diagnostics (Trouble)" })

map("i", "jk", "<ESC>")

local nomap = vim.keymap.del

nomap("n", "<C-s>")
nomap("n", "<C-n>")
