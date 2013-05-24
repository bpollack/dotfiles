function sgp -d "Set the GOPATH to the current directory, and add its /bin to the PATH"
    set -gx GOPATH (pwd)
    set -x PATH $GOPATH/bin $PATH
end
