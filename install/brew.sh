#!/usr/bin/env bash

echo "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'Configure Homebrew installed app directory'
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo 'Add homebrew taps'
brew tap caskroom/cask
brew tap homebrew/services
brew tap caskroom/fonts
brew tap mas-cli/tap
brew tap-pin mas-cli/tap

echo 'Install homebrew packages'
brew install $(cat brew.txt)
