# ~/.zprofile

export PS1="\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;36m\] \w \[\033[00m\]$ "
export GOPATH=~/go
export SCRIPT_DIR=~/scripts
export PATH="${PATH}:${GOPATH}:${SCRIPT_DIR}"

[[ ! $DISPLAY && $XDG_VTNR -eq 1 && $(id --group) -ne 0 ]] && exec startx
