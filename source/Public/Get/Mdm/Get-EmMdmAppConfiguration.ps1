<#
    .SYNOPSIS
        Retrieves Intune App Configuration policies from Microsoft Graph.
    .DESCRIPTION
        The Get-EmMdmAppConfiguration cmdlet connects to Microsoft Graph using the specified API version and retrieves Intune App Configuration policies.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        None. This cmdlet does not accept pipeline input.
    .OUTPUTS
        [GetEmMdmTargetedManagedAppConfiguration[]] The cmdlet returns an array of Intune App Configuration policy objects.
    .EXAMPLE
        PS> Get-EmMdmAppConfiguration
        This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune App Configuration policies.
    .EXAMPLE
        PS> Get-EmMdmAppConfiguration -graphApiVersion "v1.0"
        This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune App Configuration policies.
    .NOTES
        The cmdlet uses the following functions:
        - Connect-EmMdmGraph
        - Get-EmMdmAppConfigurationAPI
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmAppConfiguration
#>

function Get-EmMdmAppConfiguration {
    [cmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'Medium'
    )]
    [OutputType([GetEmMdmTargetedManagedAppConfiguration[]])]
    param (
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
                $isConnected = Connect-EmMdmGraph -Scopes "DeviceManagementApps.Read.All" -AuthObject $AuthObject
            }
            if ($PSCmdlet.ShouldProcess("Getting App Configuration Policies", "Get-EmMdmAppConfigurationAPI")) {
                $DCPs = Get-EmMdmAppConfigurationAPI -graphApiVersion $graphApiVersion
                if ($DCPs.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No App Configuration Policies were found"
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