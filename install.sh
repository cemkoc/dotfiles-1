#!/bin/bash

#
# Clones repo and repo submodules, then runs the bootstrapper script
#

echo 'And awaaaaay we go!'

dir="$HOME/Developer"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/bsuper/dotfiles.git dotfiles && cd $_

#echo 'Tweaking OS X. Please provide password ...'
#  sh osx.sh

echo 'Symlinking dotfiles ...'
  sh symlink-dotfiles.sh

echo 'Running bootstrapper ...'
  sh bootstrap.sh
