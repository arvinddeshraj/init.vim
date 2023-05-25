local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'airblade/vim-gitgutter'
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

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
    use {'williamboman/mason.nvim', run = ":MasonUpdate"}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {'nvim-telescope/telescope-ui-select.nvim' }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/playground'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

    -- Aesthetics
    use 'psliwka/vim-smoothie'
    use 'mkitt/tabline.vim'
    use 'kyazdani42/nvim-web-devicons'
    use 'hoob3rt/lualine.nvim'
    use 'rebelot/kanagawa.nvim'
    use({
        "glepnir/lspsaga.nvim",
        opt = true,
        branch = "main",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({})
        end,
        requires = {
            {"nvim-tree/nvim-web-devicons"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    })
    -- use({
    --   "folke/noice.nvim",
    --   event = "VimEnter",
    --   config = function()
    --     require("noice").setup()
    --   end,
    --   requires = {
    --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --     "MunifTanjim/nui.nvim",
    --     "rcarriga/nvim-notify",
    --     }
    -- })

    if packer_bootstrap then
        require('packer').sync()
    end
end)

