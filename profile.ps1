function mt {
    param([string]$filename)
    & gvim --remote-tab-silent $filename
}

function sgp([bool]$win32 = $false) {
    $components = $env:PATH -split ";" | ?{-not [string]::IsNullOrEmpty($_)}

    if ($env:GOPATH -ne $null) {
        $components = $components | ?{$_ -ne "$env:GOPATH\bin"}
    }
    $components = $components | ?{-not ($_ -match "mingw")}

    $env:PATH = [string]::join(";", $components)
    $env:GOPATH = Get-Location

    if ($win32 -and -not $components.Contains("c:\mingw64\bin")) {
        $env:PATH += ";c:\mingw32\bin"
    } else {
        $env:PATH += ";c:\mingw64\bin"
    }
    if (! $components.Contains("c:\code\go\bin")) {
        $env:PATH += ";$HOME\src\go\bin"
    }
    $env:PATH += ";$env:GOPATH\bin"
}
