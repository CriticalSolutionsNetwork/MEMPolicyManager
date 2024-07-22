<#
    .SYNOPSIS
        Retrieves JSON resource and property information from Microsoft Graph API documentation.
    .DESCRIPTION
        The Get-EmMgResourceJson  cmdlet fetches JSON resource data and property tables from specified OData types using Microsoft Graph API documentation hosted on GitHub.
        The cmdlet returns the JSON representation of the resource and its properties table.
    .PARAMETER ODataTypes
        An array of OData types for which to retrieve JSON resource data. This parameter is mandatory.
    .INPUTS
        [string[]]
        The cmdlet accepts an array of OData types as input.
    .OUTPUTS
        [PSCustomObject]
        The cmdlet outputs a custom object containing the JSON representation and properties table of the specified OData types.
    .EXAMPLE
        PS> Get-EmMgResourceJson -ODataTypes "macOSExtensionsConfiguration", "windows81TrustedRootCertificate"
        This example retrieves JSON resource data and properties table for the specified OData types from Microsoft Graph API documentation.
    .NOTES
        The cmdlet constructs the URL to the Microsoft Graph API documentation for each specified OData type, downloads the markdown content, and parses the JSON resource data and properties table.
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceJson
#>
function Get-EmMgResourceJson {
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = "Specify the OData types for which to retrieve JSON resources.")]
        [ValidateNotNullOrEmpty()]
        [string[]]$ODataTypes
    )
    process {
        $result = @()
        foreach ($odataType in $ODataTypes) {
            # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfig-macosextensionsconfiguration?view=graph-rest-beta
            # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfig-windows81trustedrootcertificate?view=graph-rest-beta
            $uri = "https://raw.githubusercontent.com/microsoftgraph/microsoft-graph-docs-contrib/main/api-reference/beta/resources/intune-deviceconfig-$odataType.md"
            #$uri = "https://raw.githubusercontent.com/microsoftgraph/microsoft-graph-docs-contrib/main/api-reference/beta/api/intune-deviceconfig-$odataType-list.md"
            try {
                $markdownContent = Invoke-WebRequest -Uri $uri -UseBasicParsing
                $lines = $markdownContent.Content -split "`n"
                $jsonStart = $false
                $jsonContent = @()
                $braceCount = 0
                $tableContent = @()
                $inTable = $false
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
                    if ($line -match "^## Properties$") {
                        $inTable = $true
                        continue
                    }
                    if ($inTable) {
                        if ($line -match "^## " -or $line -match '^```') {
                            $inTable = $false
                        }
                        elseif ($line -notmatch "^\|:---\|:---\|:---\|$" -and $line.Trim() -ne "") {
                            $tableContent += $line
                        }
                    }
                }
                $jsonContent = ($jsonContent -join "`n").Replace('```', "").Trim()
                $tableString = ($tableContent -join "`n").TrimEnd("`n") | ConvertFrom-Csv -Delimiter "|" | Select-Object -Property * -ExcludeProperty h1 | ConvertTo-Csv -Delimiter "|"
                if ($jsonContent -and $tableString) {
                    $customObject = [PSCustomObject]@{
                        Table = $tableString
                        Json  = $jsonContent
                    }
                    $result += $customObject
                }
            }
            catch {
                Write-Verbose "Failed to process $odataType`: $_" -ForegroundColor Red
            }
        }
        return $result
    }
}