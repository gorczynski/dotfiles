#!/bin/bash

# Directories
dotfiles_directory=~/dotfiles # My dotfiles directory.
dotfiles_backup=~/.dotfiles_backup  # Backup directory for current dotfiles.

# Files and folders to symlink in home directory.
items="bash_profile bash_prompts bashrc git-completion.bash vim vimrc"

# Create backup directory for current dotfiles.
echo "Create backup directory for current dotfiles."
mkdir -p $dotfiles_backup
echo "Directory created."

# Make backup of current dotfiles.
echo "Make backup of current dotfiles."
for item in $items; do
  # If item exists...
  if [ -f item ]; then
  	mv ~/$item $dotfiles_backup
  fi
done
echo "Backup done."

# Create symlinks from home to dotfiles directory.
echo "Create symlinks from home to dotfiles directory."
for item in $items; do
  ln -s $dotfiles_directory/$item ~/$item
done
echo "Symlinks created."
echo "Done."
