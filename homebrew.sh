#!/bin/sh

brew cask install docker gitup zulu
brew upgrade
brew install \
    fd \
    fish \
    git \
    httpie \
    jq \
    minio \
    minio-mc \
    mosh \
    neovim \
    ripgrep \
    tmux \
    yarn
