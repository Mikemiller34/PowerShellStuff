>> Ensure you have the latest Intune PowerShell Scripts.

https://github.com/microsoftgraph/powershell-intune-samples

>> Download ZIP, extarct ZIP to location of your choosing.

>> Run PowerShell as admin

>> Install AzureAD Module as needed

    >>Install-Module AzureAD

>> EXPORT Commands:

    >> Set-ExecutionPolicy Bypass

    >> A 

    >> Connect-AzureAD

    >> cd "to location of the saved files"

    >> .\DeviceConfiguration_Export.ps1

    >> specify UPN of account

        >> if first run, may be prompted to grant consent

    >> specify desired export location
    
>> All DeviceConfig settings should now be exported to your specified location.

>> IMPORT Commands:

    >>.\DeviceConfiguration_Import_FromJSON.ps1

        >> Copy the path of the desired JSON file you want to import

>> Now check Intune to confirm the policy was imported.
