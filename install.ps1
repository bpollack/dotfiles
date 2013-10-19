$dotfiles = Split-Path $MyInvocation.MyCommand.Path

function Ensure-Link([string]$source, [string]$target, [bool]$directory = $false) {
    if ($directory) {
        $flag = "/d"
    } else {
        $flag = ""
    }
    if (-not (Test-Path $target)) {
        cmd /c mklink $flag $target $dotfiles\$source
    }
}

function Ensure-Directory([string]$dir) {
    if (-not (Test-Path $dir)) {
        mkdir -force $dir
    }
}

Ensure-Link "gitconfig" "$HOME\.gitconfig"
Ensure-Link "hgignore" "$HOME\.hgignore"
Ensure-Link "hgrc" "$HOME\.hgrc"
Ensure-Link "vim" "$HOME\vimfiles" $true
Ensure-Link "vim" "$HOME\.vim" $true
Ensure-Link "vimrc" "$HOME\.vimrc"

Ensure-Directory (Split-Path $profile)
Ensure-Link "profile.ps1" $profile

Ensure-Directory "$HOME\.vim\backupdir"
Ensure-Directory "$HOME\.vim\undodir"
