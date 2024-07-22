<#
    .SYNOPSIS
        Backs up Intune Endpoint Security policies to a specified export path.
    .DESCRIPTION
        The Backup-EmMdmEndpointSecurity cmdlet connects to Microsoft Graph, retrieves Intune Endpoint Security policies, and exports them to the specified directory as JSON files.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.
    .PARAMETER ExportPath
        The directory path where the Endpoint Security policies will be exported. This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0".
        The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        [string] The cmdlet accepts a directory path as input.
    .OUTPUTS
        [void] This cmdlet does not output any objects.
    .EXAMPLE
        PS> Backup-EmMdmEndpointSecurity -ExportPath "C:\Backup\EndpointSecurity"
        This example connects to Microsoft Graph, retrieves Intune Endpoint Security policies, and exports them to the specified directory "C:\Backup\EndpointSecurity" as JSON files.
    .EXAMPLE
        PS> Backup-EmMdmEndpointSecurity -ExportPath "C:\Backup\EndpointSecurity" -graphApiVersion "v1.0"
        This example connects to Microsoft Graph using the 'v1.0' API version, retrieves Intune Endpoint Security policies, and exports them to the specified directory "C:\Backup\EndpointSecurity" as JSON files.
    .NOTES
        The cmdlet uses the following functions:
        - New-EmMdmBackupDirectory
        - Connect-EmMdmGraph
        - Get-EmEndpointSecurityTemplate
        - Get-EmDMIntent
        - Get-EmDMTemplateSettingCategory
        - Get-EmDMSettingInstance
        - Backup-EmMdmPolicy
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmEndpointSecurity
#>

function Backup-EmMdmEndpointSecurity {
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'High'
    )]
    [OutputType([void])]
    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The directory path where the endpoint security policies will be exported."
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ExportPath,
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
    Begin {
        try {
            if ($PSCmdlet.ShouldProcess("Creating directory `"$(Split-Path -Path $ExportPath -Leaf)`" in `"$(Split-Path -Path $ExportPath -Parent)`" if not found.", "New-Item")) {
                New-EmMdmBackupDirectory -ExportPath $ExportPath -Confirm:$false
            }
            if ($PScmdlet.ShouldProcess("Connecting to Microsoft Graph API with permissions: DeviceManagementConfiguration.Read.All, DeviceManagementManagedDevices.Read.All", "Connect-MgGraph")) {
                $isConnected = Connect-EmMdmGraph -Scopes "DeviceManagementConfiguration.Read.All", "DeviceManagementManagedDevices.Read.All" -AuthObject $AuthObject
            }
        }
        catch {
            throw $_
        }
    }
    Process {
        try {
            if ($isConnected -and $PScmdlet.ShouldProcess("Exporting JSON device configurations from Microsoft Graph API to path: '$ExportPath' ", "Invoke-MgGraphRequest")) {
                # Get all Endpoint Security Templates
                $Templates = Get-EmEndpointSecurityTemplate -graphApiVersion $graphApiVersion
                # Get all Endpoint Security Policies configured ([Alias("Get-EmDeviceManagementIntent")])
                $ESPolicies = Get-EmDMIntent -graphApiVersion $graphApiVersion | Sort-Object displayName
                if ($ESPolicies.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No policies found"
                }
                # Looping through all policies configured
                foreach ($policy in ($ESPolicies | Sort-Object displayName)) {
                    Write-Verbose "Endpoint Security Policy: $($policy.displayName)" -Verbose
                    # Update TemplateDisplayName and TemplateId properties
                    $ES_Template = $Templates | Where-Object { $_.id -eq $policy.templateId }
                    # Creating EmDManagementIntentInstanceCustom object for JSON output
                    $JSON = [EmDManagementIntentInstanceCustom]::new($policy)
                    # Add TemplateDisplayName to JSON object for easy identification during retrieval and import
                    $JSON.TemplateDisplayName = $ES_Template.displayName
                    # Getting all categories in specified Endpoint Security Template
                    $Categories = Get-EmDMTemplateSettingCategory -TemplateId $policy.templateId -graphApiVersion $graphApiVersion
                    # Looping through all categories within the Template
                    $Settings = @()  # Initialize the $Settings array to store the settings
                    foreach ($category in $Categories) {
                        $categoryId = $category.id
                        #     [Alias("Get-EmDeviceManagementSettingInstance")]
                        $Settings += Get-EmDMSettingInstance -PolicyId $policy.id -categoryId $categoryId -graphApiVersion $graphApiVersion
                    }
                    # Adding All settings to settingsDelta ready for JSON export
                    $JSON.settingsDelta = @($Settings)
                    # Export JSON data
                    Backup-EmMdmPolicy -Policy $JSON -ExportPath $ExportPath -PolicyType "Endpoint Security"
                }
                $ExportComplete = $true
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
    End {
        if ($ExportComplete) {
            Write-Verbose "Export complete..." -Verbose
        }
    }
}
