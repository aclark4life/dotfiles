" Set default to use spaces for indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Set Makefile and *.mk to use spaces for indentation
autocmd BufRead,BufNewFile Makefile* set filetype=make
autocmd BufRead,BufNewFile *.mk set filetype=make
autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=0
autocmd FileType just setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=0
