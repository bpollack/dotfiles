function rebuild-factor
    pushd ~/src/factor
    make clean; and make; and ./factor -e='USE: bootstrap.image "unix-x86.64" make-image'; and ./factor -i=boot.unix-x86.64.image
    popd
end

