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

set -gx PATH ~/.local/bin /usr/local/bin $PATH

# Go root
if test -d ~/src/goroot
    set -gx GOPATH ~/src/goroot
    set -gx PATH ~/src/goroot/bin $PATH
end

# For Spreedly!
if test -d ~/dev
    set -gx PATH /usr/local/opt/gnupg@1.4/libexec/gpgbin $PATH
end

# Python magic
eval (python2 -m virtualfish)
eval (python2 -m virtualfish auto_activation)

# Ruby magic
status --is-interactive; and source (rbenv init -|psub)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benjamin/.local/google-cloud-sdk/path.fish.inc' ]
    if type source > /dev/null
        source '/Users/benjamin/.local/google-cloud-sdk/path.fish.inc'
    else
        . '/Users/benjamin/.local/google-cloud-sdk/path.fish.inc'
    end
end

# General
set -gx SHELL /usr/local/bin/fish
set -gx EDITOR nvim

if [ (uname -a | grep Microsoft) ]
    fundle plugin 'tuvistavie/fish-ssh-agent'
    fundle init
    ssh-add
else
    fundle plugin 'edc/bass'
    fundle init
end
