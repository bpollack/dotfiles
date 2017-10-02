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

# If we're on a Mac, we probably have zulu; add it
set zulu_path ~/.local/zulu
if test -d $zulu_path
    set -gx PATH $zulu_path/bin $PATH
    set -gx JAVA_HOME $zulu_path
end

# On Macs, we have Go installed custom; add it to path if present
if test -d /usr/local/go
    set -gx PATH /usr/local/go/bin $PATH
end

# Go root
if test -d ~/src/goroot
    set -gx GOPATH ~/src/goroot
    set -gx PATH ~/src/goroot/bin $PATH
end

# Python magic
eval (python2 -m virtualfish)
eval (python2 -m virtualfish auto_activation)

# OPAM configuration
. /Users/benjamin/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

# General
set -gx SHELL /usr/local/bin/fish
set -gx EDITOR nvim

if [ (uname -a | grep Microsoft) ]
    fundle plugin 'tuvistavie/fish-ssh-agent'
    fundle init
    ssh-add
else
    fundle plugin 'fisherman/rbenv'
    fundle plugin 'oh-my-fish/plugin-bundler'
    fundle init
end
