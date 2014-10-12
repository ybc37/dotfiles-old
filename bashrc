#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/git/completion/git-prompt.sh

# ...default:
#PS1='[\u@\h \W]\$ '
# ...git-prompt:
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export EDITOR="vim"

bind 'set completion-ignore-case on'

set -o vi
complete -cf sudo

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

o() { [ -z "$@" ] && command kde-open . || command kde-open "$@" ; }

alias ag='ag -S --pager="less -XFR" --stats'

#http://stackoverflow.com/questions/7381039/how-can-i-remove-the-default-empty-buffer-from-vim
g() { [ -z "$(command gvim --serverlist)" ] && command gvim "$@" || command gvim --remote-silent "$@" ; }

alias gg='g .'

f() { find -iname "*$1*"; }

export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

export PATH="$PATH:$HOME/bin"

