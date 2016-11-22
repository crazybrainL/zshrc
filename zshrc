# Path to your oh-my-zsh configuration.
#ZSH=/Users/whlin/Documents/rc/zshrc/oh-my-zsh
ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="yen3"
ZSH_THEME="whlin"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

source $ZSH/oh-my-zsh.sh
#source ~/.nvm/nvm.sh
# Customize to your needs...


UNAME=`uname`
if [[ $UNAME == "Darwin" ]]
then
    #source $HOME/Documents/rc/zshrc/zshrc_darwin 
    source $HOME/.zshsetting/zshrc_darwin 
elif [[ $UNAME == "Linux" ]]
then
    #source $HOME/Documents/rc/zshrc/zshrc_linux
    source $HOME/.zshsetting/zshrc_linux
fi

#source $HOME/Documents/rc/zshrc/func/incr*.zsh
#source $HOME/.zsh/func/incr*.zsh

export EDITOR=vim

# Alias Setting
alias grep='grep --color=auto'
alias ack='ack --color-match=green'
alias ll='ls -al'
alias tmux='tmux -2'

function gg(){
    git commit -a -v -m "$*"
}

alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

hash -d code=~/Documents/code
hash -d src=~/usr/src
hash -d course=~/Documents/course
hash -d rc=~/Documents/rc/
hash -d zshrc=~/Documents/zshrc
hash -d vimfilers=~/Documents/vimfilers
hash -d tmp=~/usr/tmp

# path alias, e.g. cd ~XXX
#hash -d WWW="/home/lighttpd/html"

# HISTORY
# number of lines kept in history
export HISTSIZE=3000
# # number of lines saved in the history after logout
export SAVEHIST=3000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

# Disable core dumps
limit coredumpsize 0

# vi key binding
bindkey -v
bindkey '^R' history-incremental-search-backward
# mapping del
bindkey "\e[3~" delete-char

setopt AUTO_PUSHD

WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# auto-completion
setopt COMPLETE_ALIASES
setopt AUTO_LIST
setopt AUTO_MENU
#setopt MENU_COMPLETE
setopt MULTIBYTE

autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

#zstyle ':completion:*:*:*:default' menu yes select #interactive
zstyle ':completion:*:*:default' force-list always

# require /etc/DIR_COLORS to display colors in the completion list
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

bindkey -M menuselect '^M' .accept-line

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select interactive
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'



function precmd {

local TERMWIDTH
(( TERMWIDTH = ${COLUMNS} - 1 ))

###
# Truncate the path if it's too long.

PR_FILLBAR=""
PR_PWDLEN=""

local promptsize=${#${(%):---(%n@%m)----}}
local pwdsize=${#${(%):-%~}}

if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
((PR_PWDLEN=$TERMWIDTH - $promptsize))
else
PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
fi

###
# Get APM info.

#if which ibam > /dev/null; then
#PR_APM_RESULT=`ibam --percentbattery`
#elif which apm > /dev/null; then
#PR_APM_RESULT=`apm`
#fi
}

setopt extended_glob

# Terminal Title Setting
case $TERM in
xterm*)
    PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
;;
screen)
    PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
;;
*)
    PR_TITLEBAR=''
;;
esac

###
# Decide whether to set a screen title
if [[ "$TERM" == "screen" ]]; then
    PR_STITLE=$'%{\ekzsh\e\\%}'
else
    PR_STITLE=''
fi
precmd () {print -Pn "$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}"}


## Prompt Setting
#setopt prompt_subst
#source $HOME/Documents/rc/zshrc/func/zgitinit 
#source $HOME/Documents/rc/zshrc/func/prompt_wunjo_setup
#source $HOME/.zsh/func/zgitinit 
#source $HOME/.zsh/func/prompt_wunjo_setup


# Key Binding
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

case $TERM in (xterm*)
    bindkey '\eOH' beginning-of-line
    bindkey '\eOF' end-of-line
esac

#And DEL too, as well as PGDN and insert:
bindkey '^[[3~' delete-char
bindkey '^[[6~' end-of-history
#bindkey '\e[2~' redisplay

#Now bind pgup to paste the last word of the last command,
bindkey '\e[5~' insert-last-word

set -o vi

# multi-download command
function pget()
{
    echo $1
    cmd="pget -n 5 $1; exit"
    lftp -e "$cmd"
}

# go-lang environment setting
if [[ -d "/usr/local/go" ]]; then
    #statements
    export PATH="/usr/local/go/bin:$PATH"
    export GOPATH="/usr/local/go"
fi

# pyenv environment setting
if [[ -d $HOME/.pyenv ]]; then
    #statements
    export PATH="$HOME/.pyenv/bin:$PATH"
    # it will add $HOME/.pyenv/shims to $PATH
    eval "$(pyenv init -)"
    # it will add $HOME/.pyenv/plugins/pyenv-virtualenv/shims to $PATH
    eval "$(pyenv virtualenv-init -)"
    export PYTHON_CONFIGURE_OPTS="--enable-framework"
fi

if [[ -d $HOME/.fzf ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
