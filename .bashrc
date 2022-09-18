# Debian defaults (provided .bashrc)
# Some of these settings have been tweaked but left unmodified as much as
# possible.
# ----------------------------------

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
HISTSIZE=
HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

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

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

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

# -----------------------
# Start of customizations
# -----------------------

# Functions
function create_dir() {
  _dir="$1"
  if [[ ! -z "$_dir" && ! -f "$_dir" ]]; then
    mkdir -p "$_dir"
  fi
}

# Environment variables
export EDITOR=vi
export VISUAL=vi
export REPOS="$HOME/repos"
export GHREPOS="$HOME/repos/github.com"
export GLREPOS="$HOME/repos/gitlab.com"
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"

# PATH
declare -a _prepend_paths
_prepend_paths=("$GOPATH" \
	"$GOBIN" \
	"/usr/local/go/bin")

for p in "${_prepend_paths[@]}"; do
  PATH="$p:$PATH"
done
export PATH

# Home dirs
create_dir "$GOPATH"
create_dir "$GOBIN"
create_dir "$GHREPOS"
create_dir "$GLREPOS"
create_dir "$HOME/.config/git"

if [ -d "$GHREPOS/note-cmd" ]; then
  . "$GHREPOS/note-cmd/new-note.sh"
fi

