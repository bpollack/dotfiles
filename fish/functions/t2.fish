function -d 'Run a command in the tox Python 2.7 directory' t2
    eval .tox/py27/bin/$argv[1] $argv[2..(count $argv)]
end

