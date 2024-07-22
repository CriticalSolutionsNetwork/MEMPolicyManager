<#
    .SYNOPSIS
        Retrieves MDM Compliance policies from Microsoft Graph API.
    .DESCRIPTION
        The Get-EmMdmComplianceAPI cmdlet sends a GET request to the Microsoft Graph API to retrieve MDM Compliance policies. The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and allows filtering by operating system.
    .PARAMETER OperatingSystem
        The operating system for which to retrieve compliance policies. Valid values are "android", "iOS", "Win10", "macos", and "all". The default value is "all".
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. It can be either "beta" or "v1.0". The default value is "beta".
    .OUTPUTS
        System.Object[] Returns an array of MDM Compliance policy objects.
    .EXAMPLE
        Get-EmMdmComplianceAPI -OperatingSystem "iOS" -graphApiVersion "v1.0"
        This example retrieves iOS MDM Compliance policies using the v1.0 API version.
    .EXAMPLE
        Get-EmMdmComplianceAPI
        This example retrieves MDM Compliance policies for all operating systems using the default beta API version.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>

function Get-EmMdmComplianceAPI {
    [cmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet("android", "iOS", "Win10", "macos", "all")]
        [string]$OperatingSystem = "all",

        [Parameter(Mandatory = $false)]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $androidCompliancePolicies = @(
            "microsoft.graph.androidCompliancePolicy",
            "microsoft.graph.androidDeviceOwnerCompliancePolicy",
            "microsoft.graph.androidWorkProfileCompliancePolicy",
            "microsoft.graph.androidForWorkCompliancePolicy",
            "microsoft.graph.aospDeviceOwnerCompliancePolicy"
        )
        $Resource = "deviceManagement/deviceCompliancePolicies"
        $Uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
        $iosFilter = "?`$filter=isof('microsoft.graph.iosCompliancePolicy')"
        $win10Filter = "?`$filter=isof('microsoft.graph.windows10CompliancePolicy')"
        $macosFilter = "?`$filter=isof('microsoft.graph.macOSCompliancePolicy')"
        $filterUri = switch ($OperatingSystem) {
            'android' {
                $filterParts = $androidCompliancePolicies | ForEach-Object { "isof('$_')" }
                $androidFilter = "?`$filter=" + ($filterParts -join " or ")
                $Uri + $androidFilter
            }
            'iOS' { $Uri + $iosFilter }
            'Win10' { $Uri + $win10Filter }
            'macos' { $Uri + $macosFilter }
            'all' { $Uri }
        }
        try {
            $response = Invoke-MgGraphRequest -Uri $filterUri -Method GET
            Write-Verbose "Compliance Policies retrieved successfully."
            $typeApi = switch ($graphApiVersion) {
                'v1.0' { "v1" }
                Default { "Beta" }
            }
            $typedResponse = switch ($OperatingSystem) {
                'android' {
                    foreach ($policy in $response.Value) {
                        switch ($_."@odata.type") {
                            "#microsoft.graph.androidCompliancePolicy" { New-Object -TypeName "GetEmMdmAndroidCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            "#microsoft.graph.androidDeviceOwnerCompliancePolicy" { New-Object -TypeName "GetEmMdmAndroidDeviceOwnerCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            "#microsoft.graph.androidWorkProfileCompliancePolicy" { New-Object -TypeName "GetEmMdmAndroidWorkProfileCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            "#microsoft.graph.androidForWorkCompliancePolicy" { New-Object -TypeName "GetEmMdmAndroidForWorkCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            "#microsoft.graph.aospDeviceOwnerCompliancePolicy" { New-Object -TypeName "GetEmMdmAospDeviceOwnerCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            Default { $policy }
                        }
                    }
                }
                'iOS' { $response.Value | ForEach-Object { New-Object -TypeName "GetEmMdmCompliancePolicyiOS$($typeApi)" -ArgumentList $_ } }
                'Win10' { $response.Value | ForEach-Object { New-Object -TypeName "GetEmMdmCompliancePolicyWindows10$($typeApi)" -ArgumentList $_ } }
                'macos' { $response.Value | ForEach-Object { New-Object -TypeName "GetEmMdmCompliancePolicymacOS$($typeApi)" -ArgumentList $_ } }
                'all' {
                    # Get Android Policies
                    $android = $response.Value | Where-Object { $_."@odata.type" -like "#microsoft.graph.android*" -or $_."@odata.type" -like "#microsoft.graph.aosp*"}
                    $androidPolicies = foreach ($policy in $android) {
                        switch ($_."@odata.type") {
                            "#microsoft.graph.androidCompliancePolicy" { New-Object -TypeName "GetEmMdmAndroidCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            "#microsoft.graph.androidDeviceOwnerCompliancePolicy" { New-Object -TypeName "GetEmMdmAndroidDeviceOwnerCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            "#microsoft.graph.androidWorkProfileCompliancePolicy" { New-Object -TypeName "GetEmMdmAndroidWorkProfileCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            "#microsoft.graph.androidForWorkCompliancePolicy" { New-Object -TypeName "GetEmMdmAndroidForWorkCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            "#microsoft.graph.aospDeviceOwnerCompliancePolicy" { New-Object -TypeName "GetEmMdmAospDeviceOwnerCompliancePolicy$($typeApi)" -ArgumentList $policy }
                            Default { $policy }
                        }
                    }
                    # Get iOS Policies
                    $iosPolicies = $response.Value | Where-Object { $_."@odata.type" -eq "#microsoft.graph.iosCompliancePolicy" } | `
                        ForEach-Object { New-Object -TypeName "GetEmMdmCompliancePolicyiOS$($typeApi)" -ArgumentList $_ }
                    # Get Win10 Policies
                    $win10Policies = $response.Value | Where-Object { $_."@odata.type" -eq "#microsoft.graph.windows10CompliancePolicy" } | `
                        ForEach-Object { New-Object -TypeName "GetEmMdmCompliancePolicyWindows10$($typeApi)" -ArgumentList $_ }
                    # Get macOS Policies
                    $macosPolicies = $response.Value | Where-Object { $_."@odata.type" -eq "#microsoft.graph.macOSCompliancePolicy" } | `
                        ForEach-Object { New-Object -TypeName "GetEmMdmCompliancePolicymacOS$($typeApi)" -ArgumentList $_ }
                    # Add all policies to the response
                    $androidPolicies + $iosPolicies + $win10Policies + $macosPolicies
                }
            }
            return $typedResponse
        }
        catch {
            throw "An error occurred while getting the Compliance policies: `n$_"
        }
    }
}
