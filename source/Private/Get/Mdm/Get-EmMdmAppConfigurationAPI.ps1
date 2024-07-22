<#
    .SYNOPSIS
        Retrieves MDM App Configuration policies from Microsoft Graph API.
    .DESCRIPTION
        The Get-EmMdmAppConfigurationAPI cmdlet sends a GET request to the Microsoft Graph API to retrieve MDM App Configuration policies. The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and returns the policies of type 'targetedManagedAppConfiguration'.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        System.Object[] Returns an array of MDM App Configuration policy objects of type 'targetedManagedAppConfiguration'.
    .EXAMPLE
        Get-EmMdmAppConfigurationAPI -graphApiVersion $graphApiVersion
        This example retrieves MDM App Configuration policies using the v1.0 API version.
    .EXAMPLE
        Get-EmMdmAppConfigurationAPI
        This example retrieves MDM App Configuration policies using the default beta API version.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Get-EmMdmAppConfigurationAPI {
    [cmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        <#
            #microsoft.graph.iosManagedAppProtection
            #microsoft.graph.targetedManagedAppConfiguration
            #microsoft.graph.androidManagedAppProtection
            #microsoft.graph.mdmWindowsInformationProtectionPolicy
        #>
        $Resource = "deviceAppManagement/managedAppPolicies"
        $uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
        try {
            $response = Invoke-MgGraphRequest -Uri $uri -Method GET
            $objects = $response.value | Where-Object { $_."@odata.type" -eq "#microsoft.graph.targetedManagedAppConfiguration" } | `
                ForEach-Object { [GetEmMdmTargetedManagedAppConfiguration]::new($_) }
            Write-Verbose "App Configuration Policies retrieved successfully." -Verbose
            return $objects
        }
        catch {
            throw "An error occurred while getting the Compliance policies: `n$_"
        }
    }
}