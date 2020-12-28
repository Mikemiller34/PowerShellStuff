Create Registry Key:
HKEY_LOCAL_MACHINE\SOFTWARE\policies\Microsoft\office\16.0\common\officeupdate
Name: hideenabledisableupdates
Type: DWord
Value: 1

Script:
Set-Location HKLM:
New-Item -Path .\SOFTWARE\policies\Microsoft\office\16.0\common\officeupdate -Name hideenabledisableupdates -Value 1 -Type DWord