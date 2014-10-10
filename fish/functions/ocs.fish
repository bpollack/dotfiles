function -d "switches the active OCaml version and activates it" ocs
    opam switch --no-warning $argv
    eval (opam config --fish env)
    set -x MANPATH /usr/share/man /usr/local/share/man $MANPATH
end

