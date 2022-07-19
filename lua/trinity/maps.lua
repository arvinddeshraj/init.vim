-- Window Movement
vim.keymap.set("n", "<Leader>h", ":wincmd h<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>j", ":wincmd j<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>k", ":wincmd k<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>l", ":wincmd l<CR>", { noremap=true, silent=true })

-- no reaching Esc
vim.keymap.set("i", "ii", "<Esc>", { noremap=true, silent=true })

-- Black format
vim.keymap.set("n", "<F9>", ":Black<CR>", { noremap=true, silent=true })
