>> Remove Azure AD User

    >> Connect-AzureAD

    >> Remove-AzureADUser -ObjectId "Users ObjectId"

>> Create Azure AD User

    >> New-AzureADUser

        New-MsolUser -UserPrincipalName "UPN" -DisplayName "Name" -FirstName "FirstName" -LastName "LastName" -Department "Department"



    New-MsolGroup -DisplayName "Group Name" -Description "Group Description"


New-UnifiedGroup -DisplayName "Name" -Alias "Alias" -EmailAddresses "Email" -AccessType Public/Private

    >> See different properties here:
    https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureaduser?view=azureadps-2.0

