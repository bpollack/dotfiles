# Fix for WSL's dumb umask issue
if [ (umask) = "0000" ]
    umask 022
end

function fish_greeting
    if status --is-interactive
        if test -f ~/local/bin/fortune
            ~/.local/bin/fortune -o
        end
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

# Python magic
eval (python2 -m virtualfish)
eval (python2 -m virtualfish auto_activation)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benjamin/.local/google-cloud-sdk/path.fish.inc' ]
    if type source > /dev/null
        source '/Users/benjamin/.local/google-cloud-sdk/path.fish.inc'
    else
        . '/Users/benjamin/.local/google-cloud-sdk/path.fish.inc'
    end
end

# Plan 9 root
if test -d ~/src/plan9
    set -x PLAN9 ~/src/plan9
    set -x PATH $PATH ~/src/plan9/bin
end

# General
set -x SHELL /usr/local/bin/fish
set -x EDITOR nvim

fundle plugin 'edc/bass'
if [ ! (uname -a | grep Darwin) ]
    fundle plugin 'tuvistavie/fish-ssh-agent'
end
fundle init

if [ (ssh-add -L | grep -i 'no identities') ]
    ssh-add
end

#
# Miscellaneous magic
test -f ~/.asdf/asdf.fish; and source ~/.asdf/asdf.fish
