#!/bin/bash

echo 'And awaaaaay we go!'

dir="$HOME/Developer"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/jhabdas/dotfiles.git dotfiles && cd $_
sudo bash bootstrap.sh
