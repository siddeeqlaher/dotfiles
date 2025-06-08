#!/usr/bin/env bash

# Variables
DOTFILES_REPO="https://github.com/siddeeqlaher/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

# Function to run git commands inside the bare repo
dotfiles() {
  /usr/bin/git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" "$@"
}

# Clone the bare repo if it doesn't exist
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles repo..."
  git clone --bare "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

# Try to checkout
echo "Checking out dotfiles to home directory..."

if ! dotfiles checkout; then
  echo "Backing up pre-existing dotfiles..."
  mkdir -p "$HOME/.dotfiles-backup"
  dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | while read -r file; do
    mkdir -p "$(dirname "$HOME/.dotfiles-backup/$file")"
    mv "$HOME/$file" "$HOME/.dotfiles-backup/$file"
  done
  echo "Retrying checkout..."
  dotfiles checkout
fi

# Set git config to hide untracked files
dotfiles config --local status.showUntrackedFiles no

echo "Dotfiles setup complete! Restart your shell to apply changes."
