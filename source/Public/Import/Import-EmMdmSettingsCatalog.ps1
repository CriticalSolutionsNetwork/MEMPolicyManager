<#
    .SYNOPSIS
        Imports Intune Settings Catalog policies from a specified JSON file.
    .DESCRIPTION
        The Import-EmMdmSettingsCatalog cmdlet connects to Microsoft Graph, reads an Intune Settings Catalog policy from a specified JSON file, and creates the policy in Intune.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.
    .PARAMETER ImportPath
        The file path to the JSON file containing the Settings Catalog policy to import. This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0".
        The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        [string] The cmdlet accepts a file path as input.
    .OUTPUTS
        [void] This cmdlet does not output any objects.
    .EXAMPLE
        PS> Import-EmMdmSettingsCatalog -ImportPath "C:\Backup\SettingsCatalog\Policy.json"
        This example connects to Microsoft Graph, reads the Settings Catalog policy from the specified JSON file, and creates the policy in Intune.
    .NOTES
        The cmdlet uses the following functions:
        - Connect-EmMdmGraph
        - Add-EmMdmSettingsCatalog
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmSettingsCatalog
#>

function Import-EmMdmSettingsCatalog {
    [cmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([void])]
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
            if ($isConnected -and $PSCmdlet.ShouldProcess("Importing Settings Catalog Policy", "Add-EmMdmSettingsCatalog")) {
                $ImportPath = $ImportPath.replace('"', '')
                # Getting content of JSON Import file
                $JSON_Data = Get-Content -Path "$ImportPath" -Raw
                # Converting input to JSON format and creating the custom class object for validation
                $JSON_Convert = $JSON_Data | ConvertFrom-Json -AsHashtable
                $PolicyObject = [EmConfigurationPolicyExport]::new($JSON_Convert)
                $DisplayName = $PolicyObject.name
                $Platforms = $PolicyObject.platforms
                $Technologies = $PolicyObject.technologies
                Write-Verbose "Adding Settings Catalog Policy '$DisplayName'" -Verbose
                Write-Information "Platforms: $Platforms" -InformationAction Continue
                Write-Information "Technologies: $Technologies" -InformationAction Continue
                # Call the Add-SettingsCatalogPolicy function with the validated policy object
                $response = Add-EmMdmSettingsCatalog -PolicyObject $PolicyObject -graphApiVersion $graphApiVersion
                return $response
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
        Write-Verbose "Settings Catalog Policy '$DisplayName' imported successfully." -Verbose
    }
}
