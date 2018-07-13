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

# For Spreedly!
if test -d ~/dev
    set -x PATH /usr/local/opt/gnupg@1.4/libexec/gpgbin $PATH
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

# General
set -x SHELL (which fish)
