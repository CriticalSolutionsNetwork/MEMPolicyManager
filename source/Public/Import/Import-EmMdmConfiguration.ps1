<#
    .SYNOPSIS
        Imports Intune Device Configuration policies from a specified JSON file.
    .DESCRIPTION
        The Import-EmMdmConfiguration cmdlet connects to Microsoft Graph, reads an Intune Device Configuration policy from a specified JSON file, and creates the policy in Intune.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.
    .PARAMETER ImportPath
        The file path to the JSON file containing the Device Configuration policy to import. This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0".
        The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        [string] The cmdlet accepts a file path as input.
    .OUTPUTS
        [string] The cmdlet outputs the result of the created policy.
    .EXAMPLE
        PS> Import-EmMdmConfiguration -ImportPath "C:\Backup\DeviceConfigurations\Policy.json"
        This example connects to Microsoft Graph, reads the Device Configuration policy from the specified JSON file, and creates the policy in Intune.
    .NOTES
        The cmdlet uses the following functions:
        - Connect-EmMdmGraph
        - Add-EmMdmConfiguration
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmConfiguration
#>
function Import-EmMdmConfiguration {
    [cmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'High'
    )]
    [OutputType([string])]
    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Specify the path to the JSON file containing the app configuration to import."
        )]
        [ValidateScript({ Test-Path $_ -PathType Leaf })]
        [String]$ImportPath,
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The authentication object used for connecting to Microsoft Graph."
        )]
        [EmMdmAuthBase]$AuthObject,
        [Parameter(
            DontShow = $true,
            Mandatory = $false,
            HelpMessage = "The version of the Microsoft Graph API to use. Valid values are 'beta' and 'v1.0'. The default value is 'beta'."
        )]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    begin {
        try {
            if ($PScmdlet.ShouldProcess("Connecting to MgGraph with scopes DeviceManagementConfiguration.ReadWrite.All", "Connect-MgGraph")) {
                $isConnected = Connect-EmMdmGraph -Scopes "DeviceManagementConfiguration.ReadWrite.All" -AuthObject $AuthObject
            }
        }
        catch {
            throw $_
        }
    }
    process {
        try {
            if ($isConnected -and $PScmdlet.ShouldProcess("Importing Device Configuration Policy '$DisplayName'", "Add-EmMdmConfiguration")) {
                $ImportPath = $ImportPath.replace('"', '')
                $JSON_Data = Get-Content -Path "$ImportPath"
                $backupConfig = $JSON_Data | ConvertFrom-Json -AsHashtable -NoEnumerate #| Select-Object -Property * -ExcludeProperty id,lastModifiedDateTime,roleScopeTagIds,supportsScopeTags,deviceManagementApplicabilityRuleOsEdition,deviceManagementApplicabilityRuleOsVersion,deviceManagementApplicabilityRuleDeviceMode,createdDateTime
                $DisplayName = $backupConfig.displayName
                $JSON_Type = $backupConfig."@odata.type"
                $Configuration = switch ($JSON_Type) {
                    "#microsoft.graph.windows81TrustedRootCertificate" { [CreateEmWindows81TrustedRootCertificate]::new($backupConfig) }
                    "#microsoft.graph.macOSExtensionsConfiguration" { [CreateEmMacOSExtensionsConfiguration]::new($backupConfig) }
                    "#microsoft.graph.macOSCustomConfiguration" { [CreateEmMacOSCustomConfiguration]::new($backupConfig) }
                    "#microsoft.graph.macOSDeviceFeaturesConfiguration" { [CreateEmMacOSDeviceFeaturesConfiguration]::new($backupConfig) }
                    "#microsoft.graph.macOSGeneralDeviceConfiguration" { [CreateEmMacOSGeneralDeviceConfiguration]::new($backupConfig) }
                    "#microsoft.graph.macOSSoftwareUpdateConfiguration" { [CreateEmMacOSSoftwareUpdateConfiguration]::new($backupConfig) }
                    "#microsoft.graph.macOSEndpointProtectionConfiguration" { [CreateEmMacOSEndpointProtectionConfiguration]::new($backupConfig) }
                    "#microsoft.graph.androidWorkProfileGeneralDeviceConfiguration" { [CreateEmAndroidWorkProfileGeneralDeviceConfiguration]::new($backupConfig) }
                    "#microsoft.graph.androidWorkProfileVpnConfiguration" { [CreateEmAndroidWorkProfileVpnConfiguration]::new($backupConfig) }
                    "#microsoft.graph.windowsHealthMonitoringConfiguration" { [CreateEmWindowsHealthMonitoringConfiguration]::new($backupConfig) }
                    "#microsoft.graph.windows81SCEPCertificateProfile" { [CreateEmWindows81SCEPCertificateProfile]::new($backupConfig) }
                    "#microsoft.graph.windows10CustomConfiguration" { [CreateEmWindows10CustomConfiguration]::new($backupConfig) }
                    "#microsoft.graph.windows10EndpointProtectionConfiguration" { [CreateEmWindows10EndpointProtectionConfiguration]::new($backupConfig) }
                    "#microsoft.graph.windows10GeneralConfiguration" { [CreateEmWindows10GeneralConfiguration]::new($backupConfig) }
                    default { $backupConfig }  # If the type is not recognized, return the object as-is
                }
                $CreateResult = Add-EmMdmConfiguration -Configuration $Configuration -graphApiVersion $graphApiVersion
                Write-Verbose "Policy '$DisplayName' created with id" $CreateResult.id -Verbose
            }
        }
        catch {
            throw $_
        }
        finally {
            if ($isConnected) {
                Write-Verbose "Disconnecting from MgGraph..." -Verbose
                Disconnect-MgGraph | Out-Null
            }
        }
    }
    end {
        Write-Verbose "Import-EmMdmConfiguration completed." -Verbose
    }
}