<#
    .SYNOPSIS
        Adds a new Endpoint Security Policy using the provided JSON and Template ID.
    .DESCRIPTION
        This function creates a new instance of an Endpoint Security Policy in Microsoft Intune using the provided JSON configuration and Template ID.
    .PARAMETER TemplateId
        The ID of the template to use for creating the Endpoint Security Policy.
    .PARAMETER JSON
        The JSON string representing the Endpoint Security Policy configuration.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta".
    .OUTPUTS
        None
    .EXAMPLE
        Add-EmMdmEndpointSecurity -TemplateId "template-id" -JSON $jsonString
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Add-EmMdmEndpointSecurity {
    #[Alias("Add-EmDeviceEndpointSecurityPolicy")]
    [cmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$TemplateId,
        [Parameter(Mandatory = $true)]
        [string]$JSON,
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $ESP_resource = "deviceManagement/templates/$TemplateId/createInstance"
        Write-Verbose "Resource: $ESP_resource"
        try {
                #$JSON = $JSON | ConvertTo-Json -Depth 10
                $uri = "https://graph.microsoft.com/$graphApiVersion/$($ESP_resource)"
                return Invoke-MgGraphRequest -Uri $uri -Method POST -Body $JSON -ContentType "application/json"
                Write-Verbose "Endpoint Security Policy added successfully." -Verbose
        } catch {
            throw "An error occurred while adding the Endpoint Security Policy: `n$_"
        }
    }
}
