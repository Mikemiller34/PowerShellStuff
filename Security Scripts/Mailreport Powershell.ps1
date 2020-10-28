Connect-ExchangeOnline
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Totalmail.csv"
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound -EventType Goodmail | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Goodmail.csv"
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound -EventType EdgeBlockSpam,SpamDetections | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Spam.csv"
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound -EventType EmailPhish | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Phish.csv"
Get-MailflowStatusReport -StartDate 09-01-2020 -EndDate 09-30-2020 -Direction Inbound -EventType EmailMalware | Format-Table MessageCount | Out-File "C:\Users\Mike\Desktop\Malware.csv"