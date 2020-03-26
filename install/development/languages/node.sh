#!/usr/bin/env bash

echo 'Install NVM'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

echo 'Install 2 latest versions of NodeJS'
nvm install lts/carbon # v8.14.0
nvm install lts/dubnium # v10.14.1

echo 'Install latest npm version'
nvm install-latest-npm

echo 'Check if no upgrade'
nvm upgrade

echo 'Set default NodeJS version'
nvm alias default lts/carbon
