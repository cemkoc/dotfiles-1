#!/usr/bin/env zsh

#
# A script for setting up an OS X dev environment.
# Adapted from Paul Miller.
# Additionally combines concepts from Mathias, Lars Kappert and others.
#
# More about these dotfiles:
# https://github.com/bsuper/dotfiles/blob/master/README.md
#
# Learn more about dotfiles:
# - https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.6b6pzmaxn
# - https://dotfiles.github.io/
#

# ==================================================================
# = Functions =
# ==================================================================

# https://github.com/monfresh/laptop/blob/master/mac
brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_is_installed() {
  brew list -1 | grep -Fqx "$1"
}

brew_is_upgradable() {
  ! brew outdated --quiet "$1" >/dev/null
}

brew_tap_is_installed() {
  brew tap | grep -Fqx "$1"
}

brew_tap() {
  if ! brew_tap_is_installed "$1"; then
    echo "Tapping $1..."
    brew tap "$1" 2> /dev/null
  fi
}

brew_cask_expand_alias() {
  brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_cask_is_installed() {
  local NAME
  NAME=$(brew_cask_expand_alias "$1")
  brew cask list -1 | grep -Fqx "$NAME"
}

app_is_installed() {
  local app_name
  app_name=$(echo "$1" | cut -d'-' -f1)
  find /Applications -iname "$app_name*" -maxdepth 1 | egrep '.*' > /dev/null
}

brew_cask_install() {
  if app_is_installed "$1" || brew_cask_is_installed "$1"; then
    echo "$1 is already installed. Skipping..."
  else
    echo "Installing $1..."
    brew cask install "$@"
  fi
}

# ==================================================================
# = Configuration =
# ==================================================================

# dev="$HOME/Developer"
# pushd .
# mkdir -p $dev
# cd $dev

# Add SSH key to GitHub during installation
pub=$HOME/.ssh/id_rsa.pub
echo 'Checking for SSH key, generating one if it does not exist ...'
  [[ -f $pub ]] || ssh-keygen -t rsa

echo 'Copying public key to clipboard. Paste it into your Github account ...'
  [[ -f $pub ]] && cat $pub | pbcopy
  open 'https://github.com/account/ssh'

# If we're on OS X, install Homebrew and tweak the system a bit
if [[ `uname` == 'Darwin' ]]; then

  # Install Homebrew
  if ! command -v brew >/dev/null; then
    echo "Installing Homebrew ..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "Homebrew already installed. Skipping ..."
  fi

  # Update Homebrew formulas
  echo "Updating Homebrew formulas ..."
    brew update

  # Install formulas
  brew_install_or_upgrade cmake
  brew_install_or_upgrade ctags
  brew_install_or_upgrade git
  brew_install_or_upgrade htop
  brew_install_or_upgrade python
  brew install_or_upgrade the_silver_searcher
  brew_install_or_upgrade tmux
  brew_install_or_upgrade trash
  brew_install_or_upgrade vim

  # Install Homebrew Cask
  brew_tap 'caskroom/cask'
  brew_install_or_upgrade 'brew-cask'
  brew_tap 'caskroom/versions'

  # Install additional apps
  echo 'Installing OS X apps ...'

    brew_cask_install atom
    brew_cask_install controlplane
    brew_cask_install flux
    brew_cask_install google-chrome
    brew_cask_install jadengeller-helium
    brew_cask_install iterm2
    brew_cask_install numi
    brew_cask_install polymail
    brew_cask_install spotify
    brew cask install sublime-text3
    brew_cask_install wget
fi

# Virtualenv
pip install --upgrade pip
pip install virtualenv

# Iterm2 solarized dark
curl https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors > ~/Downloads/SolarizedDark.itermcolors

# ublock origin
open https://www.ublock.org/newdl/safari/0.9.5.2

# Set hostname
sudo scutil –-set HostName endeavor

echo 'Completed bootstrap.sh'
  popd
