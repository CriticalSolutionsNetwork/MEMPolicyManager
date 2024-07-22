<#
    .SYNOPSIS
        Retrieves JSON examples for specified OData types and operations from Microsoft Graph API documentation.
    .DESCRIPTION
        The Get-EmMgResourceOperationJson cmdlet fetches JSON examples for specified OData types and operations (get, create, update) from the Microsoft Graph API documentation hosted on GitHub.
        The cmdlet returns JSON representations for the specified operations.
    .PARAMETER ODataTypes
        An array of OData types for which to retrieve JSON examples. This parameter is mandatory.
    .PARAMETER Operation
        The operation type for which to retrieve JSON examples. Valid values are "get", "create", and "update". This parameter is mandatory.
    .PARAMETER Resource
        The resource type for which to retrieve JSON examples. Valid values are "intune-deviceconfig" and "intune-mam". This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta".
    .INPUTS
        [string[]]
        The cmdlet accepts an array of OData types as input.
    .OUTPUTS
        [PSCustomObject]
        The cmdlet outputs a custom object containing JSON examples for the specified OData types and operations.
    .EXAMPLE
        PS> Get-EmMgResourceOperationJson -ODataTypes "androidCompliancePolicy", "iosCompliancePolicy" -Operation "get" -Resource "intune-deviceconfig"
        This example retrieves JSON examples for the specified OData types and get operations from Microsoft Graph API documentation.
    .NOTES
        The cmdlet constructs the URL to the Microsoft Graph API documentation for each specified OData type and operation, downloads the markdown content, and parses the JSON examples.
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceOperationJson
#>

function Get-EmMgResourceOperationJson {
    [CmdletBinding()]
    [OutputType([System.Object[]])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = "Specify the OData types for which to retrieve operation JSON.")]
        [ValidateNotNullOrEmpty()]
        [string[]]$ODataTypes,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the operation type (get, create, update).")]
        [ValidateSet("get", "create", "update")]
        [string]$Operation,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the resource type (intune-deviceconfig, intune-mam).")]
        [ValidateSet("intune-deviceconfig", "intune-mam")]
        [string]$Resource,
        [Parameter(Mandatory = $false, HelpMessage = "Specify the API version to use (beta, v1.0).")]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        $result = @()
        foreach ($odataType in $ODataTypes) {
            #$uri = "https://raw.githubusercontent.com/microsoftgraph/microsoft-graph-docs-contrib/main/api-reference/beta/api/intune-mam-targetedmanagedappconfiguration-create.md"
            $uri = "https://raw.githubusercontent.com/microsoftgraph/microsoft-graph-docs-contrib/main/api-reference/$graphApiVersion/api/$Resource-$(($odataType).ToLower())-$Operation.md"
            try {
                $markdownContent = Invoke-WebRequest -Uri $uri -UseBasicParsing
                $lines = $markdownContent.Content -split "`n"
                $jsonStart = $false
                $jsonContent = @()
                $braceCount = 0
                foreach ($line in $lines) {
                    if ($line.Trim() -eq "{") {
                        $jsonStart = $true
                        $braceCount++
                    }
                    if ($jsonStart) {
                        $jsonContent += $line
                        if ($line.Trim() -eq "{") {
                            $braceCount++
                        }
                        elseif ($line.Trim() -eq "}") {
                            $braceCount--
                            if ($braceCount -eq 0) {
                                $jsonStart = $false
                            }
                        }
                    }
                }
                $jsonContent = ($jsonContent -join "`n").Replace('```', "").Trim()
                if ($jsonContent) {
                    if ($Operation -eq "get") {
                        $customObject = [PSCustomObject]@{
                            Operation    = $Operation
                            Type         = $odataType
                            JsonResponse = $jsonContent
                        }
                    }
                    else {
                        # Split the JSON content into two parts based on the number of lines between the JSON objects
                        $jsonLines = $jsonContent -split "`n"
                        $json1 = $jsonLines[0..($jsonLines.IndexOf("}"))] -join "`n"
                        $json2 = $jsonLines[($jsonLines.IndexOf("}") + 10)..($jsonLines.Length - 1)] -join "`n"
                        $customObject = [PSCustomObject]@{
                            Operation    = $Operation
                            Type         = $odataType
                            JsonBody     = $json1
                            JsonResponse = $json2
                        }
                    }
                    $result += $customObject
                }
            }
            catch {
                throw $_
            }
        }
        return $result
    }
}