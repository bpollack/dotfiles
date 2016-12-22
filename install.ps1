$dotfiles = Split-Path $MyInvocation.MyCommand.Path

function Set-Link([string]$source, [string]$target, [bool]$directory = $false) {
    if ($directory) {
        $flag = "/d"
    } else {
        $flag = ""
    }
    if (-not (Test-Path $target)) {
        cmd /c mklink $flag $target $dotfiles\$source
    }
}

function Set-Directory([string]$dir) {
    if (-not (Test-Path $dir)) {
        mkdir -force $dir
    }
}

Copy-Item "gitconfig" "$HOME\.gitconfig"
Copy-Item "hgignore" "$HOME\.hgignore"
Copy-Item "hgrc" "$HOME\.hgrc"

Set-Directory (Split-Path $profile)
Copy-Item "profile.ps1" $profile
