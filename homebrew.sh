#!/bin/sh

brew cask install docker zulu
brew upgrade
brew install \
    dep \
    docker \
    elixir \
    fd \
    fish \
    git \
    go \
    httpie \
    hugo \
    jq \
    mosh \
    neovim \
    node \
    packer \
    python \
    python3 \
    rbenv \
    ripgrep \
    rust \
    task \
    tasksh \
    terraform \
    yarn
