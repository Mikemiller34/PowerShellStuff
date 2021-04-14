>> Open PowerShell as an Admin.

>> Install the AzureAD Module. (This is only needed the first time)

    >> Install-Module AzureAD

    >> On the following questions, press “Y” and hit enter

    >> Once it is installed, connect to Azure AD.

>> Connect-AzureAD

    >> Login with your Credentials.

    >> Once connected, you can check the desired Group.

>> Get-AzureADGroupMember -ObjectId "ObjectID from Azure"
	
