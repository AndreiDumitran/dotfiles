local mark = require("harpoon.mark") 
local ui = require("harpoon.ui") 

vim.keymap.set("n", "<leader>m", mark.add_file)
vim.keymap.set("n", "<Tab>", ui.toggle_quick_menu)

vim.keymap.set("n", "<S-h>", function () ui.nav_file(1) end)
vim.keymap.set("n", "<S-j>", function () ui.nav_file(2) end)
vim.keymap.set("n", "<S-k>", function () ui.nav_file(3) end)
vim.keymap.set("n", "<S-l>", function () ui.nav_file(4) end)

