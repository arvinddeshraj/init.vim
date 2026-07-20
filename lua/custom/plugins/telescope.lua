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
                },
                git_files = {
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

        local function vcs_files()
            local builtin = require("telescope.builtin")

            -- first check if we're in a git repo
            vim.fn.system("git rev-parse --is-inside-work-tree")
            if vim.v.shell_error == 0 then
                builtin.git_files()
                return
            end

            -- check if we're in a jj repo
            vim.fn.system("jj root")
            if vim.v.shell_error == 0 then
                builtin.find_files({
                    find_command = { "jj", "file", "list" },
                })
                return
            end

            -- if it's neither git nor jj repo
            vim.notify("Not in a git or jj repository", vim.log.levels.ERROR)
        end

        vim.keymap.set("n", "<space>gf", vcs_files)
        vim.keymap.set("n", "<space>rg", require("telescope.builtin").live_grep)
    end
}
