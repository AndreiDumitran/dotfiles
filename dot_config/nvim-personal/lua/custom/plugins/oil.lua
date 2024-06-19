return {
  {
    'stevearc/oil.nvim',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter' },
      { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    opts = {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      lsp_file_methods = {
        timeout_ms = 1000,
        autosave_changes = false,
      },
      view_options = {
        is_always_hidden = function(name, _)
          return vim.startswith(name, '.DS_Store')
        end,
      },
      win_options = {
        signcolumn = 'yes:2',
      },
      keymaps = {
        ['<C-h>'] = false, -- Split
        ['<C-s>'] = false, -- Vsplit
        ['<C-l>'] = false, -- refresh
        ['<M-s>'] = 'actions.select_split',
        ['<M-v>'] = 'actions.select_vsplit',
        ['<M-l>'] = 'actions.refresh',
        ['H'] = 'actions.toggle_hidden',
      },
      float = { padding = 4 },
    },
    config = function(_, opts)
      local oil = require 'oil'
      oil.setup(opts)
      vim.keymap.set('n', '-', oil.open, { desc = 'Open parent directory' })
    end,
  },
  {
    'refractalize/oil-git-status.nvim',

    dependencies = {
      'stevearc/oil.nvim',
    },
    config = true,
    opts = {
      show_hidden = true,
    },
  },
}
