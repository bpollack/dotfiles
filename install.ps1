$dotfiles = Split-Path $MyInvocation.MyCommand.Path

function Set-Directory([string]$dir) {
    if (-not (Test-Path $dir)) {
        mkdir -force $dir
    }
}

try {
    $null = Get-Command scoop -ErrorAction stop
    scoop install concfg git-with-openssh go gradle mercurial nodejs pshazz python
} catch {
    Write-Host "D'oh! Install scoop, then rerun this script"
}

Copy-Item "gitconfig" "$HOME\.gitconfig"
Copy-Item "gitignore" "$HOME\.gitignore"
Copy-Item "hgignore" "$HOME\.hgignore"
Copy-Item "hgrc" "$HOME\.hgrc"

Set-Directory (Split-Path $profile)
Copy-Item "profile.ps1" $profile
