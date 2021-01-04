Connect-ExchangeOnline
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Totalmail.csv"
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound -EventType Goodmail | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Goodmail.csv"
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound -EventType EdgeBlockSpam,SpamDetections | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Spam.csv"
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound -EventType EmailPhish | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Phish.csv"
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound -EventType EmailMalware | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Malware.csv"

<!-- Quarantine report: Run for page 1, then 2, then 3, and so on until you stop getting 1000 results per page, then add them up and you have your monthly count. -->
Get-QuarantineMessage -StartReceivedDate 12/01/2020 -EndReceivedDate 01/01/2021 -PageSize 1000 -Page 1| Out-File "C:\Users\Mike\Desktop\SentToQuarantineDec.csv"