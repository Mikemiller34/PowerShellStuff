You may want to start by installing AzureAD module

Install-Module AzureAD -Force

Revoke ALL employee tokens

Connect-AzureAD
Get-AzureADUser -ALL 1
Get-AzureADUser -ALL 1 | Revoke-AzureADUserAllRefreshToken

Revoke tokens for single employee
Connect-AzureAD
Get-AzureADUser -ObjectId (Paste Object ID found on user's page in Azure AD>Users) | Revoke-AzureADUserAllRefreshToken

Example: (Wizard account)
Connect-AzureAD
Get-AzureADUser -ObjectId 98d93f11-c319-4f71-bca6-a950fa500ec1 | Revoke-AzureADUserAllRefreshToken