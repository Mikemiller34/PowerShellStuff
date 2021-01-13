Trace an email, create a compliance search, and hard delete the email
If not already installed, install the followinf modules:

Install-Module ExchangeOnlineManagement
Install-Module IPPSSession

Connect to the Exchange Admin Center

>> Connect-ExchangeOnline

To trace an email ***Defualt will search only previous 48 hours. Add startdate and enddate filters to go further back***
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/get-messagetrace?view=exchange-ps

>> Get-MessageTrace -SenderAddress (InsertAddress) -StartDate (EnterDate) -EndDate (EnterDate)

Connect to the Security & Compliance Center

>> Connect-IPPSSession

How to create a compliance seach policy ***This DOES NOT start the search***
Avialable Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/new-compliancesearchaction?view=exchange-ps

>> New-ComplianceSearch -Name ("EnterName") -ExchangeLocation (EnterLocation) -ContentMatchQuery ('(EnterDesiredQuery) AND/OR (EnterAdditionalQueriesIfDesired)')

How to start a compliance search
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/start-compliancesearch?view=exchange-ps

>> Start-ComplianceSearch -Identity ("EnterNameOfDesiredComplianceSearch")

How to monitor a running search ***Run until results say complete; It is possible the first time you run, it may not say it has started yet***
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/get-compliancesearch?view=exchange-ps

>> Get-ComplianceSearch -Identity ("NameOfRunningSearch")

How to launch a Hard Delete of an email ***You will need the name of the previous compliance search, this will delete all the results found by the compliance search***
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/new-compliancesearchaction?view=exchange-ps

>> New-ComplianceSearchAction -SearchName ("NameOfPreviouslyCreatedComplianceSearch") -Purge -PurgeType HardDelete

How to monitor the Hard Delete status ***When the Hard Delete command completes, this following command will error out, due to the emails no longer existing***
Available Filters: https://docs.microsoft.com/en-us/powershell/module/exchange/new-compliancesearchaction?view=exchange-ps

>> New-ComplianceSearchAction -SearchName ("SameNameAsPreviousStep") -Preview

***All Commands***

Connect-ExchangeOnline
Get-MessageTrace -SenderAddress kiyoshi@asano-agency.com -StartDate 01/12/2021 -EndDate 01/14/2021
Connect-IPPSSession
New-ComplianceSearch -Name PwdResetKP -ExchangeLocation All -ContentMatchQuery '(From:kiyoshi@asano-agency.com) AND (Subject:Password Report for Pacers at January 13, 2021, 7:17:40 AM {ugnPW})'
Start-ComplianceSearch -Identity "PwdResetKP"
Get-ComplianceSearch -Identity "PwdResetKP"
New-ComplianceSearchAction -SearchName "PwdResetKP"  -Purge -PurgeType HardDelete
New-ComplianceSearchAction -SearchName "PwdResetKP"  -Preview


FULL EXAMPLE:

PS C:\Users\Mike> Connect-ExchangeOnline

----------------------------------------------------------------------------
The module allows access to all existing remote PowerShell (V1) cmdlets in addition to the 9 new, faster, and more reliable cmdlets.

|--------------------------------------------------------------------------|
|    Old Cmdlets                    |    New/Reliable/Faster Cmdlets       |
|--------------------------------------------------------------------------|
|    Get-CASMailbox                 |    Get-EXOCASMailbox                 |
|    Get-Mailbox                    |    Get-EXOMailbox                    |
|    Get-MailboxFolderPermission    |    Get-EXOMailboxFolderPermission    |
|    Get-MailboxFolderStatistics    |    Get-EXOMailboxFolderStatistics    |
|    Get-MailboxPermission          |    Get-EXOMailboxPermission          |
|    Get-MailboxStatistics          |    Get-EXOMailboxStatistics          |
|    Get-MobileDeviceStatistics     |    Get-EXOMobileDeviceStatistics     |
|    Get-Recipient                  |    Get-EXORecipient                  |
|    Get-RecipientPermission        |    Get-EXORecipientPermission        |
|--------------------------------------------------------------------------|

To get additional information, run: Get-Help Connect-ExchangeOnline or check https://aka.ms/exops-docs

Send your product improvement suggestions and feedback to exocmdletpreview@service.microsoft.com. For issues related to the module, contact Microsoft support. Don't use the feedback alias for problems or support issues.
----------------------------------------------------------------------------

PS C:\Users\Mike> Get-MessageTrace -SenderAddress willst@otelco.net -StartDate 10/05/2020 -EndDate 10/09/2020

Received              Sender Address    Recipient Address       Subject                                  Status        
--------              --------------    -----------------       -------                                  ------
10/5/2020 12:50:33 PM willst@otelco.net agalardo@pacers.com     Message: ##03:50 AM, October 05, 2020##, FilteredAsSpam
10/5/2020 12:42:15 PM willst@otelco.net nhendrix@pacers.com     Message: ##03:42 AM, October 05, 2020##, Delivered
10/5/2020 12:40:13 PM willst@otelco.net s.sangster@pacers.com   Message: ##03:40 AM, October 05, 2020##, Delivered
10/5/2020 12:25:53 PM willst@otelco.net corey.wilson@pacers.com Message: ##03:25 AM, October 05, 2020##, Delivered


PS C:\Users\Mike> Connect-IPPSSession
WARNING: Your connection has been redirected to the following URI: "https://nam02b.ps.compliance.protection.outlook.com/Powershell-LiveId?BasicAuthToOAuthConversion=true;PSVersion=5.1.19041.1"
PS C:\Users\Mike> New-ComplianceSearch -Name PwdResetKP -ExchangeLocation All -ContentMatchQuery '(From:willst@otelco.net) AND (Subject:Message: ##03:42 AM, October 05, 2020##,)'

Name                  RunBy JobEndTime Status    
----                  ----- ---------- ------
PwdResetKP                  NotStarted


PS C:\Users\Mike> Start-ComplianceSearch -Identity "PwdResetKP"
PS C:\Users\Mike> Get-ComplianceSearch -Identity "PwdResetKP"

Name                  RunBy        JobEndTime Status    
----                  -----        ---------- ------
PwdResetKP Miller, Mike            InProgress


PS C:\Users\Mike> Get-ComplianceSearch -Identity "PwdResetKP"

Name                  RunBy        JobEndTime             Status   
----                  -----        ----------             ------
PwdResetKP Miller, Mike 10/10/2020 12:26:21 AM Completed


PS C:\Users\Mike> New-ComplianceSearchAction -SearchName "PwdResetKP"  -Purge -PurgeType HardDelete


Confirm
Are you sure you want to perform this action?
This operation will make message items meeting the criteria of the compliance search "PwdResetKP" completely inaccessible to users. There is no automatic 
 method to undo the removal of these message items.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [?] Help (default is "Y"): A

Name                        SearchName            Action RunBy        JobEndTime Status  
----                        ----------            ------ -----        ---------- ------
PwdResetKP_Purge PwdResetKP Purge  Miller, Mike            Starting

PS C:\Users\Mike> New-ComplianceSearchAction -SearchName "PwdResetKP"  -Preview
Unable to execute the task. Reason: The search "PwdResetKP" didn't return any results. Please update the search results or edit the query and run the     
search again.
    + CategoryInfo          : WriteError: (:) [New-ComplianceSearchAction], ComplianceJobTaskException
   nceJobTaskException] D8E2E95F,Microsoft.Office.ComplianceJob.Tasks.NewComplianceSearchAction
    + PSComputerName        : nam02b.ps.compliance.protection.outlook.com
 
PS C:\Users\Mike>

