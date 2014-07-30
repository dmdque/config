set number " set nu
set expandtab " turns tabs into spaces
set shiftwidth=2 " for |<<| and |>>|
set tabstop=2 " sets tabs to be two spaces
set incsearch
set ignorecase
set smartcase
" imap jj <Esc> " maps jj to esc (only want this in insert mode)

set showcmd " show commands in bottom right

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

set hlsearch " highlights all instances of search string
filetype plugin on " for plugins

" make cw consistent with dw, yw, vw
onoremap w :execute 'normal! '.v:count1.'w'<CR>

set mouse=nv " allows mouse to be used in normal and visual modes
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " stop auto line commenting
set autoindent " autoindenting
set clipboard=unnamedplus " use machine clipboard (need to compile vim with +clipboard for this to work)
set runtimepath^=~/.vim/bundle/ctrlp.vim " for ctrlp. make sure to double check installation was done properly
colorscheme blackboard

" settings for gvim
"set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right-hand scroll bar
set guioptions-=L " remove left-hand scroll bar

execute pathogen#infect()
" for pathogen plugin

set wildignore+=*\/dist\/*
set wildignore+=*\/test\/*

" save similar to other programs
" not working in tvim for some reason
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>li

" delete next word in insert mode
inoremap <C-d> <Esc>ldei

"let g:ycm_min_num_of_chars_for_completion = 2
"let g:ycm_min_num_identifier_candidate_chars = 1
let g:ctrlp_working_path_mode = '0'

au BufNewFile,BufRead *.ejs set filetype=html " ejs

" select pasted text
nnoremap gV `[v`]

" make Y more like C and C
nnoremap Y y$

" yanks line and corresponding closing match
nnoremap yY mzyy$%:let @+=@+.getline('.')."\n"<CR>`z
