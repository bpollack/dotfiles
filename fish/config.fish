function fish_greeting
    if status --is-interactive
        ~/src/fortune/fortune -o
    end
end

set -x PATH ~/.local/bin /usr/local/bin $PATH

# Python magic
set -x PIP_USE_WHEEL false
set -x PIP_DOWNLOAD_CACHE "$HOME/.pip/cache"

source ~/src/dotfiles/virtualfish/virtual.fish
source ~/src/dotfiles/virtualfish/auto_activation.fish
