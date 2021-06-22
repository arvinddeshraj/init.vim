" All sets
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

" Resize windows and move tabs and such with the mouse
set mouse=a

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

" Colors
set background=dark
set colorcolumn=80
