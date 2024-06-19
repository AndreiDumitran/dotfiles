return {
  { 'tpope/vim-sleuth' },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { 'f-person/git-blame.nvim' },
  { 'RRethy/vim-illuminate' },
  {
    'askfiy/lsp_extra_dim',
    event = { 'LspAttach' },
    config = function()
      require('lsp_extra_dim').setup()
    end,
  },
}
