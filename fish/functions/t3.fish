function -d 'Run a command in the tox Python 3.5 directory' t3
    eval .tox/py35/bin/$argv[1] $argv[2..(count $argv)]
end

