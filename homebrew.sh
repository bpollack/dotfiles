#!/bin/sh

brew cask install \
    corretto \
    docker \
    gitup \
    visual-studio-code

brew install \
    fd \
    fish \
    git \
    httpie \
    hub \
    jq \
    kakoune \
    minio-mc \
    neovim \
    ripgrep \
    sqlite \
    tmux \
    yarn --without-node
