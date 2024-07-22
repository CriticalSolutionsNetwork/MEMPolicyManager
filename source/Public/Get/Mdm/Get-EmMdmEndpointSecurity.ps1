<#
    .SYNOPSIS
        Retrieves Intune Endpoint Security policies from Microsoft Graph.
    .DESCRIPTION
        The Get-EmMdmEndpointSecurity cmdlet connects to Microsoft Graph using the specified API version and retrieves Intune Endpoint Security policies.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use.
        Valid values are "beta" and "v1.0".
        The default value is "beta".
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph.
    .INPUTS
        None. This cmdlet does not accept pipeline input.
    .OUTPUTS
        EmDManagementIntentInstanceCustom[]
        The cmdlet returns an array of EmDManagementIntentInstanceCustom objects representing the Endpoint Security policies.
    .EXAMPLE
        PS> Get-EmMdmEndpointSecurity -graphApiVersion $graphApiVersion
        This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Endpoint Security policies.
    .EXAMPLE
        PS> Get-EmMdmEndpointSecurity -graphApiVersion "v1.0"
        This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Endpoint Security policies.
    .NOTES
        The cmdlet uses the following functions:
        - Connect-EmMdmGraph
        - Get-EmEndpointSecurityTemplate
        - Get-EmDMIntent
        - Get-EmDMTemplateSettingCategory
        - Get-EmDMSettingInstance
        - Disconnect-MgGraph
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmEndpointSecurity
#>

function Get-EmMdmEndpointSecurity {
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'High'
    )]
    [OutputType([EmDManagementIntentInstanceCustom])]
    param (
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
            if ($PScmdlet.ShouldProcess("Listing device configurations from Microsoft Graph API to path: '$ExportPath' ", "Invoke-MgGraphRequest")) {
                # Get all Endpoint Security Templates
                $Templates = Get-EmEndpointSecurityTemplate -graphApiVersion $graphApiVersion
                # Get all Endpoint Security Policies configured
                $ESPolicies = Get-EmDMIntent -graphApiVersion $graphApiVersion | Sort-Object displayName
                if ($ESPolicies.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No Device Compliance Policies were found"
                }
                $allPolicies = @()
                # Looping through all policies configured
                foreach ($policy in ($ESPolicies | Sort-Object displayName)) {
                    Write-Verbose "Endpoint Security Policy: $policy.displayName found..."
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
                        $Settings += Get-EmDMSettingInstance -PolicyId $policy.id -categoryId $categoryId -graphApiVersion $graphApiVersion
                    }
                    # Adding All settings to settingsDelta ready for JSON export
                    $JSON.settingsDelta = @($Settings)
                    # Export JSON data
                    #Export-JSONData -Policy $JSON -ExportPath $ExportPath
                    $allPolicies += $JSON
                }
                return $allPolicies
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
