# Get the aliases and functions.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Get the Bash prompts.
if [ -f ~/.bash_prompts ]; then
	. ~/.bash_prompts
fi

# GitHub Homebrew API token.
source ~/.ssh/homebrew-github-api-token

# Tab completion for branch names.
source ~/.git-completion.bash

# User specific environment and startup programs.
PATH=$PATH:$HOME/bin:/usr/local/sbin
export PATH

# Improve the Terminal appearance.
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
