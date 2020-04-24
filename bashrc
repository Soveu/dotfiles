# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ':q'=exit
alias tmuxx='tmux new-session -s main; tmux new-session -t main'
export PS1="\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;36m\] \w \[\033[00m\]$ "

