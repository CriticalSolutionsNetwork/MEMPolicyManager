<#
    .SYNOPSIS
        Creates a new directory for MDM backup if it does not already exist.
    .DESCRIPTION
        The New-EmMdmBackupDirectory function checks if the specified directory exists. If it does not, the function creates the directory. This is useful for setting up a backup path for MDM configurations.
    .PARAMETER ExportPath
        The path of the directory to create. This parameter is mandatory.
    .OUTPUTS
        None. This function does not output any objects.
    .EXAMPLE
        New-EmMdmBackupDirectory -ExportPath "C:\Backup\MDM"
        This example checks for the existence of the "C:\Backup\MDM" directory and creates it if it does not exist.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function New-EmMdmBackupDirectory {
    [cmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'medium'
    )]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ExportPath
    )
    process {
        try {
            if ($PSCmdlet.ShouldProcess("Creating directory at $ExportPath", "New-Item")) {
                if (!(Test-Path "$ExportPath")) {
                    New-Item -ItemType Directory -Path "$ExportPath" | Out-Null
                    Write-Verbose "Directory created at $ExportPath" -Verbose
                }
            }
        }
        catch {
            throw "An error occurred while creating the directory: `n$_"
        }
    }

}