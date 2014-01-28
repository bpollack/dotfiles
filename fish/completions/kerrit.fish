# fish completions for kerrit

function __kerrit_users
    set -l kerrit_users ~/.kerrit/users.tsv
    if test ! -f $kerrit_users
        return
    end
    cut -f 2 $kerrit_users | grep '@knewton.com$' | sed 's/@knewton.com$//'
end

complete -f -c kerrit -n 'commandline -pc | grep -q \'^ *kerrit  *r  *s  *\'' -a '(__kerrit_users)'
