ASR Rules

Attack Surface Reduction Rules
Enable:
Set-MpPreference -AttackSurfaceReductionRules_Ids <Rule ID> -AttackSurfaceReductionRules_Actions Enabled

Audit:
Add-MpPreference -AttackSurfaceReductionRules_Ids <rule ID> -AttackSurfaceReductionRules_Actions AuditMode

Disable:
Add-MpPreference -AttackSurfaceReductionRules_Ids <rule ID> -AttackSurfaceReductionRules_Actions Disabled

Block executable content from email client and webmail
ID: BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550

Block all office applications from creating child processes
ID: D4F940AB-401B-4EFC-AADC-AD5F3C50688A

Block office applications from creating executable content
ID: 3B576869-A4EC-4529-8536-B80A7769E899

Block office applications from injecting code into other processes
ID: 75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84

Block JavaScript or VBScript from launching downloaded executable content
ID: D3E037E1-3EB8-44C8-A917-57927947596D

Block execution of potentially obfuscated scripts
ID: 5BEB7EFE-FD9A-4556-801D-275E5FFC04CC

Block Win32 API calls from Office macros
ID: 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B

Block executable files from running unless they meet a prevalence, age, or trusted list criterion
ID: 01443614-cd74-433a-b99e-2ecdc07bfc25

Use advanced protection against ransomware
ID: c1db55ab-c21a-4637-bb3f-a12568109d35

Block credential stealing from the Windows local security authority subsystem
ID: 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2

Block process creations originating from PSExec and WMI commands
ID: d1e49aac-8f56-4280-b9ba-993a6d77406c

Block untrusted and unsigned processes that run from USB
ID: b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4

Block Adobe Reader from creating child processes
ID: 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c

Block persistence through WMI event subscription
ID: e6db77e5-3df2-4cf1-b95a-636979351e5b