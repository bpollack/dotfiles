function fish_greeting
    if status --is-interactive
        ~/src/fortune/fortune -o
    end
end

set -x PATH ~/.local/bin /usr/local/bin $PATH

# Python magic
eval (python -m virtualfish)
eval (python -m virtualfish auto_activation)
