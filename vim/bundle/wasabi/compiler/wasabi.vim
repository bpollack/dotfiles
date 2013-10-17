if exists("current_compiler")
    finish
endif
let current_compiler="wasabi"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f(%t:%l):\ %m,%f(%l):%m,(%l):%m
