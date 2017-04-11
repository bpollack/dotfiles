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
ensure_dir ".local/bin"

ensure_hg_repo evolve https://bitbucket.org/marmoute/mutable-history
ensure_hg_repo hg-git https://bitbucket.org/durin42/hg-git
ensure_hg_repo hg-prompt https://bitbucket.org/sjl/hg-prompt
ensure_hg_repo mercurial-cli-templates https://bitbucket.org/bpollack/mercurial-cli-templates

ensure_link "src/dotfiles/factor-boot-rc" ".factor-boot-rc"
ensure_link "src/dotfiles/fish" ".config/fish"
ensure_link "src/dotfiles/gitconfig" ".gitconfig"
ensure_link "src/dotfiles/gitignore" ".gitignore"
ensure_link "src/dotfiles/hgignore" ".hgignore"
ensure_link "src/dotfiles/hgrc" ".hgrc"
ensure_link "src/dotfiles/joerc" ".joerc"
ensure_link "src/dotfiles/nvim" ".config/nvim"
ensure_link "src/dotfiles/tmux.conf" ".tmux.conf"
ensure_link "src/factor/factor" ".local/bin/factor"

if [ -d "~/Library" ]; then
    ensure_link "src/dotfiles/idea.vmoptions" "Library/Preferences/IntelliJIdea14/idea.vmoptions"
    ensure_link "src/dotfiles/pycharm.vmoptions" "Library/Preferences/PyCharm40/pycharm.vmoptions"
fi

ensure_dir ".config/nvim/backupdir"
ensure_dir ".config/nvim/undodir"
ensure_dir ".pip/wheels"
ensure_dir ".virtualenvs"
