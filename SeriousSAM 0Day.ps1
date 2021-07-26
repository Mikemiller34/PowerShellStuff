icacls $env:windir\system32\config\*.* /inheritance:e
vssadmin delete shadows /all