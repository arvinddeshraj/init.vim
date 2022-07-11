" Don't have to reach over to escape button
inoremap ii <Esc>
syntax enable
filetype plugin indent on

" Netrw Configuration
" best looking style
let g:netrw_liststyle = 3
" Don't look at the banner anyway
let g:netrw_banner = 0 
" Open files from netrw in hsplit, 2 for vsplit
let g:netrw_browse_split = 0 
" Only take up 25% of the window
let g:netrw_winsize = 25

let mapleader = " "
let g:python3_host_prog = "/home/arvind/envs/neovim/bin/python3"

" coq_nvim settings
let g:coq_settings = { 'auto_start': 'shut-up' }
" make rooter manual
let g:rooter_manual_only = 1

call plug#begin(stdpath('data') . '/plugged')

" Misc
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'psf/black', {'branch': 'stable'}
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'
Plug 'rhysd/git-messenger.vim'
Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" In-built neovim lsp configuration
Plug 'neovim/nvim-lspconfig'
" auto completion
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'glepnir/lspsaga.nvim'


" Telescope plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Aesthetics
Plug 'mhartington/oceanic-next'
Plug 'psliwka/vim-smoothie'
Plug 'mkitt/tabline.vim'
Plug 'junegunn/goyo.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tjdevries/cyclist.vim'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'rebelot/kanagawa.nvim'

call plug#end()

" Easier to move between splits
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>

" Colorscheme Configuration
colorscheme kanagawa

" Lualine
lua << EOF
require('lualine').setup{}
EOF
