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
Set-HostedContentFilterPolicy -Identity Default -BlockedSenders @{Add="rgolding@goldinglaw.net"} -BlockedSenderDomains @{Add="goldinglaw.net"}
Get-MessageTrace -SenderAddress rgolding@goldinglaw.net -StartDate 01/21/2021 -EndDate 01/23/2021
Connect-IPPSSession
New-ComplianceSearch -Name eFaxJJohnsonFSI -ExchangeLocation All -ContentMatchQuery '(From:rgolding@goldinglaw.net) AND (Subject:Notification: from 185895433)'
Start-ComplianceSearch -Identity "eFaxJJohnsonFSI"
Get-ComplianceSearch -Identity "eFaxJJohnsonFSI"
New-ComplianceSearchAction -SearchName "eFaxJJohnsonFSI"  -Purge -PurgeType HardDelete
New-ComplianceSearchAction -SearchName "eFaxJJohnsonFSI"  -Preview
