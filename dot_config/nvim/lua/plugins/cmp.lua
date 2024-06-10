return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      cmp.setup({
        window = {
          completion = {
            border = "rounded",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          },
          documentation = cmp.config.window.bordered({
            documentation = {
              -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
              border = "rounded",
              winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            },
          }),
        },
        preselect = "none",
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
        },
      })
    end,
    keys = {},
  },
}
