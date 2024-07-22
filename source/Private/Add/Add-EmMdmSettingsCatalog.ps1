<#
    .SYNOPSIS
        Adds an MDM Settings Catalog policy to Microsoft Graph API.
    .DESCRIPTION
        The Add-EmMdmSettingsCatalog cmdlet sends a POST request to the Microsoft Graph API to add a new MDM Settings Catalog policy. The policy object is converted to JSON format and sent to the specified API endpoint. The cmdlet also validates the JSON format before sending the request.
    .PARAMETER PolicyObject
        The policy object representing the MDM Settings Catalog policy to be added. This parameter is mandatory and must be of type [EmConfigurationPolicyExport].
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        System.Object The response object from the Microsoft Graph API.
    .EXAMPLE
        $policyObject = New-EmConfigurationPolicyExport -Name "Settings Catalog Policy" -Description "A sample settings catalog policy" -Settings @{}
        Add-EmMdmSettingsCatalog -PolicyObject $policyObject -graphApiVersion "v1.0"
        This example adds a new MDM Settings Catalog policy using the provided policy object and the v1.0 API version.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Add-EmMdmSettingsCatalog {
    #[Alias("Add-SettingsCatalogPolicy")]
    [cmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [EmConfigurationPolicyExport]$PolicyObject,
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    $Resource = "deviceManagement/configurationPolicies"
    # Convert the policy object to JSON
    $JSON = $PolicyObject | ConvertTo-Json -Depth 20
    # Validate the JSON format
    if (-not (Test-IntuneJSON -JSON $JSON)) {
        Write-Verbose "Invalid JSON format. Exiting..." -Verbose
        return
    }
    $uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
    try {
        $response = Invoke-MgGraphRequest -Uri $uri -Method Post -Body $JSON -ContentType "application/json"
        Write-Verbose "Settings Catalog Policy added successfully." -Verbose
        return $response
    } catch {
        throw $_
    }
}
