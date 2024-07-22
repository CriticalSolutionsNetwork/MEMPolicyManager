<#
    .SYNOPSIS
        Backs up Intune Settings Catalog policies to a specified export path.
    .DESCRIPTION
        The Backup-EmMdmSettingsCatalog cmdlet connects to Microsoft Graph, retrieves Intune Settings Catalog policies, and exports them to the specified directory as JSON files.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.
    .PARAMETER ExportPath
        The directory path where the Settings Catalog policies will be exported. This parameter is mandatory.
    .PARAMETER Platform
        The platform for which to retrieve policies. Valid values are "windows10" and "macOS". The default value is null, which retrieves policies for all platforms.
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
        PS> Backup-EmMdmSettingsCatalog -ExportPath "C:\Backup\SettingsCatalog"
        This example connects to Microsoft Graph, retrieves Intune Settings Catalog policies, and exports them to the specified directory "C:\Backup\SettingsCatalog" as JSON files.
    .EXAMPLE
        PS> Backup-EmMdmSettingsCatalog -ExportPath "C:\Backup\SettingsCatalog" -Platform "windows10"
        This example connects to Microsoft Graph, retrieves Intune Settings Catalog policies for Windows 10, and exports them to the specified directory "C:\Backup\SettingsCatalog" as JSON files.
    .NOTES
        The cmdlet uses the following functions:
        - New-EmMdmBackupDirectory
        - Connect-EmMdmGraph
        - Get-EmMdmSettingsCatalogAPI
        - Get-EmMdmSettingsCatalogSettingsAPI
        - Backup-EmMdmPolicy
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmSettingsCatalog
#>

function Backup-EmMdmSettingsCatalog {
    #[Alias("Export-SettingsCatalogPolicy")]
    [cmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'High'
    )]
    [OutputType([void])]
    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The directory path where the settings catalog policies will be exported."
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ExportPath,
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The platform for which to retrieve settings catalog policies. Valid values are 'windows10', 'macOS', or null."
        )]
        [ValidateSet("windows10", "macOS", $null)]
        [string]$Platform = $null,
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
            if ($PSCmdlet.ShouldProcess("Creating directory `"$(Split-Path -Path $ExportPath -Leaf)`" in `"$(Split-Path -Path $ExportPath -Parent)`" if not found.", "New-Item")) {
                New-EmMdmBackupDirectory -ExportPath $ExportPath -Confirm:$false
            }
            # Connect to Microsoft Graph API
            if ($PScmdlet.ShouldProcess("Connecting to MgGraph", "Connect-MgGraph")) {
                $isConnected = Connect-EmMdmGraph -Scopes "DeviceManagementConfiguration.Read.All" -AuthObject $AuthObject
            }
        }
        catch {
            throw $_
        }
    }
    process {
        # Export Settings Catalog policies to JSON
        try {
            if ($isConnected -and $PScmdlet.ShouldProcess("Exporting device configurations to JSON", "Invoke-MgGraphRequest")) {
                $ExportPath = $ExportPath.replace('"', '')
                # Retrieve Settings Catalog policies
                $Policies = Get-EmMdmSettingsCatalogAPI -Platform $Platform -graphApiVersion $graphApiVersion
                # # Excluding EDR Policy to ensure Onboarding Blob Connector not included: '0385b795-0f2f-44ac-8602-9f65bf6adede_1'
                $policies = $policies | Where-Object { $_.TemplateReference.TemplateId -ne "0385b795-0f2f-44ac-8602-9f65bf6adede_1" }
                if ($Policies.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No policies found"
                }
                foreach ($policy in $Policies) {
                    Write-Verbose $policy.name -Verbose
                    $AllSettingsInstances = @()
                    $PolicyId = $policy.id
                    # Create a new instance of the custom export class
                    $PolicyBody = [EmConfigurationPolicyExport]::new()
                    # Assign properties from the retrieved policy
                    $PolicyBody.name = $policy.name
                    $PolicyBody.description = $policy.description
                    $PolicyBody.platforms = $policy.platforms
                    $PolicyBody.technologies = $policy.technologies
                    # Checking if policy has a templateId associated
                    if ($policy.templateReference.templateId) {
                        Write-Verbose "Found template reference"
                        # Assign template reference property
                        $PolicyBody.templateReference = New-Object psobject -Property @{ templateId = $policy.templateReference.templateId }
                    }
                    # Fetch the settings instances for the current policy
                    $SettingInstances = Get-EmMdmSettingsCatalogSettingsAPI -PolicyId $PolicyId -graphApiVersion $graphApiVersion
                    # Extract setting instances and add to the collection
                    $Instances = $SettingInstances.settingInstance
                    foreach ($object in $Instances) {
                        $Instance = New-Object -TypeName PSObject -Property @{ settingInstance = $object }
                        $AllSettingsInstances += $Instance
                    }
                    # Assign the collected settings to the custom export class
                    $PolicyBody.settings = $AllSettingsInstances
                    # Export the custom object to JSON
                    Backup-EmMdmPolicy -Policy $PolicyBody -ExportPath $ExportPath -PolicyType "Settings Catalog" -AltName
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
    end {
        if ($ExportComplete) {
            Write-Verbose "Export complete..." -Verbose
        }
    }
}

