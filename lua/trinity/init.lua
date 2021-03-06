-- Netrw configuration
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.hidden = true -- buffers stay around
vim.opt.equalalways = false -- windows stay the same

-- Text completion
vim.opt.completeopt = {"menu","menuone"}

-- Default splits
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.updatetime = 1000
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
}

vim.g.mapleader = " " -- space is the leader

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Plugins
require("trinity.packer")
require("trinity.maps")
require("trinity.lsp")
require("trinity.telescope")
require("trinity.treesitter")

vim.cmd('colorscheme kanagawa')

require("lualine").setup {}
