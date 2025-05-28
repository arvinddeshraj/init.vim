return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
        require("telescope").setup {
            pickers = {
                find_files = {
                    theme = "ivy"
                }
            }
        }

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")

        vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
        vim.keymap.set("n", "<space>en", function()
            require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath('config')
            }
        end)
        vim.keymap.set("n", "<space>gf", require("telescope.builtin").git_files)
        vim.keymap.set("n", "<space>rg", require("telescope.builtin").live_grep)
    end
}
