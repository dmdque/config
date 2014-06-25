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

" if the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

" highlights all instances of search string
set hlsearch

" use same clipboard as OS
" (need to compile vim with +clipboard for this to work)
" set clipboard=unnamedplus

" for plugin
filetype plugin on

" make cw consistent with dw, yw, vw
onoremap w :execute 'normal! '.v:count1.'w'<CR>

" allows mouse to be used
set mouse=nv

" stop auto line commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" autoindenting
set autoindent

" use same clipboard as machine
set clipboard=unnamedplus
