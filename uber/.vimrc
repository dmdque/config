set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sjl/gundo.vim' " Thanks to Dave
"Plugin 'enomsg/vim-haskellConcealPlus' " converts text into super nice math
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimproc.vim'
Plugin 'mileszs/ack.vim'
"Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"Plugin 'Shougo/neosnippet.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'vim-jp/vital.vim'
"Plugin 'jaxbot/selective-undo.vim' " very buggy plugin
Plugin 'kana/vim-operator-user'
Plugin 'kana/vim-operator-replace'
Plugin 'tpope/vim-unimpaired'  " for [l, ]l

" Colourschemes
Plugin 'morhetz/gruvbox'
Plugin 'freeo/vim-kalisi'
Plugin 'altercation/vim-colors-solarized'
" my plugins
"Plugin 'file:///Users/danielq/projects/git/cubetime.vim'
"Bundle '~/path/your-plugin/.git'
"Bundle '/Users/danielq/projects/git/cubetime.vim/.git' " ?? works?

"Plugin 'jgdavey/tslime.vim' " execute code in shell
" ctrlsf?
" TO INSTALL
"quickrun
"caw
"xsurround
"quicklearn
"calendar

" language syntax
Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'  " don't need this if I have syntastic

Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'solarnz/thrift.vim'
" for ejs
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'derekwyatt/vim-scala'


noremap <silent> <F4> :GundoToggle<CR>

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Easymotion
map <Tab> <Plug>(easymotion-prefix)
nmap <Tab>/ <Plug>(easymotion-sn)
nmap <Tab>w <Plug>(easymotion-w)
nmap <Tab>b <Plug>(easymotion-bd-w)

nnoremap <C-k> <Tab> " since <C-i> isn't working
"nnoremap <nowait> <C-i> <Tab>

call vundle#end()
filetype plugin indent on

let mapleader = " "
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
" imap jj <Esc> " maps jj to esc (only want this in insert mode) " maybe jlj like uji?


set showcmd " show commands in bottom right


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
" not working in gvim for some reason
nnoremap <C-s> :<C-u>update<CR>


" bug for when cursor is at end of line
inoremap <C-s> <Esc>:update<CR>a


" delete next word in insert mode
inoremap <C-d> <Esc>l"_dei


au BufNewFile,BufRead *.ejs set filetype=html " ejs


" select pasted text
nnoremap gV `[v`]


" make Y more like C and C
nnoremap Y y$


