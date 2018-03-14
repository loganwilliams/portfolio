#!/bin/bash

# commit current repo
git add .
git commit -m "$1"
git push origin master

# build hugo
hugo

# get last commit hash
lasthash=$(git show -s --format=%h)

# copy build product to website WWW directory
cp -R public/* ~/Documents/loganwilliams.github.io/

cd ~/Documents/loganwilliams.github.io/

# commit and upload the new build products
commitmessage="match $lasthash: $1"
git add .
git commit -m "$commitmessage"
git push origin master
