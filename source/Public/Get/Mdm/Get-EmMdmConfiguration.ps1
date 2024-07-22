<#
    .SYNOPSIS
        Retrieves Intune Device Configuration policies from Microsoft Graph.
    .DESCRIPTION
        The Get-EmMdmConfiguration cmdlet connects to Microsoft Graph using the specified API version and retrieves Intune Device Configuration policies for a specified device type.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API.
    .PARAMETER DeviceType
        The device type for which to retrieve configuration policies.
        Valid values are "windows81", "macOSExtensions", "macOSCustom", "macOSDeviceFeatures", "macOSGeneral", "macOSSoftwareUpdate", "macOSEndpointProtection",
        "androidWorkProfileGeneral", "androidWorkProfileVpn", "windowsHealthMonitoring", "windows81SCEP", "windows10Custom", "windows10EndpointProtection", "windows10General", and "all".
        The default value is "all".
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use.
        Valid values are "beta" and "v1.0".
        The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        None. This cmdlet does not accept pipeline input.
    .OUTPUTS
        The cmdlet returns an array of Intune Device Configuration policy objects.
    .EXAMPLE
        PS> Get-EmMdmConfiguration -DeviceType "windows81"
        This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Configuration policies for Windows 8.1 devices.
    .EXAMPLE
        PS> Get-EmMdmConfiguration -DeviceType "macOSGeneral" -graphApiVersion "v1.0"
        This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Device Configuration policies for macOS devices.
    .EXAMPLE
        PS> Get-EmMdmConfiguration
        This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Configuration policies for all supported device types.
    .NOTES
        The cmdlet uses the following functions:
        - Connect-EmMdmGraph
        - Get-EmMdmConfigurationAPI
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmConfiguration
#>

function Get-EmMdmConfiguration {
    [cmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'Medium'
    )]
    [OutputType([pscustomobject[]])]
    param (
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "Specify the device type for which to retrieve configuration policies. Default is 'all'."
        )]
        [ValidateSet(
            "windows81",
            "macOSExtensions",
            "macOSCustom",
            "macOSDeviceFeatures",
            "macOSGeneral",
            "macOSSoftwareUpdate",
            "macOSEndpointProtection",
            "androidWorkProfileGeneral",
            "androidWorkProfileVpn",
            "windowsHealthMonitoring",
            "windows81SCEP",
            "windows10Custom",
            "windows10EndpointProtection",
            "windows10General",
            "all"
        )]
        [string]$DeviceType = "all",
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The authentication object used for connecting to Microsoft Graph."
        )]
        [EmMdmAuthBase]$AuthObject,
        [Parameter(
            DontShow = $true,
            Mandatory = $false,
            HelpMessage = "The version of the Microsoft Graph API to use. Valid values are 'beta' and 'v1.0'. The default value is 'beta'."
        )]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        try {
            if ($PSCmdlet.ShouldProcess("Connecting to MgGraph with scopes DeviceManagementConfiguration.Read.All", "Connect-MgGraph")) {
                $isConnected = Connect-EmMdmGraph -Scopes "DeviceManagementConfiguration.Read.All" -AuthObject $AuthObject
            }
            if ($isConnected -and $PSCmdlet.ShouldProcess("Getting Device Configuration Policies", "Get-EmMdmConfigurationAPI")) {
                $DCPs = Get-EmMdmConfigurationAPI -odataType $DeviceType -graphApiVersion $graphApiVersion
                if ($DCPs.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No Device Compliance Policies were found"
                }
                return $DCPs
            }
        }
        catch {
            throw $_
        }
        finally {
            if ($isConnected) {
                Write-Verbose "Disconnecting from MgGraph..." -Verbose
                Disconnect-MgGraph | Out-Null
            }
        }
    }
}