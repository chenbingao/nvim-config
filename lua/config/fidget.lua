local fidget = require "fidget"

fidget.spinner.patterns.dice = {
  "󰇊",
  "󰇋",
  "󰇌",
  "󰇍",
  "󰇎",
  "󰇏",
}

local local_config = {
  name = "",
  icon = "",
  ttl = 5,
  group_style = "Title",
  icon_style = "Special",
  annote_style = "Question",
  debug_style = "Comment",
  info_style = "Question",
  warn_style = "WarningMsg",
  error_style = "ErrorMsg",
  debug_annote = " ",
  info_annote = " ",
  warn_annote = " ",
  error_annote = " ",
  icon_on_left = true,
}

fidget.setup {
  progress = {
    display = {
      progress_icon = { pattern = "dice", period = 1 },
      done_icon = "✔",
    },
  },

  notification = {
    override_vim_notify = true,
    filter = vim.log.levels.INFO,
    window = {
      relative = "win",
      border = "single",
      zindex = 45,
    },
    configs = { default = local_config },
  },
}
local function adjust_fidget_position()
  local win = fidget.get_fidget_win()
  if win then
    vim.api.nvim_win_set_config(win, {
      relative = "editor",
      row = 1,
      col = 1,
      width = 50,
      height = 10,
    })
  end
end

vim.api.nvim_create_autocmd("User", {
  pattern = { "NvimTreeFloatOpen", "NvimTreeFloatClose" },
  callback = adjust_fidget_position,
})
