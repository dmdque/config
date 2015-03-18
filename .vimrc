set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'

" for ejs
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'


Plugin 'sjl/gundo.vim'
  noremap <silent> <F4> :GundoToggle<CR>

Plugin 'Lokaltog/vim-easymotion'
  map <Tab> <Plug>(easymotion-prefix)
  "let g:EasyMotion_mapping_f='<Tab>l'
  "let g:EasyMotion_mapping_F='<Tab>h'
  "let g:EasyMotion_mapping_w='<Tab><S-l>'
  "let g:EasyMotion_mapping_W='<Tab><S-h>'
  "let g:EasyMotion_mapping_j='<Tab>j'
  "let g:EasyMotion_mapping_k='<Tab>k'

" converts text into super nice math
"Plugin 'enomsg/vim-haskellConcealPlus'

" execute code in shell
Plugin 'jgdavey/tslime.vim'

"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line







set number " set line number
set expandtab " turns tabs into spaces
" general preference
set shiftwidth=2 " for |<<| and |>>|
set tabstop=2 " sets tabs to be two spaces
"set shiftwidth=4 " for |<<| and |>>|
"set tabstop=4 " sets tabs to be two spaces
set incsearch " highlights search as you type
set ignorecase " ignores case for search
set smartcase " turns off ignorecase if one or more uppercase letters are in the search query
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
" for ubuntu systems
"set clipboard=unnamedplus " use machine clipboard (need to compile vim with +clipboard for this to work)
" for mac systems
set clipboard=unnamed " use machine clipboard (need to compile vim with +clipboard for this to work)

" settings for gvim
"set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right-hand scroll bar
set guioptions-=L " remove left-hand scroll bar

" save similar to other programs
" not working in tvim for some reason
nnoremap <C-s> :update<CR>

" bug for when cursor is at end of line
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
" assumes opening brace is on the same line as . and closing brace is on a different line
" note: yY makes sense in terms of muscle memory, but not in terms of vim.
" TODO: extend this to recursively yank for if-elseif blocks
" TODO: maybe also copy to register "0? (since it's an explicit yank)
nnoremap yY mzyy$%:let @+=@+.getline('.')."\n"<CR>`z

" Plugin stuff
"set runtimepath^=~/.vim/bundle/ctrlp.vim " for ctrlp. make sure to double check installation was done properly
"execute pathogen#infect()
" for pathogen plugin
syntax on

" CtrlP stuff
set wildignore+=*\/dist\/*
set wildignore+=*\/test\/*

runtime macros/matchit.vim

set wildmenu " command line autocomplete menu

nnoremap n nzz
nnoremap N Nzz

nnoremap <Del> "_x

" for english
set spelllang=en_ca
set spell

colorscheme blackboard
"set background=dark
highlight clear SignColumn " to look good with gitgutter
set updatetime=750

"autocmd VimEnter * GitGutterLineHighlightsEnable

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"fixes vim backspace in zsh
  "value	effect
    "0	same as ":set backspace=" (Vi compatible)
    "1	same as ":set backspace=indent,eol"
    "2	same as ":set backspace=indent,eol,start"
set backspace=2
