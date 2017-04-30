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

# Process the items.
for item in $items; do
  # Execute the procedure only if item exists in home directory.
  if [ -f ~/.$item ]; then
    # On Raspberry Pi we want to copy, not move the .bashrc file
    # to the backup directory, and then add contents of my .bashrc
    # file to existing .bashrc file.
    if [[ "$item" == 'bashrc' && "$cmd" == 'armv7l' ]]; then
      cp ~/.$item $dotfiles_backup/$item
      echo "" >> ~/.bashrc
      cat $item >> ~/.bashrc
      echo "Contents of $item file was added to ~/.bashrc file."
    else
      # Make backup of current dotfile.
      mv ~/.$item $dotfiles_backup/$item
      echo "File $item was moved to $dotfiles_backup directory."
      # Create the symlink from home to dotfiles directory.
      ln -s $dotfiles_directory/$item ~/.$item
    fi
  else
    # Create the symlink from home to dotfiles directory.
    ln -s $dotfiles_directory/$item ~/.$item
  fi
done

# The end.
echo "Backup done, symlinks created. All done."
