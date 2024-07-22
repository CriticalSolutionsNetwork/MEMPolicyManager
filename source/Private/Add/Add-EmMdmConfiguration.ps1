<#
.SYNOPSIS
Adds a device configuration policy to Microsoft Graph.

.DESCRIPTION
The Add-EmConfiguration function takes a configuration object of various types, converts it to JSON,
and sends it to the Microsoft Graph API to add a device configuration policy.

.PARAMETER Configuration
The configuration object to be added. Valid types are:
- CreateEmAndroidWorkProfileGeneralDeviceConfiguration
- CreateEmAndroidWorkProfileVpnConfiguration
- CreateEmIosupdateconfiguration
- CreateEmMacOSCustomConfiguration
- CreateEmMacOSDeviceFeaturesConfiguration
- CreateEmMacOSEndpointProtectionConfiguration
- CreateEmMacOSExtensionsConfiguration
- CreateEmMacOSGeneralDeviceConfiguration
- CreateEmMacOSSoftwareUpdateConfiguration
- CreateEmWindows10CustomConfiguration
- CreateEmWindows10EndpointProtectionConfiguration
- CreateEmWindows10GeneralConfiguration
- CreateEmWindows81SCEPCertificateProfile
- CreateEmWindows81TrustedRootCertificate
- CreateEmWindowsHealthMonitoringConfiguration
- CreateEmWindowsUpdateForBusinessConfiguration

.PARAMETER graphApiVersion
The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". Default is "beta".

.EXAMPLE
$configuration = [CreateEmAndroidWorkProfileGeneralDeviceConfiguration]::new()
Add-EmMdmConfiguration -Configuration $configuration

.EXAMPLE
$configuration = [CreateEmMacOSCustomConfiguration]::new()
Add-EmMdmConfiguration -Configuration $configuration -graphApiVersion "v1.0"
#>
function Add-EmMdmConfiguration {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript({
            $_ -is [CreateEmAndroidWorkProfileGeneralDeviceConfiguration] -or
            $_ -is [CreateEmAndroidWorkProfileVpnConfiguration] -or
            $_ -is [CreateEmIosUpdateConfiguration] -or
            $_ -is [CreateEmMacOSCustomConfiguration] -or
            $_ -is [CreateEmMacOSDeviceFeaturesConfiguration] -or
            $_ -is [CreateEmMacOSEndpointProtectionConfiguration] -or
            $_ -is [CreateEmMacOSExtensionsConfiguration] -or
            $_ -is [CreateEmMacOSGeneralDeviceConfiguration] -or
            $_ -is [CreateEmMacOSSoftwareUpdateConfiguration] -or
            $_ -is [CreateEmWindows10CustomConfiguration] -or
            $_ -is [CreateEmWindows10EndpointProtectionConfiguration] -or
            $_ -is [CreateEmWindows10GeneralConfiguration] -or
            $_ -is [CreateEmWindows81SCEPCertificateProfile] -or
            $_ -is [CreateEmWindows81TrustedRootCertificate] -or
            $_ -is [CreateEmWindowsHealthMonitoringConfiguration] -or
            $_ -is [CreateEmWindowsUpdateForBusinessConfiguration]
        })]
        [object]$Configuration,

        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $JSON = $Configuration | ConvertTo-Json -Depth 10
        $Resource = "deviceManagement/deviceConfigurations"
        $uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
        try {
            $response = Invoke-MgGraphRequest -Uri $uri -Method Post -Body $JSON -ContentType "application/json"
            Write-Verbose "Device Configuration Policy added successfully." -Verbose
            return $response
        } catch {
            throw $_
        }
    }
}