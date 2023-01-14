vim.g.mapleader = " "

local keymap = vim.keymap
local builtin = require('telescope.builtin')

keymap.set("n", "<leader>e", vim.cmd.Ex)

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
keymap.set("x", "p", [["_dP]])
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
keymap.set({"n", "v"}, "<leader>d", [["_d]])
keymap.set("n", "x", '"_x"')

-- This is going to get me cancelled
keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>f", vim.lsp.buf.format)

keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>h", ":nohl<CR>")

keymap.set("n", "<leader>v", "<C-w>v")
keymap.set("n", "<leader>sh","<C-w>s")
keymap.set("n", "<leader>se","<C-w>=")
keymap.set("n", "<leader>q", ":close<CR>")

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")


keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>ft', builtin.live_grep, {})
keymap.set('n', '<leader>fp', "<CMD>:Telescope project<CR>", {})
keymap.set('n', '<S-Tab>', builtin.buffers, {})
