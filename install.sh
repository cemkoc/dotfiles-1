#!/usr/bin/env bash

####################################################################
# This script installs the dotfiles and runs all other system config scripts
# @author Cem Koc
####################################################################

echo 'And awaaaaay we go!'

# cd ..
# mv dotfiles ~/Downloads
# cd ~/Downloads/dotfiles

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.aliases" ~
ln -sfv "$DOTFILES_DIR/.functions" ~
ln -sfv "$DOTFILES_DIR/.path" ~
# [unused] ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
# [unused] ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~
# [unused] ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
# [unused] ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

source ~/.bash_profile

echo 'VIM install...'
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mv vimrc ~/.vimrc

echo "Running ZSH installation..."
  zsh zsh_install.sh

echo 'Running bootstrapper ...'
  sh bootstrap.sh

echo "You're all clear to start working!"
