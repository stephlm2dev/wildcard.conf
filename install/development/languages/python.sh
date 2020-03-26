#!/usr/bin/env bash

echo 'Install PyEnv'
brew install pyenv

echo 'Configure PyEnv'
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

echo 'Install new versions'
pyenv install --list

while read -r -p "Version to install (q to exit): " && [[ $REPLY != q ]]; do
  pyenv global $REPLY
  pyenv rehash
  pyenv versions
done
