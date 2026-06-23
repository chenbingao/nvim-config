-- nvim-ufo (Ultra Folding) configuration

-- Disable native folding, nvim-ufo handles it
vim.opt.foldenable = false
vim.opt.foldcolumn = "0" -- hide fold column, ufo provides its own indicators
vim.opt.foldlevel = 99 -- open all folds by default
vim.opt.foldlevelstart = 99
vim.opt.fillchars:append { foldopen = "", foldclose = "", foldsep = " " }

local ufo = require "ufo"

-- Fold provider: use ufo's own foldexpr with provider_selector chain
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = 'v:lua.require("ufo").foldexpr()'

ufo.setup {
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
  -- Preview folded text without opening the fold
  preview = {
    win_config = {
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      winblend = 0,
    },
    mappings = {
      scrollU = "<C-u>",
      scrollD = "<C-d>",
      jumpTop = "[",
      jumpBot = "]",
    },
  },
  -- Fold keymaps
  enable_get_fold_virt_text = true,
}

-- Keymaps for folding
vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zp", ufo.peekFoldedLinesUnderCursor, { desc = "Peek folded lines" })
