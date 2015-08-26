function rebuild-emacs
    git ob; and ./autogen.sh; and ./configure --with-ns; and make; and make install; and rsync -av --delete nextstep/Emacs.app /Applications
end

