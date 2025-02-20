function Get-EmMdmConditionalAccessPolicyAPI {
    [cmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet('beta', 'v1.0')]
        [string]$graphApiVersion = 'beta',
        [Parameter(Mandatory = $false)]
        [string[]]$DisplayName
    )
    process {
        $Resource = 'identity/conditionalAccess/policies'
        $uriBase = "https://graph.microsoft.com/$graphApiVersion/$Resource"
        try {
            # Construct the URI with a filter query if DisplayName is provided
            if ($DisplayName) {
                $filterQuery = ($DisplayName | ForEach-Object { "displayName eq '$_'" }) -join ' or '
                $uri = "$uriBase`?\$filter=$filterQuery"
            }
            else {
                $uri = $uriBase
            }
            # Retrieve the data from Microsoft Graph API
            $response = Invoke-MgGraphRequest -Uri $uri -Method GET
            # Return the objects directly as they are already filtered server-side if DisplayName was provided
            $objects = $response.value
            Write-Verbose 'Conditional Access policies retrieved successfully.'
            return $objects
        }
        catch {
            throw "An error occurred while retrieving the Conditional Access policies: `n$_"
        }
    }
}
