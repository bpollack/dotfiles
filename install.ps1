$dotfiles = Split-Path $MyInvocation.MyCommand.Path

function Set-Directory([string]$dir) {
    if (-not (Test-Path $dir)) {
        mkdir -force $dir
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
    scoop install concfg git-with-openssh go gradle mercurial nodejs pshazz python
} catch {
    Write-Host "D'oh! Install scoop, then rerun this script"
}

Set-HgRepo evolve https://bitbucket.org/marmoute/mutable-history
Set-HgRepo hg-git https://bitbucket.org/durin42/hg-git
Set-HgRepo hg-prompt https://bitbucket.org/sjl/hg-prompt
Set-HgRepo mercurial-cli-templates https://bitbucket.org/bpollack/mercurial-cli-templates

Copy-Item "gitconfig" "$HOME\.gitconfig"
Copy-Item "gitignore" "$HOME\.gitignore"
Copy-Item "hgignore" "$HOME\.hgignore"
Copy-Item "hgrc" "$HOME\.hgrc"

Set-Directory (Split-Path $profile)
Copy-Item "profile.ps1" $profile
