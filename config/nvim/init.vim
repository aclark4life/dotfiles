" Disable mouse
set mouse=

" Disable clipboard
set clipboard=

" Set default to use spaces for indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Set justfile to use spaces for indentation
autocmd BufRead,BufNewFile justfile set filetype=just
autocmd FileType just setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=0

"set colorcolumn=80  
