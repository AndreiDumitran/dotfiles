
return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>at', '<cmd>AerialToggle<cr>', desc = 'See functions' },
    { '<M-n>', '<cmd>AerialNext<cr>', desc = 'Next function' },
    { '<M-N>', '<cmd>AerialPrev<cr>', desc = 'Prev function' },
  },
  eys = {},
}
