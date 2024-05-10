#!/bin/bash

# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  # Check if iTerm2 is the current terminal
  if [ "$TERM_PROGRAM" != "Alacritty" ]; then
    if ! command -v iterm2 &> /dev/null; then
      echo "Alacritty is not installed. Installing Alacritty..."
      brew install --cask alacritty
    fi
    open -a Alacritty
  fi

  # Check if the default font is not a Nerd Font
  if ! grep -q 'Nerd Font' ~/.config/alacritty/alacritty.yml; then
    # Install the Nerd Font you want to use
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code-nerd-font

    # Set up Alacritty configuration file
    mkdir -p ~/.config/alacritty
    cat > ~/.config/alacritty/alacritty.yml <<EOL
font:
  normal:
    family: FiraCode Nerd Font
    style: Regular
  bold:
    family: FiraCode Nerd Font
    style: Bold
EOL

    # Restart Alacritty
    osascript -e 'quit app "Alacritty"'
    open -a Alacritty
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
