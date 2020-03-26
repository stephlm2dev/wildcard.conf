#!/usr/bin/env bash

echo 'Install OSX Fuse'
brew cask install osxfuse

echo 'Install apps from App Store'
# ➜  install git:(master) ✗ mas search Monit
#    1014850245  MONIT (1.2.2)
mas install 1014850245

# ➜  install git:(master) ✗ mas search bitdefender-virus-scanner
#    500154009  Bitdefender Virus Scanner (3.12)
mas install 500154009
