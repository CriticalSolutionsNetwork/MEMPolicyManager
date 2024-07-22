<#
    .SYNOPSIS
        Retrieves all Endpoint Security policies from Microsoft Graph.
    .DESCRIPTION
        This function connects to Microsoft Graph API and retrieves all Endpoint Security policies available in Endpoint Manager. This is a private function and is not exported by the module.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        PSCustomObject[] Returns an array of Endpoint Security policy objects.
    .EXAMPLE
        $policies = Get-EmDMIntent -graphApiVersion "v1.0"
        Write-Output $policies
        This example retrieves Endpoint Security policies using the v1.0 API version and outputs them.
    .EXAMPLE
        $policies = Get-EmDMIntent
        Write-Output $policies
        This example retrieves Endpoint Security policies using the default beta API version and outputs them.
    .NOTES
        This function is intended for internal use within the module.
        Author: DrIOSX
        Date: 07/21/2024
#>
function Get-EmDMIntent {
    #[Alias("Get-EmDeviceManagementIntent")]
    [cmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $ESP_resource = "deviceManagement/intents"
        try {
            $uri = "https://graph.microsoft.com/$graphApiVersion/$($ESP_resource)"
            return (Invoke-MgGraphRequest -Method GET -Uri $uri).Value | ForEach-Object { New-Object -TypeName EmDMIntent -ArgumentList $_ }
        }
        catch {
            throw "An error occurred while retrieving the Endpoint Security policies: `n$_"
        }
    }
}
