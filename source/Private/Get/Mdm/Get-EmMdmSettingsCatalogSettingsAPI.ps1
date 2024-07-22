<#
    .SYNOPSIS
        Retrieves MDM Settings Catalog policy settings from Microsoft Graph API.
    .DESCRIPTION
        The Get-EmMdmSettingsCatalogSettingsAPI cmdlet sends a GET request to the Microsoft Graph API to retrieve settings for a specified MDM Settings Catalog policy. The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes expanded setting definitions.
    .PARAMETER policyId
        The ID of the MDM Settings Catalog policy for which to retrieve settings. This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        EmConfigurationPolicySettingDefinitionsExpanded[] Returns an array of expanded MDM Settings Catalog policy setting definition objects.
    .EXAMPLE
        Get-EmMdmSettingsCatalogSettingsAPI -policyId "12345" -graphApiVersion "v1.0"
        This example retrieves settings for the MDM Settings Catalog policy with ID "12345" using the v1.0 API version.
    .EXAMPLE
        Get-EmMdmSettingsCatalogSettingsAPI -policyId "12345"
        This example retrieves settings for the MDM Settings Catalog policy with ID "12345" using the default beta API version.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Get-EmMdmSettingsCatalogSettingsAPI {
    #[Alias("Get-SettingsCatalogPolicySettings")]
    [cmdletBinding()]
    [OutputType([EmConfigurationPolicySettingDefinitionsExpanded[]])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        $policyId,
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process{
        $Resource = "deviceManagement/configurationPolicies('$policyId')/settings?`$expand=settingDefinitions"
        try {
            $uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
            $Response = (Invoke-MgGraphRequest -Uri $uri -Method Get)
            $AllResponses = $Response.value | ForEach-Object { [EmConfigurationPolicySettingDefinitionsExpanded]::new($_) }
            $ResponseNextLink = $Response."@odata.nextLink"
            while ($null -ne $ResponseNextLink) {
                $Response = (Invoke-MgGraphRequest -Uri $ResponseNextLink -Method Get)
                $ResponseNextLink = $Response."@odata.nextLink"
                $AllResponses += $Response.value | ForEach-Object { [EmConfigurationPolicySettingDefinitionsExpanded]::new($_) }
            }
            return $AllResponses
        }
        catch {
            throw $_
        }
    }
}