function -d "Invokes the bash dnx command" dnx
    bash -c ". ~/.dnx/dnvm/dnvm.sh && dnx $argv"
end
