require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>fs", "<cmd> w <cr>", { desc = "file save" })
map("n", "<leader>fS", "<cmd> wa <cr>", { desc = "all file save" })

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
map("n", "gr", "<cmd>Trouble lsp_references<CR>", { desc = "lsp references (Trouble)" })

map("n", "<leader>lc", function()
  require("actions-preview").code_actions()
end, { desc = "code action" })

map("n", "<leader>lr", function()
  vim.lsp.buf.rename()
end, { desc = "rename" })

map("n", ",h", function()
  require("nvchad.tabufline").closeBufs_at_direction "left"
end, { desc = "close left buffers" })

map("n", ",l", function()
  require("nvchad.tabufline").closeBufs_at_direction "right"
end, { desc = "close right buffers" })

map("n", ",j", function()
  local buf = require "nvchad.tabufline"
  buf.closeBufs_at_direction "left"
  buf.closeBufs_at_direction "right"
end, { desc = "close other buffers" })

map("n", ",k", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

map("n", ",n", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>ds", "<cmd>Trouble diagnostics toggle focus=true<CR>", { desc = "Diagnostics (Trouble)" })

map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

map(
  "v",
  ",y",
  require("osc52").copy_visual, -- 使用 OSC 52 复制
  { desc = "OSC 52 copy" }
)

local nomap = vim.keymap.del

nomap("n", "<C-s>")
nomap("n", "<C-n>")
