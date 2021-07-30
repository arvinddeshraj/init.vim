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
Plug 'rust-lang/rust.vim'

" In-built neovim lsp configuration
Plug 'neovim/nvim-lspconfig'
" auto completion
Plug 'hrsh7th/nvim-compe'
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

call plug#end()

" Easier to move between splits
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>

" Colorscheme Configuration
let g:tokyonight_style = "night"
colorscheme tokyonight

" Lualine
lua << EOF
require('lualine').setup{
    options = {
        theme='tokyonight'
        }
}
EOF
