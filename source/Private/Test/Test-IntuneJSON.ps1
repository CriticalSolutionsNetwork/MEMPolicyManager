<#
    .SYNOPSIS
        Validates the provided JSON string for Intune configuration.
    .DESCRIPTION
        This function attempts to convert the provided JSON string to a PowerShell object to validate its format for Intune configuration.
    .PARAMETER JSON
        The JSON string to validate.
    .OUTPUTS
        None
    .EXAMPLE
        Test-IntuneJSON -JSON $jsonString
    .NOTES
    This function is used to validate JSON strings before using them in Intune configuration operations.
#>
function Test-IntuneJSON {
    [cmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        $JSON
    )
    try {
        ConvertFrom-Json $JSON -ErrorAction Stop
        $validJson = $true
    } catch {
        $validJson = $false
        $_.Exception
    }
    if (!$validJson) {
        Write-Verbose "Provided JSON isn't in valid JSON format" -Verbose
        break
    }
}