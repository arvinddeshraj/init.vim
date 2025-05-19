return {
    { 
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {},
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        -- "rcarriga/nvim-notify",
        }
    },
    {
        'echasnovski/mini.nvim',
        config = function()
            local statusline = require "mini.statusline"
            statusline.setup { use_icons = true }
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    }
}
