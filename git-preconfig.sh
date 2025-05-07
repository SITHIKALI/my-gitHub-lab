#!/bin/bash

# Create .gitconfig if missing
if [ ! -f ~/.gitconfig ]; then
  touch ~/.gitconfig
fi

# Set your Git identity (change if needed)
git config --global user.name "SITHIKALI"
git config --global user.email "sithikali2000@.com"

# Unset init.defaultBranch if set
if git config --global --get init.defaultBranch > /dev/null; then
  git config --global --unset init.defaultBranch
fi

# Unset rerere if set
if git config --global --get rerere.enabled > /dev/null; then
  git config --global --unset rerere.enabled
fi

# Show current Git config
echo "✅ Git global config applied:"
git config --list --global
