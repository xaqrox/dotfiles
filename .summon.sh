#!/bin/bash
set -e

# Xcode CLT
if ! xcode-select -p &>/dev/null; then
  echo "Install Xcode Command Line Tools first: xcode-select --install"
  echo "Then rerun this script."
  exit 1
fi

# Homebrew
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# yadm
command -v yadm &>/dev/null || brew install yadm

# Clone dotfiles (HTTPS so 1Password SSH isn't needed yet)
yadm clone https://github.com/xaqrox/dotfiles.git
