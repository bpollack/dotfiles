$dotfiles = Split-Path $MyInvocation.MyCommand.Path

function Set-Directory([string]$dir) {
    if (-not (Test-Path $dir)) {
        mkdir -force $dir
    }
}

function Set-Symlink([string]$src, [string]$dest) {
    $WinVer = [System.Environment]::OSVersion.Version.Build
    if ($WinVer -gt 14972) {
        if (-not (Test-Path $dest)) {
            cmd /c mklink $dest (Resolve-Path $src)
        }
    } else {
        Copy-Item $src $dest
    }
}

function Set-HgRepo([string]$dir, [string]$url) {
    if (-not (Test-Path $dir)) {
        hg clone $url $dir
    }
    hg -R $dir pull
    hg -R $dir update
}

try {
    $null = Get-Command scoop -ErrorAction stop
    scoop install concfg git-with-openssh go gradle mercurial nodejs openjdk pshazz python
} catch {
    Write-Host "D'oh! Install scoop, then rerun this script"
}

pshazz use myty

Set-HgRepo hg-git https://bitbucket.org/durin42/hg-git
Set-HgRepo hg-prompt https://bitbucket.org/sjl/hg-prompt

Set-Directory $env:APPDATA\pip

Set-Symlink "gitconfig" "$HOME\.gitconfig"
Set-Symlink "gitignore" "$HOME\.gitignore"
Set-Symlink "hgignore" "$HOME\.hgignore"
Set-Symlink "hgrc" "$HOME\.hgrc"
Set-Symlink "factor-boot-rc" "$HOME\.factor-boot-rc"
Set-Symlink "pip.conf" "$env:APPDATA\pip\pip.ini"

Set-Directory (Split-Path $profile)
Set-Symlink "profile.ps1" $profile
