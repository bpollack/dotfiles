$env:GOPATH = 'C:\Users\benjamin\src\godev'
$env:PATH += ";$env:GOPATH\bin"

if (Test-Path "$HOME\Documents\WindowsPowerShell\Modules\posh-git") {
    . 'C:\Users\benjamin\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'
}