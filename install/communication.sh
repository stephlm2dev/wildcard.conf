#!/usr/bin/env bash

echo 'Install Teamviewer'
brew cask install teamviewer

echo 'Install Zoom.us'
brew cask install zoomus

echo 'Install Airdroid'
brew cask install airdroid

echo 'Install Slack'
brew cask install slack

echo 'Install Skype'
brew cask install skype

echo 'Install TweetDeck'
# ➜  install git:(master) ✗ mas search tweetdeck-by-twitter
#    485812721  TweetDeck by Twitter (3.9.889)
mas install 485812721
