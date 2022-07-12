return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'airblade/vim-gitgutter'
    use 'tpope/vim-surround'

    -- Language specific plugins
    use 'rust-lang/rust.vim'
    use 'ziglang/zig.vim'
    use 'psf/black'

    -- configuration for nvim LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind.nvim'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {'nvim-telescope/telescope-ui-select.nvim' }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

    -- Aesthetics
    use 'psliwka/vim-smoothie'
    use 'mkitt/tabline.vim'
    use 'kyazdani42/nvim-web-devicons'
    use 'hoob3rt/lualine.nvim'
    use 'rebelot/kanagawa.nvim'
end)

