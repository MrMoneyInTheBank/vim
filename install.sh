#!/bin/bash

# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  # Check if iTerm2 is the current terminal
  if [ "$TERM_PROGRAM" != "iTerm.app" ]; then
    if ! command -v iterm2 &> /dev/null; then
      echo "iTerm2 is not installed. Installing iTerm2..."
      brew install --cask iterm2
    fi
    open -a iTerm
  fi
  if ! command -v nvim &> /dev/null; then
    echo "Neovim is not installed. Installing Neovim..."
    brew install neovim
  fi
  brew install ripgrep fd lazygit
else
    echo "My bad g, i didnt really configure this for linux or windows"
    exit 1
fi
