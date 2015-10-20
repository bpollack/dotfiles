function -d "Invokes the bash dnu command" dnu
    bash -c ". ~/.dnx/dnvm/dnvm.sh && dnu $argv"
end
