function fish_greeting
    if status --is-interactive
        ~/src/fortune/fortune -o
    end
end
