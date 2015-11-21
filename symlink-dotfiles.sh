#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

dev="$HOME/Developer"
dotfiles="$dev/dotfiles"

if [[ -d "$dotfiles" ]]; then
  fancy_echo "Symlinking dotfiles from $dotfiles"
else
  fancy_echo "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  fancy_echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link "$dotfiles/$location" "$HOME/$file"
done

if [[ `uname` == 'Darwin' ]]; then
  link "$dotfiles/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
fi
