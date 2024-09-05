" Set default to use spaces for indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Define autocmd for makefiles to use spaces for tabs
autocmd BufRead,BufNewFile Makefile* set filetype=make
autocmd BufRead,BufNewFile *.mk set filetype=make
autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=0
