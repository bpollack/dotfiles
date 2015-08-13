function rebuild-emacs
    git ob; and ./autogen.sh; and ./configure --with-ns; and make; and make install; and rm -r /Applications/Emacs.app; and mv nextstep/Emacs.app /Applications
end

