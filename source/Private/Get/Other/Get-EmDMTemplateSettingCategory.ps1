<#
    .SYNOPSIS
        Retrieves all categories for a specified Endpoint Security template from Microsoft Graph.
    .DESCRIPTION
        This function connects to Microsoft Graph API and retrieves all categories for a specified Endpoint Security template
        available in Endpoint Manager. This is a private function and is not exported by the module.
    .EXAMPLE
        $categories = Get-EmDMTemplateSettingCategory -TemplateId 'template1'
        Write-Output $categories
    .PARAMETER TemplateId
        The ID of the Endpoint Security template for which to retrieve categories.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        PSCustomObject[] Returns an array of Endpoint Security template category objects.
    .NOTES
        This function is intended for internal use within the module.
#>
function Get-EmDMTemplateSettingCategory {
    #[Alias("Get-EmDeviceManagementTemplateSettingCategory")]
    [cmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$TemplateId,
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $ESP_resource = "deviceManagement/templates/$TemplateId/categories"
        try {
            $uri = "https://graph.microsoft.com/$graphApiVersion/$($ESP_resource)"
            return (Invoke-MgGraphRequest -Method GET -Uri $uri).Value | ForEach-Object { [EmDMTemplateSettingCategory]::new($_) }
        } catch {
            throw $_
        }
    }
}
