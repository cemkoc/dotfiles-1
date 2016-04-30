git clone --recursive https://github.com/bsuper/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Set ZSH as main shell..."
chsh -s /bin/zsh

git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

cd ~/Downloads/dotfiles
mv ~/Downloads/dotfiles/prompt_agnoster_setup ~/.zprezto/modules/prompts/functions

cd ~/Downloads
mkdir -p ~/.sources/
curl https://cloud.github.com/downloads/digitalformula/zsh.prompts/get-short-path.zsh.zip > ~/Downloads/get-short-path.zsh.zip
unzip ~/Downloads/get-short-path.zsh.zip
mv ~/Downloads/get-short-path.zsh ~/.sources/
curl https://cloud.github.com/downloads/digitalformula/zsh.prompts/git-omz.zsh.zip > ~/Downloads/git-omz.zsh.zip
unzip ~/Downloads/git-omz.zsh.zip
mv ~/Downloads/git-omz.zsh ~/.sources/
cd
