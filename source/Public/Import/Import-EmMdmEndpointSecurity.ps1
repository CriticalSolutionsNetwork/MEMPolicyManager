<#
    .SYNOPSIS
        Imports Intune Endpoint Security policies from a specified JSON file.
    .DESCRIPTION
        The Import-EmMdmEndpointSecurity cmdlet connects to Microsoft Graph, reads an Intune Endpoint Security policy from a specified JSON file, and creates the policy in Intune.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.
    .PARAMETER ImportPath
        The file path to the JSON file containing the Endpoint Security policy to import. This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0".
        The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        [string] The cmdlet accepts a file path as input.
    .OUTPUTS
        [PSCustomObject] The cmdlet outputs the result of the created policy.
    .EXAMPLE
        PS> Import-EmMdmEndpointSecurity -ImportPath "C:\Backup\EndpointSecurity\Policy.json"
        This example connects to Microsoft Graph, reads the Endpoint Security policy from the specified JSON file, and creates the policy in Intune.
    .NOTES
        The cmdlet uses the following functions:
        - Connect-EmMdmGraph
        - Add-EmMdmEndpointSecurity
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmEndpointSecurity
#>
function Import-EmMdmEndpointSecurity {
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'High'
    )]
    [OutputType([PSCustomObject])]
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
            if ($PSCmdlet.ShouldProcess("Connecting to Microsoft Graph API with permissions: DeviceManagementConfiguration.ReadWrite.All, DeviceManagementManagedDevices.ReadWrite.All", "Connect-MgGraph")) {
                $isConnected = Connect-EmMdmGraph -Scopes "DeviceManagementConfiguration.ReadWrite.All", "DeviceManagementManagedDevices.ReadWrite.All" -AuthObject $AuthObject
            }
        }
        catch {
            throw $_
        }
    }
    process {
        try {
            if ($isConnected -and $PScmdlet.ShouldProcess("Getting Endpoint Security Policy from Microsoft Graph API", "Invoke-MgGraphRequest")) {
                # Get all Endpoint Security Templates
                $Templates = Get-EmDeviceEndpointSecurityTemplate -graphApiVersion $graphApiVersion
                $ImportPath = $ImportPath.replace('"', '')
                # Getting content of JSON Import file
                $JSON_Data = Get-Content -Path "$ImportPath" -Raw
                # Converting input to JSON format
                $jsonObject = $JSON_Data | ConvertFrom-Json
                $JSON_TemplateId = $jsonObject.templateId
                $JSON_Convert = [EmDMIntentInstance]::new($jsonObject)
                # Pulling out variables to use in the import
                $JSON_DN = $jsonObject.displayName
                $JSON_TemplateDisplayName = $jsonObject.TemplateDisplayName
                $DisplayName = $jsonObject.displayName
                Write-Information "`n" -InformationAction Continue
                Write-Verbose "Endpoint Security Policy '$JSON_DN' found..." -Verbose
                Write-Information "Template Display Name: $JSON_TemplateDisplayName" -InformationAction Continue
                Write-Information "Template ID: $JSON_TemplateId" -InformationAction Continue
                # Checking if templateId from JSON is a valid templateId
                $ES_Template = $Templates | Where-Object { $_.id -eq $JSON_TemplateId }
                # If template is a baseline Edge, MDATP or Windows, use templateId specified
                if ($ES_Template.templateType -eq "microsoftEdgeSecurityBaseline" -or $ES_Template.templateType -eq "securityBaseline" -or $ES_Template.templateType -eq "advancedThreatProtectionSecurityBaseline") {
                    $TemplateId = $JSON_TemplateId
                }
                # Else If not a baseline, check if template is deprecated
                elseif ($ES_Template) {
                    # if template isn't deprecated use templateId
                    if ($ES_Template.isDeprecated -eq $false) {
                        $TemplateId = $JSON_TemplateId
                    }
                    # If template deprecated, look for latest version
                    elseif ($ES_Template.isDeprecated -eq $true) {
                        $Template = $Templates | Where-Object { $_.displayName -eq "$JSON_TemplateDisplayName" } | Where-Object { $_.isDeprecated -eq $false }
                        $TemplateId = $Template.id
                    }
                }
                # Else If Imported JSON template ID can't be found check if Template Display Name can be used
                elseif ($null -eq $ES_Template) {
                    Write-Verbose "Didn't find Template with ID $JSON_TemplateId, checking if Template DisplayName '$JSON_TemplateDisplayName' can be used..." -Verbose
                    $ES_Template = $Templates | Where-Object { $_.displayName -eq "$JSON_TemplateDisplayName" }
                    If ($ES_Template) {
                        if ($ES_Template.templateType -eq "securityBaseline" -or $ES_Template.templateType -eq "advancedThreatProtectionSecurityBaseline") {
                            Write-Information "`n" -InformationAction Continue
                            Write-Verbose "TemplateID '$JSON_TemplateId' with template Name '$JSON_TemplateDisplayName' doesn't exist..." -Verbose
                            Write-Warning "Importing using the updated template could fail as settings specified may not be included in the latest template..." -WarningAction Continue
                            Write-Information "`n" -InformationAction Continue
                            break
                        }
                        else {
                            Write-Verbose "Template with displayName '$JSON_TemplateDisplayName' found..." -Verbose
                            $Template = $ES_Template | Where-Object { $_.isDeprecated -eq $false }
                            $TemplateId = $Template.id
                        }
                    }
                    else {
                        Write-Information "`n" -InformationAction Continue
                        Write-Verbose "TemplateID '$JSON_TemplateId' with template Name '$JSON_TemplateDisplayName' doesn't exist..." -Verbose
                        Write-Warning "Importing using the updated template could fail as settings specified may not be included in the latest template..." -WarningAction Continue
                        Write-Information "`n" -InformationAction Continue
                        Write-Information "`n" -InformationAction Continue
                    }
                }
                Write-Verbose "Adding Endpoint Security Policy '$DisplayName'" -Verbose
                $CreateResult = Add-EmMdmEndpointSecurity -TemplateId $TemplateId -JSON ($JSON_Convert | ConvertTo-Json) -graphApiVersion $graphApiVersion
                Write-Verbose "Policy '$DisplayName' created with id" $CreateResult.id -Verbose
                return $CreateResult
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
        Write-Verbose "Import-EmMdmEndpointSecurity completed." -Verbose
    }
}
