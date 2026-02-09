local map = vim.keymap.set

-----------------
-- Normal mode --
-----------------

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-i>", "<C-i>", { desc = "Jump forward" })

map("n", "q", "<Nop>", { desc = "Disable macro recording" })
map("n", "<leader>fs", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>fS", "<cmd>wa<CR>", { desc = "Save all files" })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeFindFile<CR>", { desc = "Find file in tree" })

-- Buffer navigation
map("n", "<Tab>", "<cmd>BufferNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
map("n", ",h", "<cmd>BufferCloseBuffersLeft<CR>", { desc = "Close buffers to the left" })
map("n", ",l", "<cmd>BufferCloseBuffersRight<CR>", { desc = "Close buffers to the right" })
map("n", ",j", "<cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all other buffers" })
map("n", ",k", "<cmd>BufferClose<CR>", { desc = "Close current buffer" })
map("n", ",r", "<cmd>e<CR>", { desc = "Reload current file" })

-- Neotest
map("n", ",tt", function()
  require("neotest").output_panel.toggle()
end, { desc = "Toggle test output panel" })
map("n", ",tr", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })

-- Telescope
map("n", ",o", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })
map("n", "<leader>fw", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live grep" })
map("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "Find buffers" })
map("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "Help tags" })
map("n", "<leader>ds", function()
  require("telescope.builtin").diagnostics()
end, { desc = "Diagnostics" })

map("n", "<leader>lo", "<cmd>Navbuddy<CR>", { desc = "Open Navbuddy" })

-- Replace panel
map("n", "<leader>S", function()
  require("spectre").toggle()
end, { desc = "Toggle search & replace" })

-----------------
-- Insert mode --
-----------------

map("i", "<C-f>", "<Right>", { desc = "Move cursor right" })
map("i", "<C-b>", "<Left>", { desc = "Move cursor left" })
map("i", "<C-p>", "<Up>", { desc = "Move cursor up" })
map("i", "<C-n>", "<Down>", { desc = "Move cursor down" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })
map("i", "<C-a>", "<C-o>I", { desc = "Move to start of line" })

-----------------
-- Visual mode --
-----------------

map("v", "v", "<Esc>", { desc = "Exit visual mode" })

map("v", ",y", function()
  require("osc52").copy_visual()
end, { desc = "Copy with OSC52" })

map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
