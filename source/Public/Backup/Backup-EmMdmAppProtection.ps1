<#
    .SYNOPSIS
        Backs up Intune App Protection policies to a specified export path.
    .DESCRIPTION
        The Backup-EmMdmAppProtection cmdlet connects to Microsoft Graph, retrieves Intune App Protection policies, and exports them to the specified directory as JSON files.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.
    .PARAMETER ExportPath
        The directory path where the App Protection policies will be exported. This parameter is mandatory.
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
        PS> Backup-EmMdmAppProtection -ExportPath "C:\Backup\AppProtections"
        This example connects to Microsoft Graph, retrieves Intune App Protection policies, and exports them to the specified directory "C:\Backup\AppProtections" as JSON files.
    .NOTES
        The cmdlet uses the following functions:
        - New-EmMdmBackupDirectory
        - Connect-EmMdmGraph
        - Get-EmMdmAppProtectionAPI
        - Backup-EmMdmPolicy
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmAppProtection
#>
function Backup-EmMdmAppProtection {
    [cmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'high'
    )]
    [OutputType([void])]
    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The directory path where the App Protection policies will be exported."
        )]
        [ValidateNotNullOrEmpty()]
        [String]$ExportPath,
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
            if ($PSCmdlet.ShouldProcess("Connecting to MgGraph with scopes DeviceManagementApps.Read.All", "Connect-MgGraph")) {
                $isConnected = Connect-EmMdmGraph -Scopes "DeviceManagementApps.Read.All" -AuthObject $AuthObject
            }
        }
        catch {
            throw $_
        }
    }
    process {
        try {
            if ($isConnected -and $PSCmdlet.ShouldProcess("Getting App Protection policies and exporting to JSON", "Get-EmMdmAppProtectionAPI")) {
                $APPs = Get-EmMdmAppProtectionAPI -graphApiVersion $graphApiVersion
                if ($APPs.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No policies found"
                }
                Write-Verbose "Exporting App Protection policies..." -Verbose
                Backup-EmMdmPolicy -Policy $APPs -ExportPath $ExportPath -PolicyType "App Protection"
                <#
                foreach ($APP in $APPs) {
                    Write-Verbose "APP Protection Policy:"$APP.displayName -f Yellow
                    Export-JSONData -Policy $APP -ExportPath "$ExportPath" -AltName
                    Write-Verbose
                }
                #>
                $ExportComplete = $true
            }
        }
        catch {
            throw "An error occurred while getting the App Protection policies: `n$_"
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
            Write-Verbose "Backup-EmMdmAppProtection completed." -Verbose
        }
    }
}

