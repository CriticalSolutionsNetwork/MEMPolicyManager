<#
    .SYNOPSIS
        Retrieves all Endpoint Security templates from Microsoft Graph.
    .DESCRIPTION
        This function connects to Microsoft Graph API and retrieves all Endpoint Security templates
        available in Endpoint Manager. This is a private function and is not exported by the module.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        PSCustomObject[] Returns an array of Endpoint Security template objects.
    .EXAMPLE
        $templates = Get-EmEndpointSecurityTemplate
        Write-Output $templates
    .NOTES
        This function is intended for internal use within the module.
#>
function Get-EmEndpointSecurityTemplate {
    #[Alias("Get-EmDeviceEndpointSecurityTemplate")]
    [cmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $ESP_resource = "deviceManagement/templates?\`$filter=(isof('microsoft.graph.securityBaselineTemplate'))"
        try {
            $uri = "https://graph.microsoft.com/$graphApiVersion/$($ESP_resource)"
            return (Invoke-MgGraphRequest -Method GET -Uri $uri).Value | ForEach-Object {$_ | ForEach-Object { New-Object -TypeName EmDMTemplate -ArgumentList $_ }}
        }
        catch {
            throw $_
        }
    }
}
