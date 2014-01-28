# fish completions for kerrit

function __kerrit_users
    cut -f 2 ~/.kerrit/users.tsv | grep '@knewton.com$' | sed 's/@knewton.com$//'
end

complete -f -c kerrit -n 'commandline -pc | grep -q \'^ *kerrit  *r  *s  *\'' -a '(__kerrit_users)' -d 'Open a review of a commit'