" yank function shell
" yanks line and corresponding closing match
" ASSUMPTIONS:
" - curly braces
" - opening brace is on the same line as .
" - closing brace is on a different line
" note: yY makes sense in terms of muscle memory, but not in terms of vim standards
" TODO: extend this to recursively yank for if-elseif blocks
" TODO: maybe also copy to register "0? (since it's an explicit yank)
"nnoremap yY mzyyf{%:let @+=@+.getline('.')."\n"<CR>`z
function! s:yankshell()
  normal mzyy$
  normal F{f{ " to ensure we grab the last one
  normal %
  let @+=@+.getline('.')."\n"
  normal `z
endfunction

nnoremap yY :<C-u>call <SID>yankshell()<Cr>

syntax on

runtime macros/matchit.vim

set wildmenu " command line autocomplete menu

" auto-center line when using n or N
nnoremap n nzz
nnoremap N Nzz

nnoremap <Del> "_x


" for english
set spelllang=en_ca
set spell


" gruvbox better for terminal
" for some reason, only works if both are set sequentially
colorscheme blackboard
colorscheme gruvbox


" GitGutter
highlight clear SignColumn " to look good with gitgutter
autocmd VimEnter * highlight clear SignColumn " to look good with gitgutter in Ubuntu
set updatetime=750

"autocmd VimEnter * GitGutterLineHighlightsEnable

" make Ack use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" from Justin
"fixes vim backspace in zsh
  "value	effect
    "0	same as ":set backspace=" (Vi compatible)
    "1	same as ":set backspace=indent,eol"
    "2	same as ":set backspace=indent,eol,start"
set backspace=2


"autocmd VimEnter * set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14


let g:unite_source_grep_max_candidates = 50000


"" grep if no ag options
"let g:unite_source_rec_ignore_pattern = 'env'
"call unite#sources#rec#define()
"call unite#custom#source('file_rec/async,file_mru,file,buffer,grep', 'ignore_pattern', g:unite_source_rec_ignore_pattern)


" from uji
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore tags'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack in unite grep source.
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
                \ '-i --no-heading --no-color -H ' .
                \ '--ignore-dir="env"'
    let g:unite_source_grep_recursive_opt = ''
endif

" also from uji
if globpath(&rtp, 'plugin/unite.vim') != ''
  " make it hard to invoke accidentally
  nnoremap <Leader>P :<C-u>Unite file_rec/async:! -default-action=split -direction=rightbelow<Cr>
endif

nnoremap <Leader>rc :vsp ~/.vimrc<CR>
nnoremap <Leader>so :source %<CR>


" prevent auto line breaks
set tw=0


" neosnippet
" Plugin key-mappings.
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

"" For neosnippet
"if has('conceal')
  "set conceallevel=2 concealcursor=i
"endif


" for behaviour similar to 'C', 'D', 'Y'
nnoremap <Leader>v vg_


" CtrlP
let g:ctrlp_max_depth = 20
let g:ctrlp_max_files = 40000
let g:ctrlp_working_path_mode = '0' " for CtrlP local working directory
let g:ctrlp_custom_ignore = {
  \ 'dir': 'tnoodle\|node_modules\|dist\|env',
  \ 'file': '.*\.png'
  \ }


" highlights trailing spaces
set listchars=tab:>-,trail:_ list


" operator-replace
" replace text without clobbering paste register
" just use g@ instead
map _ <Plug>(operator-replace)

nnoremap <C-F> :<C-u>Unite grep<CR><CR>


" rough (shouldn't use v)
" jump to '{' of container {} block
nnoremap [{ va{%<Esc>
nnoremap [} va{<Esc>


" NERDTree bindings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-j> :NERDTreeFind<CR>

" Keep 3 lines above and below cursor
set scrolloff=3


" fix vim in tmux on osx
set t_ut=


" make n/N direction consistent
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]


" e - jump when <cr> is pressed, but only to windows in the current tab.
" t - jump when <c-t> is pressed, but only to windows in another tab.
  " t will open in a new tab if not in any other tabs
let g:ctrlp_switch_buffer = 'et'


" TODO: shortcut (and plugin) to copy filepath to clipboard


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['linttrap']
" Flake8
"let g:flake8_cmd='/usr/local/bin/flake8'


nnoremap <F7> :SyntasticCheck<CR>
nnoremap <F8> :SyntasticReset<CR>


" Set working directory to current file
" Note: this is a temp hack for linttrap.vim
" :p: full path
" :h: directory head
nnoremap <F9> :lcd %:p:h<CR>
nnoremap <F10> :cd ~/Uber/sync/danielq.dev.uber.com/home/uber/kaleidoscope<CR>  " suuuper hacky


" Ensure filename shown in statusline, even with Syntastic
"set statusline+=%f  " TODO: make idempotent so file can be sourced after Vim start
" check if end of statusline has '%f'
set statusline=
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*
set statusline+=%f\ %m\%=line:%l/%L\ col:%c\ --%p%%--
set laststatus=2  " statusline always visible


" Disable YouCompleteMe scratch preview
set completeopt=menuone


" Wrap in '' and add trailing comma
function! SQLListify()
    %s/\(\S*\)/'\1',/g
    $s/,$/
endfunction
command! SQLListify call SQLListify()


" Format all uuids
function! FormatUUIDS()
    %s/\<
      \\([0-9A-Fa-f]\{8\}
      \\)\([0-9A-Fa-f]\{4\}\)
      \\([0-9A-Fa-f]\{4\}\)
      \\([0-9A-Fa-f]\{4\}\)
      \\([0-9A-Fa-f]\{12\}\)
      \\>
      \/\1-\2-\3-\4-\5
      \/g
endfunction
command! FormatUUIDS call FormatUUIDS()
