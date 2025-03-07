-- define common options
local opts = {
  noremap = true, -- non-recursive
  silent = true, -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "q", "<Nop>", opts)
vim.keymap.set("n", "<leader>fs", "<cmd>w<CR>", opts)
vim.keymap.set("n", "<leader>fS", "<cmd>wa<CR>", opts)

-- nvim_tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFile<CR>", opts)
vim.keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", opts)

vim.keymap.set("n", ",h", "<cmd>BufferCloseBuffersLeft<CR>", opts)
vim.keymap.set("n", ",l", "<cmd>BufferCloseBuffersRight<CR>", opts)
vim.keymap.set("n", ",j", "<cmd>BufferCloseAllButCurrent<CR>", opts)
vim.keymap.set("n", ",k", "<cmd>BufferClose<CR>", opts)

vim.keymap.set("n", "<C-u>", "9k", opts)
vim.keymap.set("n", "<C-d>", "9j", opts)
vim.keymap.set("n", "<C-e>", "$", opts)
vim.keymap.set("n", "<C-a>", "^", opts)

local builtin = require "telescope.builtin"
vim.keymap.set("n", ",o", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fw", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>ds", builtin.diagnostics, opts)
vim.keymap.set("n", "<leader>lo", builtin.lsp_document_symbols, opts)

-----------------
-- Insert mode --
-----------------

vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)
vim.keymap.set("i", "kk", "<ESC>", opts)
vim.keymap.set("i", "jj", "<ESC>", opts)

vim.keymap.set("i", "<C-f>", "<Right>", opts)
vim.keymap.set("i", "<C-b>", "<Left>", opts)
vim.keymap.set("i", "<C-p>", "<Up>", opts)
vim.keymap.set("i", "<C-n>", "<Down>", opts)
vim.keymap.set("i", "<C-e>", "<End>", opts)
vim.keymap.set("i", "<C-a>", "<C-o>I", opts)

-----------------
-- Visual mode --
-----------------

vim.keymap.set("v", "v", "<Esc>", opts)

vim.keymap.set(
  "v",
  ",y",
  require("osc52").copy_visual, -- 使用 OSC 52 复制
  opts
)

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
