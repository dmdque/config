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
Plugin 'morhetz/gruvbox'
"Plugin 'jaxbot/selective-undo.vim' " very buggy plugin
Plugin 'kana/vim-operator-user'
Plugin 'kana/vim-operator-replace'

" my plugins
Plugin 'file:///Users/danielq/projects/git/cubetime.vim'
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
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
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
"let g:EasyMotion_mapping_f='<Tab>l'
"let g:EasyMotion_mapping_F='<Tab>h'
"let g:EasyMotion_mapping_w='<Tab><S-l>'
"let g:EasyMotion_mapping_W='<Tab><S-h>'
"let g:EasyMotion_mapping_j='<Tab>j'
"let g:EasyMotion_mapping_k='<Tab>k'

nnoremap <C-k> <Tab> " since <C-i> isn't working
"nnoremap <nowait> <C-i> <Tab>

call vundle#end()
filetype plugin indent on

let mapleader = " "
set number " set line number
set expandtab " turns tabs into spaces
" general preference
"set shiftwidth=2 " for |<<| and |>>|
"set tabstop=2 " sets tabs to be two spaces
set shiftwidth=4 " for |<<| and |>>|
set tabstop=4 " sets tabs to be two spaces
set incsearch " highlights search as you type
set ignorecase " ignores case for search
set smartcase " turns off ignorecase if one or more uppercase letters are in the search query
" imap jj <Esc> " maps jj to esc (only want this in insert mode) " maybe jlj like uji?

set showcmd " show commands in bottom right

" if the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
"command -nargs=0 -bar Update if &modified 
                           "\|    if empty(bufname('%'))
                           "\|        browse confirm write
                           "\|    else
                           "\|        confirm write
                           "\|    endif
                           "\|endif

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
inoremap <C-d> <Esc>ldei

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
"colorscheme gruvbox

" GitGutter
highlight clear SignColumn " to look good with gitgutter
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

autocmd VimEnter * set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14

let g:unite_source_grep_max_candidates = 50000

" from uji
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore tags'
  let g:unite_source_grep_recursive_opt = ''
endif

" also from uji
if globpath(&rtp, 'plugin/unite.vim') != ''
  " make it hard to invoke accidentally
  nnoremap <Leader>P :<C-u>Unite file_rec/async:! -default-action=split -direction=rightbelow<Cr>
  "nnoremap s <Nop>
  "nnoremap ss :<C-u>Unite file_rec -default-action=split -direction=rightbelow<Cr>
  "nnoremap sS :<C-u>Unite file_rec/async:! -default-action=split -direction=rightbelow<Cr>
  "nnoremap se :<C-u>Unite file_rec/async<Cr>
  "nnoremap so :<C-u>Unite outline -auto-preview -buffer-name=outline<Cr>
  "nnoremap sc :<C-u>Unite colorscheme font -auto-preview<Cr>
  "nnoremap sf :<C-u>UniteWithBufferDir file_rec -default-action=split<Cr>
  "nnoremap sm :<C-u>Unite file_mru -default-action=split<Cr>
  "nnoremap sb :<C-u>Unite buffer -default-action=split<Cr>
  "nnoremap sre :<C-u>Unite ref/man ref/hoogle ref/pydoc -default-action=split<Cr>
  "nnoremap su :<C-u>Unite history/command source command<Cr>
  "nnoremap sp :<C-u>Unite process -no-split -buffer-name=process<Cr>
  "nnoremap sq :<C-u>UniteClose build<Cr>
  "nnoremap <space>R :<C-u>Unite quicklearn -immediately<Cr>

  "nnoremap <space>M :Unite -buffer-name=build -no-focus build::
  "nnoremap <space>m :<C-u>write<Cr>:Unite -buffer-name=build -no-focus build:<Cr>
endif

nnoremap <Leader>rc :vsp ~/.vimrc<CR>
nnoremap <Leader>so :source %<CR>

set tw=0 " prevent auto line breaks

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

"" cube timer plugin begin
"let s:timerRunFlag = 0
"let g:timesList = []
"function! s:toggle_timer()
  "if s:timerRunFlag == 0
    "let s:timerRunFlag = 1
    "let s:starttime = reltime()
  "else
    "let g:endtime = split(reltimestr(reltime(s:starttime)))[0] " split used to remove leading space, as suggested by :h
    "let s:timerRunFlag = 0
    "let g:timesList += [g:endtime]
    "echo "time: " . g:endtime . ", mean of " . len(g:timesList) . ": " . printf('%f', g:ao5(g:timesList))

  "endif
"endfunction

"function! g:ao5(timeList)
  "" TODO:
    "" tail 5
    "" exclude best and worst
    "" use vital's foldl
  "let s:sum = 0.0
  "for item in a:timeList
    "let s:sum = s:sum + str2float(item)
  "endfor
  "return s:sum / len(a:timeList)
"endfunction

"nnoremap <Space><Space> :<C-u>call <SID>toggle_timer()<Cr>
"" cube timer plugin end

" cubetimer

" CtrlP
let g:ctrlp_max_depth = 20
let g:ctrlp_max_files = 40000
let g:ctrlp_working_path_mode = '0' " for CtrlP local working directory
let g:ctrlp_custom_ignore = {
  \ 'dir': 'tnoodle\|node_modules\|dist',
  \ 'file': '.*\.png'
  \ }

" highlights trailing spaces
set listchars=tab:>-,trail:_ list

" operator-replace
" just use g@ instead
map _ <Plug>(operator-replace)
