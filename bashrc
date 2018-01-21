# Language.
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Aliases.
alias ls='ls -GFh'
alias lr='ls -hartl'
alias ql="qlmanage -p" # Quick Look preview the file.

# The Fuck.
eval "$(thefuck --alias)"

# Python as framework.
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python3 "$@"
    else
        /usr/local/bin/python3 "$@"
    fi
}
