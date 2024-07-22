<#
    .SYNOPSIS
        Retrieves MDM Settings Catalog policies from Microsoft Graph API.
    .DESCRIPTION
        The Get-EmMdmSettingsCatalogAPI cmdlet sends a GET request to the Microsoft Graph API to retrieve MDM Settings Catalog policies. The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and allows filtering by platform.
    .PARAMETER Platform
        The platform for which to retrieve settings catalog policies. Valid values are "windows10", "macOS", and $null. The default value is $null.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        EmConfigurationPolicy[] Returns an array of MDM Settings Catalog policy objects.
    .EXAMPLE
        Get-EmMdmSettingsCatalogAPI -Platform "windows10" -graphApiVersion "v1.0"
        This example retrieves Windows 10 MDM Settings Catalog policies using the v1.0 API version.
    .EXAMPLE
        Get-EmMdmSettingsCatalogAPI
        This example retrieves all MDM Settings Catalog policies using the default beta API version.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Get-EmMdmSettingsCatalogAPI {
    #[Alias("Get-SettingsCatalogPolicy")]
    [cmdletBinding()]
    [OutputType([EmConfigurationPolicy[]])]
    param (
        [parameter(Mandatory = $false)]
        [ValidateSet("windows10", "macOS", $null)]
        [string]$Platform = $null,
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $allPolicies = @()
        if ($Platform) {
            $Resource = "deviceManagement/configurationPolicies?`$filter=platforms has '$Platform' and technologies has 'mdm'"
        }
        else {
            $Resource = "deviceManagement/configurationPolicies?`$filter=technologies has 'mdm'"
        }
        try {
            $uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
            do {
                $response = Invoke-MgGraphRequest -Uri $uri -Method Get
                $allPolicies += $response.Value | ForEach-Object { [EmConfigurationPolicy]::new($_) }
                $uri = $response."@odata.nextLink"
            } while ($null -ne $uri)
            return $allPolicies
        }
        catch {
            throw $_#"An error occurred while getting the Settings Catalog policies: `n$_"
            break
        }
    }
}
