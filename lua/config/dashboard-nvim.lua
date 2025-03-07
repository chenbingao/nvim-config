require("dashboard").setup {
  theme = "doom",
  config = {
    header = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      "           Welcome to Neovim         ",
      [[]],
      [[]],
      [[          ▀████▀▄▄              ▄█ ]],
      [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
      [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
      [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
      [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
      [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
      [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
      [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
      [[   █   █  █      ▄▄           ▄▀   ]],
      [[]],
      [[]],
      [[]],
    }, -- 自定义头部
    center = {
      {
        desc = "Projects                            ",
        action = "Telescope projects",
        icon = "󰃃 ",
      },
      { desc = "Restore Session", action = 'lua require("persistence").load()', icon = " ", key = "s" },
      -- 其他按钮...
    },
    footer = function()
      ---@diagnostic disable-next-line: different-requires
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
    end,
  },
}
