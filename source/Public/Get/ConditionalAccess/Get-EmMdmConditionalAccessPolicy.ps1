function Get-EmMdmConditionalAccessPolicy {
    [cmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'Medium'
    )]
    param (
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The authentication object used for connecting to Microsoft Graph."
        )]
        [EmMdmAuthBase]$AuthObject,
        [Parameter(Mandatory = $false)]
        [ValidateSet('beta', 'v1.0')]
        [string]$graphApiVersion = 'beta',
        [Parameter(Mandatory = $false)]
        [string]$DisplayName
    )
    process {
        try {
            if ($PSCmdlet.ShouldProcess("Connecting to MgGraph with scopes Policy.Read.All", "Connect-MgGraph")) {
                $isConnected = Connect-EmMdmGraph -Scopes "Policy.Read.All" -AuthObject $AuthObject
            }

            if ($PSCmdlet.ShouldProcess("Getting Conditional Access Policies", "Get-EmConditionalAccessPolicyAPI")) {
                $CAPs = Get-EmMdmConditionalAccessPolicyAPI -graphApiVersion $graphApiVersion -DisplayName $DisplayName

                if ($CAPs.Length -eq 0) {
                    Write-Verbose "No Conditional Access policies found" -Verbose
                    throw "No Conditional Access policies were found for the specified display name."
                }

                return $CAPs
            }
        }
        catch {
            throw "Get-EmConditionalAccessPolicy Error:`n $_"
        }
        finally {
            if ($isConnected) {
                Write-Verbose "Disconnecting from MgGraph..." -Verbose
                Disconnect-MgGraph | Out-Null
            }
        }
    }
}
