" Python specific configuration

" Formatting
setlocal autoindent
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab

" ColorColumn=120 for Python, black formatting with line-length 119
setlocal colorcolumn=120

" Black format on save
autocmd BufWritePre *.py execute ':Black'
