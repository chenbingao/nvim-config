require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.lsp.inlay_hint.enable(true)
vim.o.clipboard = "unnamed,unnamedplus"
-- 使用 `p` 键在 Telescope 查找窗口中粘贴剪贴板内容
-- 为 Telescope 查找窗口的输入框映射 `p` 键粘贴剪贴板内容
vim.api.nvim_create_autocmd("FileType", {
  pattern = "telescopePrompt",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "t", "p", "<C-R>+", { noremap = true, silent = true })
  end,
})
-- 在 Telescope 查找窗口中自动粘贴剪贴板内容
local function paste_clipboard_to_telescope()
  -- 将剪贴板内容粘贴到 Telescope 搜索框
  vim.fn.setreg("/", vim.fn.getreg "+")
end

-- 在打开 Telescop 查找窗口时调用函数
vim.api.nvim_create_autocmd("FileType", {
  pattern = "telescopePrompt",
  callback = paste_clipboard_to_telescope,
})

vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = true}"
