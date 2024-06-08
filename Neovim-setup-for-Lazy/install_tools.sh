#!/bin/bash

# Function to check version of Neovim
check_neovim_version() {
	if command -v nvim &>/dev/null; then
		version=$(nvim --version | head -n 1 | awk '{print $2}')
		if [ "$(printf '%s\n' "0.9.0" "$version" | sort -V | head -n1)" = "0.9.0" ]; then
			echo "Neovim version $version is already installed."
			return 0
		else
			echo "Neovim version is less than 0.9.0."
			return 1
		fi
	else
		echo "Neovim is not installed."
		return 1
	fi
}

# Check and install Neovim
if ! check_neovim_version; then
	echo "Installing Neovim..."
	if [ "$(uname)" == "Darwin" ]; then
		# macOS
		brew install neovim
	elif [ -n "$(command -v apt-get)" ]; then
		# Debian-based
		sudo apt-get update
		sudo apt-get install -y neovim
	elif [ -n "$(command -v yum)" ]; then
		# RHEL-based
		sudo yum install -y epel-release
		sudo yum install -y neovim
	else
		echo "Unsupported OS."
		exit 1
	fi
fi

# Check and install Git
if ! command -v git &>/dev/null; then
	echo "Installing Git..."
	if [ "$(uname)" == "Darwin" ]; then
		brew install git
	elif [ -n "$(command -v apt-get)" ]; then
		sudo apt-get install -y git
	elif [ -n "$(command -v yum)" ]; then
		sudo yum install -y git
	else
		echo "Unsupported OS."
		exit 1
	fi
else
	echo "Git is already installed."
fi

# Check and install GCC
if ! command -v gcc &>/dev/null; then
	echo "Installing GCC..."
	if [ "$(uname)" == "Darwin" ]; then
		brew install gcc
	elif [ -n "$(command -v apt-get)" ]; then
		sudo apt-get install -y gcc
	elif [ -n "$(command -v yum)" ]; then
		sudo yum install -y gcc
	else
		echo "Unsupported OS."
		exit 1
	fi
else
	echo "GCC is already installed."
fi

# Check and install Nerd Font (JetBrains Mono)
FONT_DIR="$HOME/.local/share/fonts"
FONT_NAME="JetBrainsMono"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"

if [ ! -d "$FONT_DIR" ]; then
	mkdir -p "$FONT_DIR"
fi

if ! fc-list | grep -q "$FONT_NAME"; then
	echo "Installing Nerd Font (JetBrains Mono)..."
	TEMP_DIR=$(mktemp -d)
	wget -O "$TEMP_DIR/JetBrainsMono.zip" "$FONT_URL"
	unzip "$TEMP_DIR/JetBrainsMono.zip" -d "$FONT_DIR"
	fc-cache -fv
	rm -rf "$TEMP_DIR"
else
	echo "Nerd Font (JetBrains Mono) is already installed."
fi

echo "All necessary tools are installed."
