//Trace an email, create a compliance search, and hard delete the email
//If not already installed, install the following module:

Install-Module ExchangeOnlineManagement

//Connect to the Exchange Admin Center

>> Connect-ExchangeOnline

//Block the malicious sender and their domain
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/set-hostedcontentfilterpolicy?view=exchange-ps

>> Set-HostedContentFilterPolicy -Identity Default -BlockedSenders @{Add="SenderAddress"} -BlockedSenderDomains @{Add="SenderDomain"}

//To trace an email ***Defualt will search only previous 48 hours. Add startdate and enddate filters to go further back***
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/get-messagetrace?view=exchange-ps

>> Get-MessageTrace -SenderAddress (InsertAddress) -StartDate (EnterDate) -EndDate (EnterDate)

//Connect to the Security and Compliance Center

>> Connect-IPPSSession

//How to create a compliance seach policy ***This DOES NOT start the search***
Avialable Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/new-compliancesearchaction?view=exchange-ps

>> New-ComplianceSearch -Name ("EnterName") -ExchangeLocation (EnterLocation) -ContentMatchQuery ('(EnterDesiredQuery) AND/OR (EnterAdditionalQueriesIfDesired)')

//How to start a compliance search
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/start-compliancesearch?view=exchange-ps

>> Start-ComplianceSearch -Identity ("EnterNameOfDesiredComplianceSearch")

//How to monitor a running search ***Run until results say complete; It is possible the first time you run, it may not say it has started yet***
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/get-compliancesearch?view=exchange-ps

>> Get-ComplianceSearch -Identity ("NameOfRunningSearch")

//How to launch a Hard Delete of an email ***You will need the name of the previous compliance search, this will delete all the results found by the compliance search***
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/new-compliancesearchaction?view=exchange-ps

>> New-ComplianceSearchAction -SearchName ("NameOfPreviouslyCreatedComplianceSearch") -Purge -PurgeType HardDelete

//How to monitor the Hard Delete status ***When the Hard Delete command completes, this following command will error out, due to the emails no longer existing***
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/new-compliancesearchaction?view=exchange-ps

>> New-ComplianceSearchAction -SearchName ("SameNameAsPreviousStep") -Preview

***All Commands***

Connect-ExchangeOnline
Set-HostedContentFilterPolicy -Identity Default -BlockedSenders @{Add="kiyoshi@asano-agency.com"} -BlockedSenderDomains @{Add="asano-agency.com"}
Get-MessageTrace -SenderAddress kiyoshi@asano-agency.com -StartDate 01/12/2021 -EndDate 01/14/2021
Connect-IPPSSession
New-ComplianceSearch -Name PwdResetKP -ExchangeLocation All -ContentMatchQuery '(From:kiyoshi@asano-agency.com) AND (Subject:Password Report for Pacers at January 13, 2021, 7:17:40 AM {ugnPW})'
Start-ComplianceSearch -Identity "PwdResetKP"
Get-ComplianceSearch -Identity "PwdResetKP"
New-ComplianceSearchAction -SearchName "PwdResetKP"  -Purge -PurgeType HardDelete
New-ComplianceSearchAction -SearchName "PwdResetKP"  -Preview
