<#
    .SYNOPSIS
        Adds an MDM App Configuration to Microsoft Graph API.
    .DESCRIPTION
        This function sends a POST request to the Microsoft Graph API to add a new MDM App Configuration.
        The JSON configuration object is converted to JSON format and sent to the specified API endpoint.
    .PARAMETER JSON
        The JSON object representing the MDM App Configuration to be added.
        This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use.
        It can be either "beta" or "v1.0".
        The default value is "beta".
    .OUTPUTS
        System.Object
        The response object from the Microsoft Graph API.
    .EXAMPLE
        $jsonConfig = @{
            "@odata.type" = "#microsoft.graph.androidManagedAppProtection"
            displayName = "App Protection Policy"
            description = "A sample app protection policy"
            ...
        }
        Add-EmMdmAppConfiguration -JSON $jsonConfig -graphApiVersion "v1.0"

        This example adds a new MDM App Configuration using the provided JSON configuration object and the v1.0 API version.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Add-EmMdmAppConfiguration {
    [cmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [object]$JSON,
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $JSON = $JSON | ConvertTo-Json -Depth 10
        $Resource = "deviceAppManagement/managedAppPolicies"
        $uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
        try {
            $response = Invoke-MgGraphRequest -Uri $uri -Method Post -Body $JSON -ContentType "application/json"
            Write-Verbose "Configuration Policy added successfully." -Verbose
            return $response
        } catch {
            throw "An error occurred while adding the Compliance Policy: `n$_"
        }
    }
}