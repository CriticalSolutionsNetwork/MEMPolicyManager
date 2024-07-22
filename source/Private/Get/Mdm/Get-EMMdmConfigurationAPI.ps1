<#
    .SYNOPSIS
        Retrieves MDM Configuration policies from Microsoft Graph API.
    .DESCRIPTION
        The Get-EMMdmConfigurationAPI cmdlet sends a GET request to the Microsoft Graph API to retrieve MDM Configuration policies. The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and allows filtering by configuration type.
    .PARAMETER odataType
        The OData type for the configuration policies to retrieve. Valid values are "windows81", "macOSExtensions", "macOSCustom", "macOSDeviceFeatures", "macOSGeneral", "macOSSoftwareUpdate", "macOSEndpointProtection", "androidWorkProfileGeneral", "androidWorkProfileVpn", "windowsHealthMonitoring", "windows81SCEP", "windows10Custom", "windows10EndpointProtection", "windows10General", "softwareUpdates", and "all". The default value is "all".
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        System.Object[] Returns an array of MDM Configuration policy objects.
    .EXAMPLE
        Get-EMMdmConfigurationAPI -odataType "windows10General" -graphApiVersion "v1.0"
        This example retrieves Windows 10 General Configuration policies using the v1.0 API version.
    .EXAMPLE
        Get-EMMdmConfigurationAPI
        This example retrieves all MDM Configuration policies using the default beta API version.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>

function Get-EMMdmConfigurationAPI {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $false,
            Position = 0
        )]
        [ValidateSet(
            "windows81",
            "macOSExtensions",
            "macOSCustom",
            "macOSDeviceFeatures",
            "macOSGeneral",
            "macOSSoftwareUpdate",
            "macOSEndpointProtection",
            "androidWorkProfileGeneral",
            "androidWorkProfileVpn",
            "windowsHealthMonitoring",
            "windows81SCEP",
            "windows10Custom",
            "windows10EndpointProtection",
            "windows10General",
            "softwareUpdates",
            "all"
        )]
        [string]$odataType = "all",
        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $DCP_resource = "deviceManagement/deviceConfigurations"
        $excludeTypes = @(
            "microsoft.graph.iosUpdateConfiguration",
            "microsoft.graph.windowsUpdateForBusinessConfiguration",
            "microsoft.graph.windowsDefenderAdvancedThreatProtectionConfiguration"
        )

        $includeTypes = @{
            "windows81"                   = "microsoft.graph.windows81TrustedRootCertificate"
            "macOSExtensions"             = "microsoft.graph.macOSExtensionsConfiguration"
            "macOSCustom"                 = "microsoft.graph.macOSCustomConfiguration"
            "macOSDeviceFeatures"         = "microsoft.graph.macOSDeviceFeaturesConfiguration"
            "macOSGeneral"                = "microsoft.graph.macOSGeneralDeviceConfiguration"
            "macOSSoftwareUpdate"         = "microsoft.graph.macOSSoftwareUpdateConfiguration"
            "macOSEndpointProtection"     = "microsoft.graph.macOSEndpointProtectionConfiguration"
            "androidWorkProfileGeneral"   = "microsoft.graph.androidWorkProfileGeneralDeviceConfiguration"
            "androidWorkProfileVpn"       = "microsoft.graph.androidWorkProfileVpnConfiguration"
            "windowsHealthMonitoring"     = "microsoft.graph.windowsHealthMonitoringConfiguration"
            "windows81SCEP"               = "microsoft.graph.windows81SCEPCertificateProfile"
            "windows10Custom"             = "microsoft.graph.windows10CustomConfiguration"
            "windows10EndpointProtection" = "microsoft.graph.windows10EndpointProtectionConfiguration"
            "windows10General"            = "microsoft.graph.windows10GeneralConfiguration"
        }
        $softwareUpdates = @(
            "microsoft.graph.iosUpdateConfiguration",
            "microsoft.graph.windowsUpdateForBusinessConfiguration"
        )
        switch ($odataType) {
            "all" {
                $filterParts = $excludeTypes | ForEach-Object { "not isof('$_')" }
                $filter = "?`$filter=" + ($filterParts -join " and ")
            }
            "softwareUpdates" {
                $filterParts = $softwareUpdates | ForEach-Object { "isof('$_')" }
                $filter = "?`$filter=" + ($filterParts -join " or ")
            }
            Default {
                $filterParts = @("isof('$($includeTypes[$odataType])')")
                $filter = "?`$filter=" + ($filterParts -join " and ")
            }
        }
        $Resource = "$($DCP_resource)$filter"
        try {
            $uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
            $objects = (Invoke-MgGraphRequest -Uri $uri -Method Get).Value
            $createdObjects = @()
            # Cast each object to the appropriate class
            foreach ($object in $objects) {
                $type = $object."@odata.type"
                $newObject = switch ($type) {
                    "#microsoft.graph.windows81TrustedRootCertificate" { [GetEmWindows81TrustedRootCertificate]::new($object) }
                    "#microsoft.graph.macOSExtensionsConfiguration" { [GetEmMacOSExtensionsConfiguration]::new($object) }
                    "#microsoft.graph.macOSCustomConfiguration" { [GetEmMacOSCustomConfiguration]::new($object) }
                    "#microsoft.graph.macOSDeviceFeaturesConfiguration" { [GetEmMacOSDeviceFeaturesConfiguration]::new($object) }
                    "#microsoft.graph.macOSGeneralDeviceConfiguration" { [GetEmMacOSGeneralDeviceConfiguration]::new($object) }
                    "#microsoft.graph.macOSSoftwareUpdateConfiguration" { [GetEmMacOSSoftwareUpdateConfiguration]::new($object) }
                    "#microsoft.graph.macOSEndpointProtectionConfiguration" { [GetEmMacOSEndpointProtectionConfiguration]::new($object) }
                    "#microsoft.graph.androidWorkProfileGeneralDeviceConfiguration" { [GetEmAndroidWorkProfileGeneralDeviceConfiguration]::new($object) }
                    "#microsoft.graph.androidWorkProfileVpnConfiguration" { [GetEmAndroidWorkProfileVpnConfiguration]::new($object) }
                    "#microsoft.graph.windowsHealthMonitoringConfiguration" { [GetEmWindowsHealthMonitoringConfiguration]::new($object) }
                    "#microsoft.graph.windows81SCEPCertificateProfile" { [GetEmWindows81SCEPCertificateProfile]::new($object) }
                    "#microsoft.graph.windows10CustomConfiguration" { [GetEmWindows10CustomConfiguration]::new($object) }
                    "#microsoft.graph.windows10EndpointProtectionConfiguration" { [GetEmWindows10EndpointProtectionConfiguration]::new($object) }
                    "#microsoft.graph.windows10GeneralConfiguration" { [GetEmWindows10GeneralConfiguration]::new($object) }
                    "#microsoft.graph.iosUpdateConfiguration" { [GetEmIosUpdateConfiguration]::new($object) }
                    "#microsoft.graph.windowsUpdateForBusinessConfiguration" { [GetEmWindowsUpdateForBusinessConfiguration]::new($object) }
                    default { $object }  # If the type is not recognized, return the object as-is
                }
                $createdObjects += $newObject
            }
            return $createdObjects
        }
        catch {
            throw $_
        }
    }
}