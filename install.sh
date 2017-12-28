#!/bin/bash

set -e

function ensure_link {
    if [ -f "$HOME/$2" ]; then
      rm -r "$HOME/$2"
    fi
    if [ ! -L "$HOME/$2" ]; then
      ln -s "$HOME/$1" "$HOME/$2"
    fi
}

function ensure_dir {
    test -d "$HOME/$1" || mkdir -p "$HOME/$1"
}

function ensure_hg_repo {
    test -d "$1" || hg clone $2 $1
    hg -R $1 pull
    hg -R $1 update
}

function ensure_git_repo {
    test -d "$1" || git clone --recursive $2 $1
}


ensure_dir ".config"
ensure_dir ".config/pip"
ensure_dir ".local/bin"
ensure_dir ".pip"

ensure_link "src/dotfiles/asdfrc" ".asdfrc"
ensure_link "src/dotfiles/factor-boot-rc" ".factor-boot-rc"
ensure_link "src/dotfiles/fish" ".config/fish"
ensure_link "src/dotfiles/gitconfig" ".gitconfig"
ensure_link "src/dotfiles/gitignore" ".gitignore"
ensure_link "src/dotfiles/hgignore" ".hgignore"
ensure_link "src/dotfiles/hgrc" ".hgrc"
ensure_link "src/dotfiles/nvim" ".config/nvim"
ensure_link "src/dotfiles/pip.conf" ".config/pip/pip.conf"
ensure_link "src/dotfiles/pip.conf" ".pip/pip.conf"
ensure_link "src/dotfiles/tmux.conf" ".tmux.conf"
ensure_link "src/factor/factor" ".local/bin/factor"

ensure_dir ".config/nvim/backupdir"
ensure_dir ".config/nvim/undodir"
ensure_dir ".pip/wheels"
ensure_dir ".virtualenvs"

ensure_dir "src/gop/bin"
