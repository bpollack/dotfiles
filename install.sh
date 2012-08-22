#!/bin/bash

set -e

function ensure_link {
    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

ensure_link "src/dotfiles/gitconfig" ".gitconfig"
ensure_link "src/dotfiles/hgignore" ".hgignore"
ensure_link "src/dotfiles/hgrc" ".hgrc"
ensure_link "src/dotfiles/tmux.conf" ".tmux.conf"
ensure_link "src/dotfiles/vim" ".vim"
ensure_link "src/dotfiles/vimrc" ".vimrc"
