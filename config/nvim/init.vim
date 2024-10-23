" Disable mouse
set mouse=

" Set default to use spaces for indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Set clipboard to use system clipboard
set clipboard=unnamedplus

" Set Makefile and *.mk and justfile to use spaces for indentation
autocmd BufRead,BufNewFile Makefile* set filetype=make
autocmd BufRead,BufNewFile *.mk set filetype=make
autocmd FileType make setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=0
autocmd BufRead,BufNewFile justfile set filetype=just
autocmd FileType just setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=0
