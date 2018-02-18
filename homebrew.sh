#!/bin/sh

brew cask install docker gitup zulu
brew upgrade
brew install \
    dep \
    fd \
    fish \
    git \
    go \
    httpie \
    hugo \
    jq \
    minio \
    minio-mc \
    mosh \
    neovim \
    python \
    python3 \
    ripgrep \
    tmux \
    yarn
