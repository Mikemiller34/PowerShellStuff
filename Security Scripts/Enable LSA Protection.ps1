Enable LSA Protection

Create Registry Key:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa
Name: RunAsPPL
Type: DWord
Value: 1

Script:
Set-Location HKLM:
New-Item -Path .\SYSTEM\CurrentControlSet\Control\LSA -Name RunAsPPL -Value 1 -Type DWord