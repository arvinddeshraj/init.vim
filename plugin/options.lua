vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.hidden = true -- buffers stay around
vim.opt.equalalways = false -- windows stay the same

-- Text completion
vim.opt.completeopt = {"menu","menuone","noselect"}

-- Default splits
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.updatetime = 250
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.cmdheight = 1 -- height of the command bar
vim.opt.belloff = "all" -- no sounds
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a" -- blasphemy
vim.opt.fileencoding = "utf-8"
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 300
vim.opt.ruler = true
vim.opt.list = true
vim.opt.listchars = {
  eol = '⤶',
  trail = '.',
  tab = '➤ '
}
vim.opt.formatoptions:remove "o"

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.breakindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.undofile = true
