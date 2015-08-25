function -d 'runs Mercurial with hg-git enabled' ghg
    ~/.virtualenvs/hgg/bin/hg --config extensions.hggit= $argv
end
