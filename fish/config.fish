function fish_greeting
    if begin status --is-interactive; and test -f ~/.local/bin/fortune; end
        ~/.local/bin/fortune -o
    end
end

set -x PATH ~/.local/bin /usr/local/bin $PATH

# Go root
if test -d ~/src/gop
    set -x GOPATH ~/src/gop
    set -x PATH ~/src/gop/bin $PATH
end

# For Bakpax!
if test -d ~/src/laniakea/bin
    set -x PATH $PATH ~/src/laniakea/bin
end

# Miscellaneous magic
test -f ~/.asdf/asdf.fish; and source ~/.asdf/asdf.fish

# The next line updates PATH for the Google Cloud SDK.
if test -f '~/.local/google-cloud-sdk/path.fish.inc'
    if type source > /dev/null
        source '~/.local/google-cloud-sdk/path.fish.inc'
    else
        . '~/.local/google-cloud-sdk/path.fish.inc'
    end
end

# Add yarn global path
set -x PATH (yarn global bin) $PATH

# General
set -x SHELL (which fish)
set -x EDITOR nvim
