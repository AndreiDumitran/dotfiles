-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

keymap("n", "<C-d>", "<C-d>zz", { desc = "Move down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Move up and center" })
keymap("n", "n", "nzzzv", { desc = "Search next and center" })
keymap("n", "N", "Nzzzv", { desc = "Search prev and center" })
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block and indent down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block and indent up" })
keymap("n", "<S-tab>", "<cmd>:Telescope buffers<cr>", {desc = "show buffers"})
keymap("x", "p", "v_P")
keymap("n", "y", '"+y')
keymap("v", "y", '"+y')
vim.keymap.set({ "n", "x" }, "<leader>sr", function()
  require("ssr").open()
end)

keymap("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Open floating diagnostic message" })

