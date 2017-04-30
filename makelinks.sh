#!/bin/bash

# Directories.
dotfiles_directory=~/dotfiles # My dotfiles directory.
dotfiles_backup=~/.dotfiles_backup  # Backup directory for current dotfiles.

# Files and directories to symlink in home directory.
items="bash_profile bash_prompts bashrc git-completion.bash vim vimrc"

# Create backup directory for current dotfiles.
echo -n "Create backup directory for current dotfiles... "
mkdir -p $dotfiles_backup
echo "Directory created."

# Check the machine hardware name.
cmd=`uname -m`

# Make backup of current dotfiles.
echo "Make backup of current dotfiles."
for item in $items; do
  # If item exists...
  if [ -f $item ]; then
    # On Raspberry Pi we want to add contents of
    # my .bashrc file to existing .bashrc file.
    if [[ "$item" == 'bashrc' && "$cmd" == 'armv7l' ]]; then
      echo "" >> ~/.bashrc
      cat $item >> ~/.bashrc
      echo "Contents of $item file was added to ~/.bashrc file."
    else
      # ... the item will be moved to backup directory.
  	  mv ~/.$item $dotfiles_backup/$item
      echo "File $item was moved to $dotfiles_backup directory."
    fi
  fi
done
echo "Backup done."

# Create symlinks from home to dotfiles directory.
echo "Create symlinks from home to dotfiles directory."
for item in $items; do
  ln -s $dotfiles_directory/$item ~/.$item
done
echo "Symlinks created. All done."
