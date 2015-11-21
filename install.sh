#!/bin/bash

#
# Clones repo and repo submodules, then runs the bootstrapper script
#

echo 'And awaaaaay we go!'

dir="$HOME/Developer"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/jhabdas/dotfiles.git dotfiles && cd $_
sh bootstrap.sh
