return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  -- {
  --   "nvimdev/dashboard-nvim",
  --   enabled = false
  -- },
  {
    "folke/flash.nvim",
    enabled = false,
  },
}
