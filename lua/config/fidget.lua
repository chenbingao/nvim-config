local ok, fidget = pcall(require, "fidget")
if ok then
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
    debug_annote = " ",
    info_annote = " ",
    warn_annote = " ",
    error_annote = " ",
    icon_on_left = true,
  }

  fidget.setup {
    progress = {
      display = {
        progress_icon = { pattern = "dice", period = 1 },
        done_icon = "✔",
        -- overrides = {
        --   rust_analyzer = { name = "rust-analyzer" },
        --   lua_ls = { name = "lua-ls" },
        -- },
      },
    },

    notification = {
      -- vim.notify = fidget.notify
      override_vim_notify = true,
      filter = vim.log.levels.INFO,
      window = {
        relative = "win", -- 相对于编辑器窗口
        border = "single",
        -- winblend = 0,
        zindex = 45,
      },
      configs = { default = local_config },
    },
  }
end

-- Function to adjust fidget position
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

-- Listen for nvim-tree float window events
vim.api.nvim_create_autocmd("User", {
  pattern = "NvimTreeFloatOpen",
  callback = function()
    adjust_fidget_position()
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "NvimTreeFloatClose",
  callback = function()
    adjust_fidget_position()
  end,
})
