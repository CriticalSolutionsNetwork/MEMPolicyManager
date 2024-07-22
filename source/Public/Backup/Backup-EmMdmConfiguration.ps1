<#
    .SYNOPSIS
        Backs up Intune Device Configuration policies to a specified export path.
    .DESCRIPTION
        The Backup-EmMdmConfiguration cmdlet connects to Microsoft Graph, retrieves Intune Device Configuration policies, and exports them to the specified directory as JSON files.
        The cmdlet supports filtering policies by device type and allows selecting between 'beta' and 'v1.0' versions of the Graph API. The cmdlet includes confirmation prompts for actions with high impact.
    .PARAMETER DeviceType
        The device type filter for the configuration policies. Valid values are "windows81", "macOSExtensions", "macOSCustom", "macOSDeviceFeatures", "macOSGeneral", "macOSSoftwareUpdate", "macOSEndpointProtection", "androidWorkProfileGeneral", "androidWorkProfileVpn", "windowsHealthMonitoring", "windows81SCEP", "windows10Custom", "windows10EndpointProtection", "windows10General", and "all".
        The default value is "all".
    .PARAMETER ExportPath
        The directory path where the Device Configuration policies will be exported. This parameter is mandatory.
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
        PS> Backup-EmMdmConfiguration -DeviceType "windows10General" -ExportPath "C:\Backup\DeviceConfigurations"
        This example connects to Microsoft Graph, retrieves Windows 10 General Device Configuration policies, and exports them to the specified directory "C:\Backup\DeviceConfigurations" as JSON files.
    .EXAMPLE
        PS> Backup-EmMdmConfiguration -DeviceType "all" -ExportPath "C:\Backup\DeviceConfigurations" -graphApiVersion "v1.0"
        This example connects to Microsoft Graph using the 'v1.0' API version, retrieves all Device Configuration policies, and exports them to the specified directory "C:\Backup\DeviceConfigurations" as JSON files.
    .NOTES
        The cmdlet uses the following functions:
        - New-EmMdmBackupDirectory
        - Connect-EmMdmGraph
        - Get-EMMdmConfigurationAPI
        - Backup-EmMdmPolicy
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmConfiguration
#>

function Backup-EmMdmConfiguration {
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'High'
    )]
    [OutputType([void])]
    param (
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The type of device configuration to backup. Valid values are 'windows81', 'macOSExtensions', 'macOSCustom', 'macOSDeviceFeatures', 'macOSGeneral', 'macOSSoftwareUpdate', 'macOSEndpointProtection', 'androidWorkProfileGeneral', 'androidWorkProfileVpn', 'windowsHealthMonitoring', 'windows81SCEP', 'windows10Custom', 'windows10EndpointProtection', 'windows10General', and 'all'. The default value is 'all'."
        )]
        [ValidateSet(
            "windows81",
            "macOSExtensions",
            "macOSCustom",
            "macOSDeviceFeatures",
            "macOSGeneral",
            "macOSSoftwareUpdate",
            "macOSEndpointProtection",
            "androidWorkProfileGeneral",
            "androidWorkProfileVpn",
            "windowsHealthMonitoring",
            "windows81SCEP",
            "windows10Custom",
            "windows10EndpointProtection",
            "windows10General",
            "all"
        )]
        [string]$DeviceType = "all",
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The directory path where the device configuration policies will be exported."
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
            if ($isConnected -and $PScmdlet.ShouldProcess("Exporting device configurations to JSON", "Get-EMConfigurationAPI")) {
                # Filtering out iOS and Windows Software Update Policies
                $DCPs = Get-EMMdmConfigurationAPI -odataType $DeviceType -graphApiVersion $graphApiVersion
                Write-Verbose "Exporting $($DCPs.Length) policies to $ExportPath" -Verbose
                if ($DCPs.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No policies found"
                }
                Backup-EmMdmPolicy -Policy $DCPs -ExportPath $ExportPath -PolicyType "Device Configuration"
                $ExportComplete = $true
            }
        }
        catch {
            throw "An error occurred while exporting the device configuration policies: `n$_"
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
            Write-Verbose "Backup-EmMdmConfiguration completed." -Verbose
        }
    }
}