function gem-home -d='Go to the home page of a given gem'
    gem specification $argv[1] | rg homepage | awk '{ print $2 }' | head -1 | xargs open
end
