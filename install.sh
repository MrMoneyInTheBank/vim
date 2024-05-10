#!/bin/bash

# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
    brew install neovim ripgrep fd lazygit
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux (Debian)
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install neovim ripgrep fd-find lazygit
    # Linux (RHEL)
    elif command -v yum &> /dev/null; then
        sudo yum install epel-release
        sudo yum install neovim ripgrep fd-find lazygit
    else
        echo "Unsupported package manager. Please install the required packages manually."
        exit 1
    fi
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows (using WSL2)
    echo "Unsupported operating system. Please install the required packages manually."
    exit 1
else
    echo "Unsupported operating system. Please install the required packages manually."
    exit 1
fi

