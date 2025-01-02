require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fs", "<cmd> w <cr>", { desc = "file save" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "hover (Saga)" })
map("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "diagnostic jump next (Saga)" })
map("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "diagnostic jump prev (Saga)" })
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "diagnostic goto definition (Saga)" })
map("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "diagnostic goto type definition (Saga)" })
map("n", "gi", "<cmd>Lspsaga finder imp<CR>", { desc = "finder imp (Saga)" })
map("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "finder (Saga)" })
map("n", "<leader>lp", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "peek type definition (Saga)" })
map("n", "<leader>lc", "<cmd>Lspsaga code_action<CR>", { desc = "code action (Saga)" })
map("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { desc = "rename (Saga)" })
map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "outline (Saga)" })
map("n", ",k", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })
map("n", ",n", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>ds", "<cmd>Trouble diagnostics toggle focus=true<CR>", { desc = "Diagnostics (Trouble)" })

map("i", "jk", "<ESC>")

local nomap = vim.keymap.del

nomap("n", "<C-s>")
nomap("n", "<C-n>")
