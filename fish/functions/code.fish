function code -d "Launch Visual Studio Code"
    set -lx VSCODE_CWD $PWD
    open -n -b "com.microsoft.VSCode" --args $argv
end
