fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

fancy_echo 'And awaaaaay we go!'

dir="$HOME/Developer"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/jhabdas/dotfiles.git dotfiles && cd $_
sudo bash symlink-dotfiles.sh
