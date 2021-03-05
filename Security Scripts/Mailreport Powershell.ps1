Connect-ExchangeOnline
Get-MailflowStatusReport -StartDate 02-01-2021 -EndDate 02-28-2021 -Direction Inbound | Format-Table MessageCount | Out-File "C:\Users\mmiller\OneDrive - Pacers Basketball Corp\Audit\February 2021\Totalmail.csv"
Get-MailflowStatusReport -StartDate 02-01-2021 -EndDate 02-28-2021 -Direction Inbound -EventType Goodmail | Format-Table MessageCount | Out-File "C:\Users\mmiller\OneDrive - Pacers Basketball Corp\Audit\February 2021\Goodmail.csv"
Get-MailflowStatusReport -StartDate 02-01-2021 -EndDate 02-28-2021 -Direction Inbound -EventType EdgeBlockSpam,SpamDetections | Format-Table MessageCount | Out-File "C:\Users\mmiller\OneDrive - Pacers Basketball Corp\Audit\February 2021\Spam.csv"
Get-MailflowStatusReport -StartDate 02-01-2021 -EndDate 02-28-2021 -Direction Inbound -EventType EmailPhish | Format-Table MessageCount | Out-File "C:\Users\mmiller\OneDrive - Pacers Basketball Corp\Audit\February 2021\Phish.csv"
Get-MailflowStatusReport -StartDate 02-01-2021 -EndDate 02-28-2021 -Direction Inbound -EventType EmailMalware | Format-Table MessageCount | Out-File "C:\Users\mmiller\OneDrive - Pacers Basketball Corp\Audit\February 2021\Malware.csv"

<!-- Quarantine report: Run for page 1, then 2, then 3, and so on until you stop getting 1000 results per page, then add them up and you have your monthly count. -->
Get-QuarantineMessage -StartReceivedDate 02-01-2021 -EndReceivedDate 02-28-2021 -PageSize 1000 -Page 1| Out-File "C:\Users\mmiller\OneDrive - Pacers Basketball Corp\Audit\February 2021\SentToQuarantineDec.csv"