function git_branches
  command git branch --no-color ^/dev/null | cut -c 3-
end

complete -f -c git -n 'contains co (commandline -poc)' -a '(git_branches)'
