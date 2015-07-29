function fish_greeting
    if status --is-interactive
        ~/.local/bin/fortune -o
    end
end

set -x PATH ~/.local/bin /usr/local/bin $PATH

if test -d ~/khan
    # Add frankenserver bins to PATH
    set KDR ~/khan/devtools
    set -x PATH ~/khan/webapp/third_party/frankenserver $KDR/arcanist/khan-bin $KDR/git-bigfile/bin $KDR/git-workflow/bin $KDR/ka-clone/bin $KDR/khan-linter/bin $PATH
end

# Python magic
eval (python -m virtualfish)
eval (python -m virtualfish auto_activation)
