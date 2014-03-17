set number " set nu
set expandtab " turns tabs into spaces
set shiftwidth=2 " for |<<| and |>>|
set tabstop=2 " sets tabs to be two spaces
set incsearch
set ignorecase
set smartcase
" imap jj <Esc>

" shows command
set showcmd

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
