local opt = vim.opt
vim.g.mapleader = " "
opt.breakindent = true
opt.undofile = true
opt.completeopt = 'menuone,noselect'
opt.shiftwidth = 4
opt.expandtab = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.incsearch = true
opt.scrolloff = 8
opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"
opt.relativenumber = true
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")
