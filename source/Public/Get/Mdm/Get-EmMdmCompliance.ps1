<#
    .SYNOPSIS
        Retrieves Intune Device Compliance policies from Microsoft Graph.
    .DESCRIPTION
        The Get-EmMdmCompliance cmdlet connects to Microsoft Graph using the specified API version and retrieves Intune Device Compliance policies for a specified operating system.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API.
    .PARAMETER OperatingSystem
        The operating system for which to retrieve compliance policies.
        Valid values are "android", "iOS", "Win10", "macos", and "all".
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
        The cmdlet returns an array of Intune Device Compliance policy objects.
    .EXAMPLE
        PS> Get-EmMdmCompliance -OperatingSystem "android"
        This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Compliance policies for Android devices.
    .EXAMPLE
        PS> Get-EmMdmCompliance -OperatingSystem "iOS" -graphApiVersion "v1.0"
        This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Device Compliance policies for iOS devices.
    .EXAMPLE
        PS> Get-EmMdmCompliance
        This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Compliance policies for all supported operating systems.
    .NOTES
        The cmdlet uses the following functions:
        - Connect-EmMdmGraph
        - Get-EmMdmComplianceAPI
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmCompliance
#>

function Get-EmMdmCompliance {
    [cmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'Medium'
    )]
    [OutputType([PSCustomObject[]])]
    param (
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Specify the operating system for which to retrieve compliance policies. Default is 'all'."
        )]
        [ValidateSet("android", "iOS", "Win10", "macos", "all")]
        [string]$OperatingSystem = "all",
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
    begin {
        try {
            if ($PSCmdlet.ShouldProcess("Connecting to MgGraph with scopes DeviceManagementConfiguration.Read.All", "Connect-MgGraph")) {
                $isConnected = Connect-EmMdmGraph -Scopes "DeviceManagementConfiguration.Read.All" -AuthObject $AuthObject
            }
        }
        catch {
            throw $_
        }
    }
    process {
        try {
            if ($isConnected -and $PSCmdlet.ShouldProcess("Getting Device Compliance Policies", "Get-EmMdmComplianceAPI")) {
                $DCPs = Get-EmMdmComplianceAPI -OperatingSystem $OperatingSystem -graphApiVersion $graphApiVersion
                if ($DCPs.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No Device Compliance Policies were found"
                }
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
    end {
        Write-Verbose "Returning `"$OperatingSystem`" Device Compliance Policies..."
        return $DCPs
    }
}

