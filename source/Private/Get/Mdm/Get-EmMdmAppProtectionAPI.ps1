<#
    .SYNOPSIS
        Retrieves MDM App Protection policies from Microsoft Graph API.
    .DESCRIPTION
        The Get-EmMdmAppProtectionAPI cmdlet sends a GET request to the Microsoft Graph API to retrieve MDM App Protection policies. The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and returns the policies of various types excluding 'targetedManagedAppConfiguration'.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        System.Object[] Returns an array of MDM App Protection policy objects.
    .EXAMPLE
        Get-EmMdmAppProtectionAPI -graphApiVersion "v1.0"
        This example retrieves MDM App Protection policies using the v1.0 API version.
    .EXAMPLE
        Get-EmMdmAppProtectionAPI
        This example retrieves MDM App Protection policies using the default beta API version.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Get-EmMdmAppProtectionAPI {
    [cmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        <#
            #microsoft.graph.iosManagedAppProtection
            #microsoft.graph.targetedManagedAppConfiguration
            #microsoft.graph.androidManagedAppProtection
            #microsoft.graph.mdmWindowsInformationProtectionPolicy
        #>
        $Resource = "deviceAppManagement/managedAppPolicies"
        $uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
        try {
            $response = Invoke-MgGraphRequest -Uri $uri -Method GET
            $objects = $response.value | Where-Object {$_."@odata.type" -ne "#microsoft.graph.targetedManagedAppConfiguration"}
            $createdObjects = @()
            # Cast each object to the appropriate class
            foreach ($object in $objects) {
                $type = $object."@odata.type"
                $newObject = switch ($type) {
                    "#microsoft.graph.androidManagedAppProtection" { [GetEmMdmAndroidManagedAppProtection]::new($object) }
                    "#microsoft.graph.iosManagedAppProtection" { [GetEmMdmIosManagedAppProtection]::new($object) }
                    "#microsoft.graph.mdmWindowsInformationProtectionPolicy" { [GetEmMdmMdmWindowsInformationProtectionPolicy]::new($object) }
                    "#microsoft.graph.windowsManagedAppProtection" { [GetEmMdmWindowsManagedAppProtection]::new($object) }
                    default { $object }  # If the type is not recognized, return the object as-is
                }
                $createdObjects += $newObject
            }
            return $createdObjects
            Write-Verbose "App Protection Policies retrieved successfully." -Verbose
            return $objects
        }
        catch {
            throw "An error occurred while getting the Compliance policies: `n$_"
        }
    }
}