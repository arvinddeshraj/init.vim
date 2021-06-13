" Don't have to reach over to escape button
inoremap ii <Esc>

syntax enable
filetype plugin indent on
set encoding=utf-8
set termguicolors
set t_Co=256
set shell=/usr/bin/zsh
set number relativenumber
" Show line and column number for cursor
set ruler
" Backspace works now
set backspace=indent,eol,start

" cursorline highlights the current line. Disabling because it slows down (n)vim 
set nocursorline 

" Default directions for splitting
set splitright
set splitbelow

"Search Highilghting 
set nohlsearch
" Indentation 
set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set noswapfile
set noshowmode
set timeoutlen=300 "http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set ls=2

" completion options
set completeopt=menuone,noselect

"Clipboard
" Paste from clipboard "+p
" Copy from clipboard "+y
set clipboard+=unnamedplus


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

call plug#begin("~/.config/nvim/plugged")

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

" In-built neovim lsp configuration
Plug 'neovim/nvim-lspconfig'
" auto completion
Plug 'hrsh7th/nvim-compe'


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

call plug#end()

" Easier to move between splits
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>


" FZF Configuration
let g:fzf_layout = {'window': {'width': 0.6, 'height': 0.4 }}

" Colorscheme Configuration
set background=dark
colorscheme OceanicNext
set colorcolumn=80
