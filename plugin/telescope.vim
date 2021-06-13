nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files{previewer = false}<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep{}<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers{}<cr>
nnoremap <c-p> <cmd>lua require('telescope.builtin').git_files{}<cr>
nnoremap <leader>nc <cmd>lua require('telescope.builtin').find_files{cwd="~/cfg/nvim/.config/nvim/"}<cr>
