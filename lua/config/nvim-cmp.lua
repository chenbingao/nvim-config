-- local has_words_before = function()
--   unpack = unpack or table.unpack
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
-- end

local cmp = require "cmp"

cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.opt.lazyredraw = true
      local success, err = pcall(function()
        require("luasnip").lsp_expand(args.body)
        vim.schedule(function()
          vim.api.nvim_input "<Esc>"
          vim.opt.lazyredraw = false
        end)
      end)
      if not success then
        vim.opt.lazyredraw = false
        print("Error during snippet expansion: ", err)
      end
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    -- Use <C-b/f> to scroll the docs
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- Use <C-k/j> to switch in items
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Use <CR>(Enter) to confirm selection
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },

    -- A super tab
    -- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
    ["<C-.>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm { select = true }
      -- elseif require("luasnip").expand_or_jumpable() then
      --   require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm { select = true }
      -- elseif require("luasnip").jumpable(-1) then
      --   require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  -- Set source precedence
  sources = cmp.config.sources {
    { name = "nvim_lsp", group_index = 1 }, -- For nvim-lsp
    { name = "luasnip", group_index = 2 }, -- For luasnip user
    { name = "buffer", group_index = 3 }, -- For buffer word completion
    { name = "path", group_index = 4 }, -- For path completion
  },

  -- Let's configure the item's appearance
  -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
  formatting = {
    -- Set order from left to right
    -- kind: single letter indicating the type of completion
    -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
    -- menu: extra text for the popup menu, displayed after "word" or "abbr"
    fields = { "abbr", "menu" },

    -- customize the appearance of the completion menu
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "[Lsp]",
        luasnip = "[Luasnip]",
        buffer = "[File]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
  matching = { disallow_symbol_nonprefix_matching = false },
})

local ok, cmp_auto_pairs = pcall(require, "nvim-autopairs.completion.cmp")
if ok then
  cmp.event:on("confirm_done", cmp_auto_pairs.on_confirm_done())
end
