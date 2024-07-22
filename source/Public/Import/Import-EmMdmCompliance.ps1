<#
    .SYNOPSIS
        Imports Intune Compliance policies from a specified JSON file.
    .DESCRIPTION
        The Import-EmMdmCompliance cmdlet connects to Microsoft Graph, reads an Intune Compliance policy from a specified JSON file, and creates the policy in Intune.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.
    .PARAMETER ImportPath
        The file path to the JSON file containing the Compliance policy to import. This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0".
        The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        [string] The cmdlet accepts a file path as input.
    .OUTPUTS
        [pscustomobject] The cmdlet outputs the result of the created policy.
    .EXAMPLE
        PS> Import-EmMdmCompliance -ImportPath "C:\Backup\CompliancePolicies\Policy.json"
        This example connects to Microsoft Graph, reads the Compliance policy from the specified JSON file, and creates the policy in Intune.
    .NOTES
        The cmdlet uses the following functions:
        - Connect-EmMdmGraph
        - Add-EmMdmCompliance
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmCompliance
#>

function Import-EmMdmCompliance {
    [cmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'High'
    )]
    [OutputType([pscustomobject])]
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
            if ($isConnected -and $PScmdlet.ShouldProcess("Importing Compliance Policy '$DisplayName'", "Add-EmMdmCompliance")) {
                $ImportPath = $ImportPath.replace('"', '')
                $Import = Get-Content $ImportPath
                $id = "00000000-0000-0000-0000-000000000000"
                $JSON_Data = $import | ConvertFrom-Json -AsHashtable -NoEnumerate
                # Excluding entries that are not required - id,createdDateTime,lastModifiedDateTime,version
                $basicJson = $JSON_Data | Select-Object -Property * -ExcludeProperty createdDateTime, id, lastModifiedDateTime, version, restrictedApps
                $DisplayName = $basicJson.DisplayName
                if (-not (($basicJson).scheduledActionsForRule)) {
                    $scheduledActionsForRule = @(
                        @{
                            ruleName                      = "PasswordRequired"
                            scheduledActionConfigurations = @(
                                @{
                                    actionType             = "block"
                                    gracePeriodHours       = 0
                                    notificationTemplateId = ""
                                }
                            )
                        }
                    )
                    $basicJson | Add-Member -NotePropertyName scheduledActionsForRule -NotePropertyValue $scheduledActionsForRule -Force
                }
                $basicJson | Add-Member -NotePropertyName id -NotePropertyValue $id -Force
                $CreateResult = Add-EmMdmCompliance -JSON ($basicJson | ConvertTo-Json -Depth 10) -graphApiVersion $graphApiVersion
                Write-Verbose "PolicyType: '$($basicJson."@odata.type")'; API Version: '$graphApiVersion'; DisplayName: '$($basicJson.DisplayName)'; id: $($CreateResult.id)" -Verbose
                return $CreateResult
            }
        }
        catch {
            throw "An error occurred while importing the Compliance Policy: `n$_"
        }
        finally {
            if ($isConnected) {
                Write-Verbose "Disconnecting from MgGraph..." -Verbose
                Disconnect-MgGraph | Out-Null
            }
        }
    }
    end {
        Write-Verbose "Import-EmMdmCompliance completed." -Verbose
    }
}