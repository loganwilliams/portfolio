#!/bin/bash

# commit current repo
git add .
git commit -m "$1"

# build hugo
hugo

# get last commit 
lasthash=$(git show -s --format=%h)

cp -R public/* ~/Documents/loganwilliams.github.io/

cd ~/Documents/loganwilliams.github.io/

commitmessage="match $lasthash: $1"
git add .
git commit -m "$commitmessage"
git push origin master