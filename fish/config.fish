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

# If we're on a Mac, we probably have zulu; add it
set zulu_path ~/.local/zulu/bin
if test -d $zulu_path
    set -x PATH $zulu_path $PATH
    set -x JAVA_HOME $zulu_path
end

# On Macs, we have Go installed custom; add it to path if present
if test -d /usr/local/go
    set -x PATH /usr/local/go/bin $PATH
end

# Go root
if test -d ~/src/goroot
    set -x GOPATH ~/src/goroot
    set -x PATH ~/src/goroot/bin $PATH
end

# For Khan Academy!
if test -d ~/khan
    # Add frankenserver bins to PATH
    set KDR ~/khan/devtools
    set -x PATH ~/khan/webapp/third_party/frankenserver $KDR/arcanist/khan-bin $KDR/git-bigfile/bin $KDR/git-workflow/bin $KDR/ka-clone/bin $KDR/khan-linter/bin $PATH
end

# Python magic
eval (python -m virtualfish)
eval (python -m virtualfish auto_activation)
set -x SHELL /usr/local/bin/fish
set -x EDITOR kak

if [ (uname -a | grep Microsoft) ]
    fundle plugin 'tuvistavie/fish-ssh-agent'
    fundle init
    ssh-add
end
