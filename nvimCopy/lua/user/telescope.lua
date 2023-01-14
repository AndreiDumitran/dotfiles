local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fp', "<CMD>:Telescope projects<CR>", {})
vim.keymap.set('n', '<S-Tab>', builtin.buffers, {})

