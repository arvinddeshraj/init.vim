require("telescope").setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor {
            }
        }
    }
}
require("telescope").load_extension("ui-select")

vim.keymap.set("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>", { noremap=true })
vim.keymap.set("n", "<Leader>rg", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({}))<cr>", { noremap=true })
vim.keymap.set("n", "<Leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<cr>", { noremap=true })
vim.keymap.set("n", "<c-p>", "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({}))<cr>", { noremap=true })
vim.keymap.set("n", "<Leader>/", function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end)
