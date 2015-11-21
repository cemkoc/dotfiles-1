fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

fancy_echo 'And awaaaaay we go!'

dir="$HOME/Developer/dotfiles"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/jhabdas/dotfiles.git
cd dotfiles
sudo bash symlink-dotfiles.sh
