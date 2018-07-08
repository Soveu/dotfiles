#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias r="ranger"
alias shutdown="pkill -9 xinit & poweroff"
alias reboot="pkill -9 xinit & reboot"

COL="--color=auto"
COLFUNCS="ls pacman grep"

for f in $COLFUNCS
do
	alias $f="$f $COL"
done


export BROWSER=midori
export EDITOR=vim
export PS1="\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;36m\] \w \[\033[00m\]$ "
