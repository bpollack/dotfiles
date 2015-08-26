function -d 'runs Mercurial with hg-git enabled' ghg
    ~/.virtualenvs/ghg/bin/hg --config extensions.hggit=~/src/dotfiles/hg-git/hggit $argv
end
