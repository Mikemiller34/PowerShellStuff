Disable Local Storage of passwords and credentials

Create Registry Key:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa
Name: DisableDomainCreds
Type: DWord
Value: 1

Script:
Set-Location HKLM:
Set-RegistryKey -Path .\SYSTEM\CurrentControlSet\Control\LSA -Name DisableDomainCreds -Value 1 -Type DWord