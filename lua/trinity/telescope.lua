vim.keymap.set("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>", { noremap=true })
vim.keymap.set("n", "<Leader>rg", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({}))<cr>", { noremap=true })
vim.keymap.set("n", "<Leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<cr>", { noremap=true })
vim.keymap.set("n", "<c-p>", "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({}))<cr>", { noremap=true })
