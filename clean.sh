#!/usr/bin/env zsh

STOW_FOLDERS="gitconfig,tmux,nvim,zsh,ghostty"

DOT_FILES=$HOME/.dotfiles

pushd $DOT_FILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Removing $folder"
    stow -D $folder
done
popd
