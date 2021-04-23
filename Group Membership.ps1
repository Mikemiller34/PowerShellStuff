>> Open PowerShell as an Admin.

>> Install the AzureAD Module. (This is only needed the first time)

    >> Install-Module AzureAD

    >> On the following questions, press “Y” and hit enter

    >> Once it is installed, connect to Azure AD.

>> Connect-AzureAD

    >> Login with your Credentials.

    >> Once connected, you can check the desired Group.


Check Membership

    >> Get-AzureADGroupMember -ObjectId "ObjectId from Azure"

Add Members

    >> Add-AzureADGroupMember -ObjectId "Groups ObjectId" -RefObjectId "Users ObjectId"

Remove Members

    >> Remove-AzureADGroupMember -Object "Groups ObjectId" -MemberId "Users ObjectId"


