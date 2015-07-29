#!/bin/bash

set -e

function ensure_link {
    if [ -f "$HOME/$2" ]; then
      rm -r "$HOME/$2"
    fi
    ln -s "$HOME/$1" "$HOME/$2"
}

function ensure_dir {
    test -d "$HOME/$1" || mkdir -p "$HOME/$1"
}

ensure_dir ".config"
ensure_dir ".local/bin"

ensure_link "src/dotfiles/ackrc" ".ackrc"
ensure_link "src/dotfiles/emacs.d" ".emacs.d"
ensure_link "src/dotfiles/fish" ".config/fish"
ensure_link "src/dotfiles/gitconfig" ".gitconfig"
ensure_link "src/dotfiles/gitignore" ".gitignore"
ensure_link "src/dotfiles/hgignore" ".hgignore"
ensure_link "src/dotfiles/hgrc" ".hgrc"
ensure_link "src/dotfiles/mtrtws" ".local/bin/mtrtws"
ensure_link "src/dotfiles/pharo" ".local/bin/pharo"
ensure_link "src/dotfiles/tmux.conf" ".tmux.conf"
ensure_link "src/dotfiles/vim" ".vim"
ensure_link "src/dotfiles/vimrc" ".vimrc"
ensure_link "src/dotfiles/factor-boot-rc" ".factor-boot-rc"
ensure_link "src/dotfiles/idea.vmoptions" "Library/Preferences/IntelliJIdea14/idea.vmoptions"

ensure_dir ".emacs-backups"
ensure_dir ".pip/wheels"
ensure_dir ".vim/backupdir"
ensure_dir ".vim/undodir"
ensure_dir ".virtualenvs"
