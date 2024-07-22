<#
    .SYNOPSIS
        Backs up MDM policies to a specified export path.
    .DESCRIPTION
        The Backup-EmMdmPolicy cmdlet backs up MDM policies to the specified export path. It iterates over the provided policies, exports each one to the specified directory as JSON files, and supports optional alternative naming conventions.
    .PARAMETER ExportPath
        The directory path where the MDM policies will be exported. This parameter is mandatory.
    .PARAMETER Policy
        An array of policy objects to be backed up. This parameter is mandatory.
    .PARAMETER PolicyType
        The type of policy being backed up (e.g., "Configuration", "Compliance"). This parameter is mandatory.
    .PARAMETER AltName
        A switch to use an alternative naming convention for the policy files. If set, the policy files will be named based on the "displayName" property instead of the default "name" property.
    .OUTPUTS
        None. This cmdlet does not output any objects.
    .EXAMPLE
        $policies = Get-MdmPolicies -Type "Configuration"
        Backup-EmMdmPolicy -ExportPath "C:\Backup\MDMPolicies" -Policy $policies -PolicyType "Configuration"
        This example backs up MDM configuration policies to the specified directory "C:\Backup\MDMPolicies".
    .EXAMPLE
        $policies = Get-MdmPolicies -Type "Compliance"
        Backup-EmMdmPolicy -ExportPath "C:\Backup\MDMPolicies" -Policy $policies -PolicyType "Compliance" -AltName
        This example backs up MDM compliance policies to the specified directory "C:\Backup\MDMPolicies" using the alternative naming convention based on "displayName".
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Backup-EmMdmPolicy {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ExportPath,
        [Parameter(Mandatory = $true)]
        [object[]]$Policy,
        [Parameter(Mandatory = $true)]
        [string]$PolicyType,
        [switch]$AltName
    )
    switch ($AltName) {
        $true { $Name = "displayName" }
        Default {$Name = "name"}
    }
    foreach ($Pol in $Policy) {
        Write-Verbose "Backing up $PolicyType Policy: $($Pol."$($Name)")" -Verbose
        Export-JSONData -Policy $Pol -ExportPath "$ExportPath" -AltName:$AltName
        Write-Information "`n" -InformationAction Continue
    }
}