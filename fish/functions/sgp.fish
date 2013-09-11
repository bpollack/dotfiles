function sgp -d "Set the GOPATH to the current directory, and add its /bin to the PATH"
    if [ -n "$GOPATH" ]
        for x in (seq (count $PATH))
            if [ $PATH[$x] = "$GOPATH/bin" ]
                set clear $x $clear
            end
        end
        for x in $clear
            set -e PATH[$x]
        end
    end
    set -gx GOPATH (pwd)
    set -x PATH $GOPATH/bin $PATH
end
