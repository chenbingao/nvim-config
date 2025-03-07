require("persistence").setup {
  dir = vim.fn.stdpath "state" .. "/sessions/", -- directory where session files are saved
  options = { "buffers", "curdir", "tabpages", "winsize" }, -- 保存的会话内容
  need = 1,
  branch = true, -- use git branch to save session
}
