$env:GOPATH = 'C:\Users\benjamin\src\godev'
$env:PATH += ";$env:GOPATH\bin"

try { $null = gcm pshazz -ea stop; pshazz init 'default' } catch { }
