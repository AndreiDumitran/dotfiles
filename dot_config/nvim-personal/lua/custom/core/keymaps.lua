-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local keymap = vim.keymap.set

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Search next and center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Search prev and center' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move block and indent down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move block and indent up' })
vim.keymap.set('n', '<S-tab>', '<cmd>:Telescope buffers<cr>', { desc = 'show buffers' })
vim.keymap.set('x', 'p', 'v_P')
vim.keymap.set('n', 'y', '"+y')
vim.keymap.set('v', 'y', '"+y')
vim.keymap.set('n', '<C-i>', '<C-i>')
vim.keymap.set({ 'n', 'x' }, '<leader>sr', function()
  require('ssr').open()
end)

vim.keymap.set('n', 'gl', function()
  vim.diagnostic.open_float()
end, { desc = 'Open floating diagnostic message' })

vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
vim.o.laststatus = 3

vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'Visual' })

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
