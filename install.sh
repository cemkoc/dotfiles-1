echo 'And awaaaaay we go!'

cd ..
mv dotfiles ~/Downloads
cd ~/Downloads/dotfiles

echo 'VIM install...'
  mv vimrc ~/.vimrc

echo "Running ZSH installation..."
  zsh zsh_install.sh

echo 'Running bootstrapper ...'
  sh bootstrap.sh
