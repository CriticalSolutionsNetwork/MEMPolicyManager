function Backup-EmMdmConditionalAccessPolicy {
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
            HelpMessage = "The directory path where the Conditional Access policies will be exported."
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
            if ($isConnected -and $PSCmdlet.ShouldProcess("Getting Conditional Access policies and exporting to JSON", "Get-EmMdmAppConfigurationAPI")) {
                $APPs = Get-EmMdmConditionalAccessPolicyAPI -graphApiVersion $graphApiVersion
                if ($APPs.Length -eq 0) {
                    Write-Verbose "No policies found" -Verbose
                    throw "No policies found"
                }
                Write-Verbose "Exporting Conditional Access policies..." -Verbose
                Backup-EmMdmPolicy -Policy $APPs -ExportPath $ExportPath -PolicyType "Conditional Access"
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
            throw "An error occurred while getting the Conditional Access policies: `n$_"
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
            Write-Verbose "Backup-EmMdmConditionalAccessPolicy completed." -Verbose
        }
    }
}