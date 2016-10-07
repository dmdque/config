source ~/.antigenrc

# zsh-syntqx-highlighting
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'  # Get rid of path highlight

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
#zle -N zle-line-init  # fixes 'no such widget error' when using with fzf, but breaks zsh-history-substring-search

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# ----
# Allow command line editing in an external editor.
# https://www.reddit.com/r/vim/comments/4qwiyp/is_there_a_better_vimlike_shell_than_zshells_vim/
# https://github.com/sorin-ionescu/prezto/blob/4f19700919c8ebbaf75755fc0d03716d13183f49/modules/editor/init.zsh#L74
autoload -Uz edit-command-line
zle -N edit-command-line
#bindkey "^X^E" edit-command-line
bindkey -M vicmd v edit-command-line

# Aliases
alias agen='antigen'
alias ctg='ctags -R .'  # must be exuberant ctags
alias ssx ssh -C -X -c blowfish
alias rl='ssh ubuntu@rtmp.shoppie.tv "tail -f /usr/local/nginx/logs/access.log"'
alias sshrtmp='ssh ubuntu@rtmp.shoppie.tv'
alias sf='find . -iname'  # search file
alias search='rg --files -g'
alias upod='~/.gem/ruby/2.3.0/bin/pod'
alias -s zshrc=vim
alias -s antigenrc=vim
alias -s gitignore=vim
alias mv='mv -i'
alias cp='cp -i'
alias build_shoppie='xcodebuild -workspace shoppie.xcworkspace -scheme shoppie build'
function dictl() { dict $@ | less }
function vsed() { vim -es $@ '+:q!' /dev/stdin }
# cat ex | vim -es '+%join' '+%s/.*ENOENT.\{-}\(\/.\{-}\)\ .*/\2/g' '+%print' '+:q!' /dev/stdin
function mkcd() { mkdir "$@" ; cd "$@" }

# Less
export LESS='-g -i -M -R -S -w -z-4'

#source /Users/danielque/.gem/ruby/2.2.0/bin
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/danielque/bin"
#PATH=$PATH:~/local/bin:/usr/X11R6/bin
##PATH=$PATH:~/.gem/ruby/2.3.0/bin

# Editing
set -o vi
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
#bindkey '^R' history-incremental-pattern-search-backward
export EDITOR=vim
export VISUAL=vim

# zsh-history-substring-search
# must be after `set -o vi`
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


#
### fix backspace in zsh
#bindkey '^?' backward-delete-char
#bindkey '^H' backward-delete-char

# fzf
# must be after zsh-autosuggestions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#bindkey "\e[3~" delete-char
#
#
## tensorflow
#export CUDA_HOME=/usr/local/cuda
#export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
#export PATH="$CUDA_HOME/bin:$PATH"

# nvm temporary, fix this
export NVM_DIR="/usr/local/opt/nvm/"
#source /usr/local/opt/nvm/nvm.sh
nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }


## unsetopt EXTENDED_GLOB
## setopt IGNORE_BRACES
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

## No arguments: `git status`
## With arguments: acts like `git`
unalias g
function g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
# Complete g like git
compdef g=git
