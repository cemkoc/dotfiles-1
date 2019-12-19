# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for DOTFILE in $DOTFILES_DIR/system/.{path,aliases,functions}; do
	[ -r "$DOTFILE" ] && [ -f "$DOTFILE" ] && source "$DOTFILE";
done;
unset DOTFILE;
unset DOTFILES_DIR;
