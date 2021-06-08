Block JavaScript AdobeDC

Create Registry Key:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Adobe\DC\FeatureLockDown
Name: bDisableJavaScript
Type: DWord
Value: 1

Script:
Set-Location HKLM:
New-Item -Path .\SOFTWARE\Policies\Adobe\DC\FeatureLockDown -Name bDisableJavaScript -Value 1 -Type DWord