$dotfiles = Split-Path $MyInvocation.MyCommand.Path

function Ensure-Link([string]$source, [string]$target, [bool]$directory = $false) {
    if ($directory) {
        $flag = "/d"
    } else {
        $flag = ""
    }
    if (! (Test-Path $target)) {
        cmd /c mklink $flag $target $dotfiles\$source
    }
}

function Ensure-Directory([string]$dir) {
    if (! (Test-Path $HOME/$dir)) {
        mkdir -force $HOME/$dir
    }
}

Ensure-Link "gitconfig" "$HOME\.gitconfig"
Ensure-Link "hgignore" "$HOME\.hgignore"
Ensure-Link "hgrc" "$HOME\.hgrc"
Ensure-Link "vim" "$HOME\vimfiles" $true
Ensure-Link "vim" "$HOME\.vim" $true
Ensure-Link "vimrc" "$HOME\.vimrc"
Ensure-Link "profile.ps1" $profile

Ensure-Directory ".vim\backupdir"
Ensure-Directory ".vim\undodir"
