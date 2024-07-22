<#
    .SYNOPSIS
        Imports Intune Software Update policies from a specified JSON file.
    .DESCRIPTION
        The Import-EmMdmSoftwareUpdate cmdlet connects to Microsoft Graph, reads an Intune Software Update policy from a specified JSON file, and creates the policy in Intune.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.
    .PARAMETER ImportPath
        The file path to the JSON file containing the Software Update policy to import. This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0".
        The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        [string] The cmdlet accepts a file path as input.
    .OUTPUTS
        [string] The ID of the created policy.
    .EXAMPLE
        PS> Import-EmMdmSoftwareUpdate -ImportPath "C:\Backup\SoftwareUpdates\Policy.json"
        This example connects to Microsoft Graph, reads the Software Update policy from the specified JSON file, and creates the policy in Intune.
    .NOTES
        The cmdlet uses the following functions:
        - Connect-EmMdmGraph
        - Add-EmMdmConfiguration
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmSoftwareUpdate
#>
function Import-EmMdmSoftwareUpdate {
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
            if ($isConnected -and $PScmdlet.ShouldProcess("Importing Software Update Policy '$DisplayName'", "Add-EmMdmConfiguration")) {
                $ImportPath = $ImportPath.replace('"', '')
                $JSON_Data = Get-Content -Path "$ImportPath"
                $backupConfig = $JSON_Data | ConvertFrom-Json -AsHashtable -NoEnumerate #| Select-Object -Property * -ExcludeProperty id,lastModifiedDateTime,roleScopeTagIds,supportsScopeTags,deviceManagementApplicabilityRuleOsEdition,deviceManagementApplicabilityRuleOsVersion,deviceManagementApplicabilityRuleDeviceMode,createdDateTime
                $DisplayName = $backupConfig.displayName
                $JSON_Type = $backupConfig."@odata.type"
                $Configuration = switch ($JSON_Type) {
                    "#microsoft.graph.iosUpdateConfiguration" { [CreateEmIosUpdateConfiguration]::new($backupConfig) }
                    "#microsoft.graph.windowsUpdateForBusinessConfiguration" { [CreateEmWindowsUpdateForBusinessConfiguration]::new($backupConfig) }
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
        Write-Verbose "Import-EmMdmSoftwareUpdate completed." -Verbose
    }
}