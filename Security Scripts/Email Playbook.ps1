# Trace an email, create a compliance search, and hard delete the email
# If not already installed, install the following module:

Install-Module ExchangeOnlineManagement

#  Connect to the Exchange Admin Center

Connect-ExchangeOnline

# How to add the sender and domain to your anti-spam block list ***Please ensure you include the "@" before the "{" for both the sender and domain portion, otherwise it will add this address but also erase any existing addresses you have on your block list***
# The -Identity is looking for the name of your desired anti-spam policy
# Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/set-hostedcontentfilterpolicy?view=exchange-ps

Set-HostedContentFilterPolicy -Identity Default -BlockedSenders @{Add = "SenderAddress" } -BlockedSenderDomains @{Add = "SenderDomain" }

# To trace an email ***Default will search only previous 48 hours. Add startdate and enddate filters to go further back***
# Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/get-messagetrace?view=exchange-ps

Get-MessageTrace -SenderAddress (InsertAddress) -StartDate (EnterDate) -EndDate (EnterDate)

# Connect to the Security and Compliance Center

Connect-IPPSSession

# How to create a compliance seach policy ***This DOES NOT start the search***
# Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/new-compliancesearchaction?view=exchange-ps

New-ComplianceSearch -Name ("EnterName") -ExchangeLocation (EnterLocation) -ContentMatchQuery ('(EnterDesiredQuery) AND/OR (EnterAdditionalQueriesIfDesired)')

# How to start a compliance search
# Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/start-compliancesearch?view=exchange-ps

Start-ComplianceSearch -Identity ("EnterNameOfDesiredComplianceSearch")

# How to monitor a running search ***Run until results say complete; It is possible the first time you run, it may say it has not started yet***
# Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/get-compliancesearch?view=exchange-ps

Get-ComplianceSearch -Identity ("NameOfRunningSearch")

# How to launch a Hard Delete of an email ***You will need the name of the previous compliance search, this will delete all the results found by the compliance search***
# Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/new-compliancesearchaction?view=exchange-ps

New-ComplianceSearchAction -SearchName ("NameOfPreviouslyCreatedComplianceSearch") -Purge -PurgeType HardDelete

#How to monitor the Hard Delete status ***When the Hard Delete command completes, this following command will error out, due to the emails no longer existing***
#Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/new-compliancesearchaction?view=exchange-ps

New-ComplianceSearchAction -SearchName ("SameNameAsPreviousStep") -Preview

# ***All Commands***

Connect-ExchangeOnline
Set-HostedContentFilterPolicy -Identity "Policy Name" -BlockedSenders @{Add = "SenderEmailAddress" } -BlockedSenderDomains @{Add = "Domain" }
Get-MessageTrace -SenderAddress "SenderEmailAddress" -StartDate "DayBeforeReceipt" -EndDate "DayAfterReceipt"
//
Connect-IPPSSession
New-ComplianceSearch -Name "ComplianceSearchName" -ExchangeLocation All -ContentMatchQuery '(From:"SenderEmailAddress") AND (Subject:"EmailSubject")'
Start-ComplianceSearch -Identity "ComplianceSearchName"
//
Get-ComplianceSearch -Identity "ComplianceSearchName"
//
New-ComplianceSearchAction -SearchName "ComplianceSearchName"  -Purge -PurgeType HardDelete
//
New-ComplianceSearchAction -SearchName "ComplianceSearchName"  -Preview
//
