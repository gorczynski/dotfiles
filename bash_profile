# Get the aliases and functions.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Get the Bash prompts.
if [ -f ~/.bash_prompts ]; then
	. ~/.bash_prompts
fi

# Tab completion for branch names.
source ~/.git-completion.bash

# Ctrl+P and Ctrl+N for bash history.
"\C-p": history-search-backward
"\C-n": history-search-forward

# User specific environment and startup programs.
PATH=$PATH:$HOME/bin:/usr/local/sbin
export PATH
