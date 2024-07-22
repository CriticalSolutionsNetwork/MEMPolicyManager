<#
    .SYNOPSIS
        Backs up Intune Device Compliance policies to a specified export path.
    .DESCRIPTION
        The Backup-EmMdmCompliance cmdlet connects to Microsoft Graph, retrieves Intune Device Compliance policies, and exports them to the specified directory as JSON files.
        The cmdlet supports filtering policies by operating system and allows selecting between 'beta' and 'v1.0' versions of the Graph API. The cmdlet includes confirmation prompts for actions with high impact.
    .PARAMETER ExportPath
        The directory path where the Device Compliance policies will be exported. This parameter is mandatory.
    .PARAMETER OperatingSystem
        The operating system filter for the compliance policies. Valid values are "android", "iOS", "Win10", "macos", and "all".
        The default value is "all".
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0".
        The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        [string] The cmdlet accepts a directory path as input.
    .OUTPUTS
        [string] This cmdlet returns the export path upon successful completion.
    .EXAMPLE
        PS> Backup-EmMdmCompliance -ExportPath "C:\Backup\CompliancePolicies" -OperatingSystem "Win10"
        This example connects to Microsoft Graph, retrieves Windows 10 Device Compliance policies, and exports them to the specified directory "C:\Backup\CompliancePolicies" as JSON files.
    .EXAMPLE
        PS> Backup-EmMdmCompliance -ExportPath "C:\Backup\CompliancePolicies" -graphApiVersion "v1.0"
        This example connects to Microsoft Graph using the 'v1.0' API version, retrieves all Device Compliance policies, and exports them to the specified directory "C:\Backup\CompliancePolicies" as JSON files.
    .NOTES
        The cmdlet uses the following functions:
        - New-EmMdmBackupDirectory
        - Connect-EmMdmGraph
        - Get-EmMdmComplianceAPI
        - Backup-EmMdmPolicy
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmCompliance
#>

function Backup-EmMdmCompliance {
    #[Alias("Export-EmDeviceCompliancePolicy")]
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
            HelpMessage = "The directory path where the Compliance policies will be exported."
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ExportPath,
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The operating system for which the compliance policies are retrieved. Valid values are 'android', 'iOS', 'Win10', 'macos', and 'all'. The default value is 'all'."
        )]
        [ValidateSet("android", "iOS", "Win10", "macos", "all")]
        [string]$OperatingSystem = "all",
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
            if ($PSCmdlet.ShouldProcess("Connecting to MgGraph with scopes DeviceManagementConfiguration.Read.All", "Connect-MgGraph")) {
                $isConnected = Connect-EmMdmGraph -Scopes "DeviceManagementConfiguration.Read.All" -AuthObject $AuthObject
            }
        }
        catch {
            throw $_
        }
    }
    process {
        try {
            if ($isConnected -and $PSCmdlet.ShouldProcess("Getting all Compliance policies and exporting to JSON", "Get-EmMdmComplianceAPI")) {
                $DCPs = Get-EmMdmComplianceAPI -OperatingSystem $OperatingSystem -graphApiVersion $graphApiVersion
                if ($DCPs.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No policies found"
                }
                Write-Verbose "Exporting $OperatingSystem Compliance policies..." -Verbose
                Backup-EmMdmPolicy -Policy $DCPs -ExportPath $ExportPath -PolicyType "Device Compliance"
                $ExportComplete = $true
            }
        }
        catch {
            throw "An error occurred while exporting the Compliance policies: `n$_"
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
            Write-Verbose "Export-CompliancePolicy completed." -Verbose
        }
    }
}