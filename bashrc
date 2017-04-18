# Language.
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Aliases.
alias ls='ls -GFh'
alias lr='ls -hartl'
alias ql="qlmanage -p" # Quick Look preview the file.

# The Fuck.
eval "$(thefuck --alias)"

# zsh completions.
 fpath=(/usr/local/share/zsh-completions $fpath)

