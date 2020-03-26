#!/usr/bin/env bash

echo 'Install Wunderlist'
# ➜  install git:(master) ✗ mas search wunderlist
#    410628904  Wunderlist: To-Do List & Tasks (3.4.9)
mas install 410628904

echo 'Install Taskwarrior & Timewarrior'
brew install task taskd tasksh timewarrior

echo 'Restore Taskwarrior & Timewarrior configuration'
cp ../configuration/.taskrc ~/.taskrc
cp -r $DATA_DIRECTORY/.timewarrior ~/.timewarrior/
