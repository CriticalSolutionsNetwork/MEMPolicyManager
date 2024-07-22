<#
    .SYNOPSIS
        Backs up Intune Software Update policies to a specified export path.
    .DESCRIPTION
        The Backup-EmMdmSoftwareUpdate cmdlet connects to Microsoft Graph, retrieves Intune Software Update policies, and exports them to the specified directory as JSON files.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.
    .PARAMETER ExportPath
        The directory path where the Software Update policies will be exported. This parameter is mandatory.
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0".
        The default value is "beta".
    .INPUTS
        [string] The cmdlet accepts a directory path as input.
    .OUTPUTS
        [void] This cmdlet does not output any objects.
    .EXAMPLE
        PS> Backup-EmMdmSoftwareUpdate -ExportPath "C:\Backup\SoftwareUpdates"
        This example connects to Microsoft Graph, retrieves Intune Software Update policies, and exports them to the specified directory "C:\Backup\SoftwareUpdates" as JSON files.
    .NOTES
        The cmdlet uses the following functions:
        - New-EmMdmBackupDirectory
        - Connect-EmMdmGraph
        - Get-EmMdmConfigurationAPI
        - Backup-EmMdmPolicy
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmSoftwareUpdate
#>
function Backup-EmMdmSoftwareUpdate {
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
            HelpMessage = "The directory path where the software update policies will be exported."
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
            if ($isConnected -and $PScmdlet.ShouldProcess("Exporting Software Updates device configurations to JSON", "Get-EmMdmConfigurationAPI")) {
                # Filtering out iOS and Windows Software Update Policies
                $DCPs = Get-EmMdmConfigurationAPI -odataType "softwareUpdates" -graphApiVersion $graphApiVersion
                if ($DCPs.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No policies found"
                }
                Backup-EmMdmPolicy -Policy $DCPs -ExportPath $ExportPath -PolicyType "Software Updates"
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
            Write-Verbose "Backup-EmMdmSoftwareUpdate completed." -Verbose
        }
    }
}