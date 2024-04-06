local o = vim.opt

o.termguicolors = true
o.clipboard = "unnamedplus"

o.cursorline = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.smartindent = true

o.wrap = false

o.number = true
o.relativenumber = true

o.numberwidth = 4
o.incsearch = true
o.hlsearch = true

o.splitbelow = true
o.splitright = true

o.hidden = true
o.scrolloff = 8

o.mouse = "nvi"

o.ignorecase = true
o.smartcase = true

o.backup = false
o.swapfile = false
o.undofile = true

o.fileencoding = "utf-8"
o.fileformat = "unix"
o.fileformats = "unix,dos"

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
