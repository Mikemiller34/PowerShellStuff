You may want to start by installing AzureAD module

Install-Module AzureAD -Force

Revoke ALL employee tokens

Connect-AzureAD
Get-AzureADUser -ALL 1
Get-AzureADUser -ALL 1 | Revoke-AzureADUserAllRefreshToken

Revoke tokens for single employee
Connect-AzureAD
Get-AzureADUser -ObjectId (Paste Object ID found on user's page in Azure AD>Users) | Revoke-AzureADUserAllRefreshToken
