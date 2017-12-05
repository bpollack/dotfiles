function pipu -d 'Updates all outdated packages in pip'
    eval pip$argv list -o | tail +3 | awk '{print $1}' | xargs pip$argv install -U
end
