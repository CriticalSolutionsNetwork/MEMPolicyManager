<#
    .SYNOPSIS
        Adds an MDM Compliance policy to Microsoft Graph API.
    .DESCRIPTION
        The Add-EmMdmCompliance cmdlet sends a POST request to the Microsoft Graph API to add a new MDM Compliance policy. The JSON string representing the policy is sent to the specified API endpoint.
    .PARAMETER JSON
        The JSON string representing the MDM Compliance policy to be added. This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        System.Object The response object from the Microsoft Graph API.
    .EXAMPLE
        $jsonPolicy = '{
            "@odata.type": "#microsoft.graph.deviceCompliancePolicy",
            "displayName": "Compliance Policy",
            "description": "A sample compliance policy",
            ...
        }'
        Add-EmMdmCompliance -JSON $jsonPolicy -graphApiVersion "v1.0"
        This example adds a new MDM Compliance policy using the provided JSON string and the v1.0 API version.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Add-EmMdmCompliance {
    #[Alias("Add-EmDeviceCompliancePolicy")]
    [cmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$JSON,
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $Resource = "deviceManagement/deviceCompliancePolicies"
        $uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
        try {
            $response = Invoke-MgGraphRequest -Uri $uri -Method Post -Body $JSON -ContentType "application/json"
            Write-Verbose "Compliance Policy added successfully." -Verbose
            return $response
        } catch {
            throw "An error occurred while adding the Compliance Policy: `n$_"
        }
    }
}
