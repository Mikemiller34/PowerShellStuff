# Connecting to the AzureAD Module
Install-Module AzureADPreview
#  (It is recommended to run -Force if you have a previous installation of AzureAD module installed)
Import-Module AzureADPreview
Connect-AzureAD

# Fetch current group settings for the Azure AD organization
$grpUnifiedSetting = (Get-AzureADDirectorySetting | where -Property DisplayName -Value "Group.Unified" -EQ)
$template = Get-AzureADDirectorySettingTemplate -Id 62375ab9-6b52-47ed-826b-58e47e0e304b
$setting = $template.CreateDirectorySetting()

# Fetch existing group settings
$Setting.Values

# Enable the feature
$Setting["EnableMIPLabels"] = "True"

# Confirm newly applied value
$Setting.Values

# Save and apply the changes
Set-AzureADDirectorySetting -Id $grpUnifiedSetting.Id -DirectorySetting $setting

# Now you must connect to the Security& Compliance Admin center PowerShell module 

Connect-IPPSSession

# Now you can synchronize your sensitivity labels to Azure AD

Execute-AzureAdLabelSync

# You should now be able to select