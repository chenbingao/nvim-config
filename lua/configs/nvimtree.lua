dofile(vim.g.base46_cache .. "nvimtree")

local ui = vim.api.nvim_list_uis()[1]
local gheight = ui.height
local gwidth = ui.width

-- 计算浮窗宽高为屏幕的 3/4
local width = math.floor(gwidth * 0.75)
local height = math.floor(gheight * 0.75)

return {
  filters = { dotfiles = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    width = 30,
    preserve_window_proportions = true,
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((gheight - height) * 0.5),
        col = math.floor((gwidth - width) * 0.5),
      },
    },
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        default = "󰈚",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
        git = { unmerged = "" },
      },
    },
  },
}
