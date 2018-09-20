# User specific environment and startup programs.
PATH=$PATH:$HOME/bin:/usr/local/sbin:/usr/local/opt/sbt@0.13/bin
export PATH

# Language.
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Improve the Terminal appearance.
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Prevent from accidentally installing packages globally.
export PIP_REQUIRE_VIRTUALENV=true

# GitHub Homebrew API token.
source ~/.ssh/homebrew-github-api-token

# Tab completion for branch names.
source ~/.git-completion.bash

# Aliases.
source ~/.aliases

# The Fuck.
eval "$(thefuck --alias)"

# Python as framework.
# Taken from <https://matplotlib.org/faq/osx_framework.html>.
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python3 "$@"
    else
        /usr/local/bin/python3 "$@"
    fi
}

# Support for z command.
. /usr/local/etc/profile.d/z.sh

# Get the Bash prompts.
if [ -f ~/.bash_prompts ]; then
	. ~/.bash_prompts
fi