#!/usr/bin/env bash

# Audacity not available as 64 bit
# MyHeadset Updater does not exist

echo 'Install VLC'
brew cask install vlc

echo 'Install Shazam'
# ➜  install git:(master) ✗ mas search shazam
#    897118787  Shazam (2.1)
mas install 897118787

echo 'Install VOX'
brew cask install vox
