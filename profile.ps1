function mt {
    param([string]$filename)
    & gvim --remote-tab-silent $filename
}

function sgp {
    $components = $env:PATH -split ";" | ?{-not [string]::IsNullOrEmpty($_)}

    if ($env:GOPATH -ne $null) {
        $components = $components | ?{$_ -ne "$env:GOPATH\bin"}
    }

    $env:PATH = [string]::join(";", $components)
    $env:GOPATH = Get-Location

    if (! $components.Contains("c:\mingw64\bin")) {
        $env:PATH += ";c:\mingw64\bin"
    }
    if (! $components.Contains("c:\code\go\bin")) {
        $env:PATH += ";c:\code\go\bin"
    }
    $env:PATH += ";$env:GOPATH\bin"
}
