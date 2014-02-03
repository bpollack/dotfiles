function vcsroot -d "finds the root of the current repository on disk"
    if hg id >/dev/null ^&1
        hg root
    else if git rev-parse HEAD >/dev/null ^&1
        git rev-parse --show-toplevel
    else
        echo "You don't seem to be in a repository."
        return 1
    end
end

