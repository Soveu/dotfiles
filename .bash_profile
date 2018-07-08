# ~/.bash_profile
#

export PS1="\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;36m\] \w \[\033[00m\]$ "
export GOPATH=~/go
export SCRIPT_DIR=~/scripts
export PATH="${PATH}:${GOPATH}:${SCRIPT_DIR}"

#[[ -f ~/.bashrc ]] && . ~/.bashrc
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#	exec startx
#fi

[[ ! $DISPLAY && $XDG_VTNR -eq 1 && $(id --group) -ne 0 && ! $BOOTED ]] && exec startx
export BOOTED=true
