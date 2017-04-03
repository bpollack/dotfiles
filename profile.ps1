$env:GOPATH = "$env:USERPROFILE\src\godev"
$env:PATH += ";$env:GOPATH\bin"

try {
    $null = Get-Command pshazz -ErrorAction stop; pshazz init 'default'
} catch {
    Write-Host "D'oh! Remember to install scoop, pshazz, and so on"
}
