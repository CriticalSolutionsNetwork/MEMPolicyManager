<#
    .SYNOPSIS
        Retrieves all settings for a specified category of an Endpoint Security policy from Microsoft Graph.
    .DESCRIPTION
        This function connects to Microsoft Graph API and retrieves all settings for a specified category of an Endpoint Security policy
        available in Endpoint Manager. This is a private function and is not exported by the module.
    .EXAMPLE
        $settings = Get-EndpointSecurityCategorySetting -PolicyId 'policy1' -categoryId 'category1'
        Write-Output $settings
    .PARAMETER PolicyId
        The ID of the Endpoint Security policy for which to retrieve category settings.
    .PARAMETER categoryId
        The ID of the category for which to retrieve settings.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        PSCustomObject[] Returns an array of Endpoint Security policy setting objects.
    .NOTES
        This function is intended for internal use within the module.
#>
function Get-EmDMSettingInstance {
    #[Alias("Get-EmDeviceManagementSettingInstance")]
    [cmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$PolicyId,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$categoryId,
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $ESP_resource = "deviceManagement/intents/$PolicyId/categories/$categoryId/settings?\`$expand=Microsoft.Graph.DeviceManagementComplexSettingInstance/Value"
        try {
            $uri = "https://graph.microsoft.com/$graphApiVersion/$($ESP_resource)"
            return (Invoke-MgGraphRequest -Method GET -Uri $uri).Value #| ForEach-Object{[EmDMSettingInstance]::new($_)}
        }
        catch {
            throw $_
        }
    }
}
