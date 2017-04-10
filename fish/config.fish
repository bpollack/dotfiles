function fish_greeting
    if status --is-interactive
        if test -f ~/local/bin/fortune
            ~/.local/bin/fortune -o
        end
    end
end

set -x PATH ~/.local/bin /usr/local/bin $PATH
if test -d ~/src/goroot
    set -x GOPATH ~/src/goroot
    set -x PATH ~/src/goroot/bin $PATH
end

if test -d ~/src/plan9port
    set -x PLAN9 $HOME/src/plan9port
    set -x PATH $PATH $PLAN9/bin
end

if test -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/
    set -x PATH $PATH /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
    set -x MANPATH $MANPATH /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/help/man /usr/local/share/man /usr/share/man /opt/x11/share/man
end

if test -d ~/khan
    # Add frankenserver bins to PATH
    set KDR ~/khan/devtools
    set -x PATH ~/khan/webapp/third_party/frankenserver $KDR/arcanist/khan-bin $KDR/git-bigfile/bin $KDR/git-workflow/bin $KDR/ka-clone/bin $KDR/khan-linter/bin $PATH
end

# Python magic
eval (python -m virtualfish)
eval (python -m virtualfish auto_activation)
set -x SHELL /usr/local/bin/fish
set -x EDITOR nvim

# Fix for WSL's dumb umask issue
if [ (umask) = "0000" ]
    umask 022
end
