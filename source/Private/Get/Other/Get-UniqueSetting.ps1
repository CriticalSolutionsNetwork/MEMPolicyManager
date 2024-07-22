<#
    .SYNOPSIS
        Retrieves unique settings based on their definitionId.
    .DESCRIPTION
        This function processes an array of settings and returns only the unique settings based on their definitionId.
    .PARAMETER Settings
        An array of PSCustomObject representing the settings.
    .OUTPUTS
        PSCustomObject[]
    .EXAMPLE
        $uniqueSettings = Get-UniqueSetting -Settings $settings
#>
function Get-UniqueSetting {
    [cmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param (
        [Parameter(Mandatory = $true)]
        [PSCustomObject[]]$Settings
    )
    $uniqueSettings = @{}
    foreach ($setting in $Settings) {
        if (-not $uniqueSettings.ContainsKey($setting.definitionId)) {
            $uniqueSettings[$setting.definitionId] = $setting
        }
    }
    return $uniqueSettings.Values
}