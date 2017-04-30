#!/bin/bash

# Directories.
dotfiles_directory=~/dotfiles # My dotfiles directory.
dotfiles_backup=~/.dotfiles_backup  # Backup directory for current dotfiles.

# Files and directories to symlink in home directory.
items="bash_profile bash_prompts bashrc git-completion.bash vim vimrc"

# Create backup directory for current dotfiles
# only if the directory doesn't exist.
if [ ! -d $dotfiles_backup ]; then
  echo -n "Create backup directory for current dotfiles... "
  mkdir -p $dotfiles_backup
  echo "Directory $dotfiles_backup was created."
fi

# Check the machine hardware name.
cmd=`uname -m`

# Process the items.
for item in $items; do
  # Execute the procedure only if item exists in home directory.
  if [ -f ~/.$item ]; then
    # On Raspberry Pi we want to copy, not move, the .bashrc file
    # to the backup directory, and then add contents of my .bashrc
    # file to existing .bashrc file.
    if [[ "$item" == 'bashrc' && "$cmd" == 'armv7l' ]]; then
      cp ~/.$item $dotfiles_backup/$item
      echo "" >> ~/.$item
      cat $item >> ~/.$item
      echo "Contents of $item file was added to ~/.$item file."
    else
      # Make backup of current dotfile.
      mv ~/.$item $dotfiles_backup/$item
      echo "File $item was moved to $dotfiles_backup directory."
      # Create the symlink from home to dotfiles directory.
      ln -s $dotfiles_directory/$item ~/.$item
      echo "Created the symlink for .$item."
    fi
  else
    # Create the symlink from home to dotfiles directory.
    ln -s $dotfiles_directory/$item ~/.$item
  fi
done

# The end.
echo "Backup done, symlinks created. All done."
