#!/usr/bin/env zsh

#
# A script for setting up an OS X dev environment.
# Adapted from Paul Miller.
# Additionally combines concepts from Mathias, Lars Kappert and others.
#
# More about these dotfiles:
# https://github.com/jhabdas/dotfiles/blob/master/README.md
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

dev="$HOME/Developer"
pushd .
mkdir -p $dev
cd $dev

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
  brew_install_or_upgrade docker-machine
  brew_install_or_upgrade docker
  brew_install_or_upgrade git
  brew_install_or_upgrade htop
  brew_install_or_upgrade hub
  brew_install_or_upgrade irssi
  brew_install_or_upgrade nvm
  brew_install_or_upgrade tmux
  brew_install_or_upgrade trash

  # Install Homebrew Cask
  brew_tap 'caskroom/cask'
  brew_install_or_upgrade 'brew-cask'
  brew_tap 'caskroom/versions'

  # Install Quick Look Plugins
  echo 'Installing Quick Look Plugins ...'
    brew_cask_install suspicious-package
    brew_cask_install quicklook-json
    brew_cask_install qlmarkdown
    brew_cask_install qlstephen
    brew_cask_install qlcolorcode

  # Install additional apps
  echo 'Installing OS X apps ...'
    brew_cask_install caffeine
    brew_cask_install dropbox
    brew_cask_install google-chrome-canary
    brew_cask_install flow
    brew_cask_install flux
    brew_cask_install screenhero
    brew_cask_install spectacle
    brew_cask_install spotify
    brew_cask_install sublime-text3
    brew_cask_install wget
fi

echo 'Applying Sublime Text theme and preferences ...'
  st=$(pwd)/sublime/packages
  as="$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/"
  asprefs="$as/User/Preferences.sublime-settings"
  if [[ -d "$as" ]]; then
    for theme in $st/Theme*; do
      cp -r $theme $as
    done
    rm $asprefs
    cp -r $st/pm-themes $as
  else
    echo "Install Sublime Text http://www.sublimetext.com"
  fi

echo 'Would you like to view developer API documentation?'
echo '(y = open http://devdocs.io, N = don’t open)'
echo '[y/N]'
read give_links
[[ "$give_links" == 'y' ]] && open_apps

echo 'Dotfile installation completed. Restart your terminal for the changes to take effect.'
  popd
