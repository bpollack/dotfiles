# fish completions for kerrit

function __kerrit_users
    set -l kerrit_users ~/.kerrit/users.tsv
    if test ! -f $kerrit_users
        return
    end
    cat $kerrit_users
end

complete -f -c kerrit -n 'commandline -pc | grep -q \'^ *kerrit  *r  *s  *\'' -a '(__kerrit_users)'
