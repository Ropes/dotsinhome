# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias gst='git status'
alias gpp='git pull --prune'
alias gtp='go test -p 1 | grep -v "no test"'
alias gssf='gcloud compute ssh --zone=us-central1-f'
alias gsba='gcloud compute ssh --zone=us-central1-f -A'
alias gsl='glock sync github.com/lytics/lio'
alias gcil='gcloud compute instances list | sed -n "1!p" | sort'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#PATH=$PATH:$HOME/dev/sbt/bin

alias lock='gnome-screensaver-command -l'
export PATH=$PATH:/usr/local/go/bin
#export PATH=$PATH:/home/ropes/dev/GoSrc/go/bin
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$HOME/local/bin

set -o vi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM="xterm-256color"

NO_COLOR="\[\033[0m\]"
LIGHT_WHITE="\[\033[1;37m\]"
WHITE="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"
BLACK="\[\033[0;30m\]"
 
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;94m\]"
LIGHT_BLUE="\[\033[1;34m\]"
MAGENTA="\[\033[0;35m\]"
LIGHT_MAGENTA="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
 
##### EXTRAS #####
function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }
ORANGE="`EXT_COLOR 172`"
YELLOW="`EXT_COLOR 226`"
PURPLE="`EXT_COLOR 99`"

# High Intensity
IBLACK="\[\033[0;90m\]" # Black
IRED="\[\033[0;91m\]" # Red
IGREEN="\[\033[0;92m\]" # Green
IYELLOW="\[\033[0;93m\]" # Yellow
IBLUE="\[\033[0;94m\]" # Blue
IPURPLE="\[\033[0;95m\]" # Purple
ICYAN="\[\033[0;96m\]" # Cyan
IWHITE="\[\033[0;97m\]" # White


function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }

function FABULOUS 
{ 
    echo -ne "${RED}$1$1${ORANGE}$1$1${YELLOW}$1$1${GREEN}$1$1${BLUE}$1$1${IPURPLE}$1$1${NO_COLOR}"; 
}

#export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$"
FAB="${RED}>>${ORANGE}>>${YELLOW}>>${GREEN}>>${BLUE}>>${IPURPLE}>>${NO_COLOR}"; 
CASCADIA="${LIGHT_BLUE}>>>>${IWHITE}>>>>${IGREEN}>>>>${NO_COLOR}"; 
export PS1="${IBLUE}(\A)${IGREEN}\u@\h:${LIGHT_CYAN}\w\n${CASCADIA}"

source $HOME/.lyticsenv

# The next line updates PATH for the Google Cloud SDK.
source '/home/ropes/gcloud/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/ropes/gcloud/google-cloud-sdk/completion.bash.inc'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
