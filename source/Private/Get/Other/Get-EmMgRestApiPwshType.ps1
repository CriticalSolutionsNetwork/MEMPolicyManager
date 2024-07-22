<#
    .SYNOPSIS
        Maps Microsoft Graph API data types to PowerShell types.
    .DESCRIPTION
        The Get-EmMgRestApiPwshType function maps Microsoft Graph API data types to their corresponding PowerShell types. It supports various scalar and collection types.
    .PARAMETER typeName
        The Microsoft Graph API data type name to map to a PowerShell type. This parameter is mandatory.
    .OUTPUTS
        System.String Returns the corresponding PowerShell type as a string.
    .EXAMPLE
        $psType = Get-EmMgRestApiPwshType -typeName "String"
        Write-Output $psType
        This example maps the Microsoft Graph API type "String" to the PowerShell type "[string]".
    .EXAMPLE
        $psType = Get-EmMgRestApiPwshType -typeName "Int32 collection"
        Write-Output $psType
        This example maps the Microsoft Graph API type "Int32 collection" to the PowerShell type "[int[]]".
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Get-EmMgRestApiPwshType {
    param (
        [string]$typeName
    )
    process {
        $TypeMappings = @{
            "String"                    = "[string]"
            "DateTimeOffset"            = "[datetime]"
            "Boolean"                   = "[bool]"
            "Int32"                     = "[int]"
            "Int64"                     = "[long]"
            "Double"                    = "[double]"
            "Binary"                    = "[byte[]]"
            "TimeOfDay"                 = "[TimeSpan]"
            "String collection"         = "[string[]]"
            "Int32 collection"          = "[int[]]"
            "Int64 collection"          = "[long[]]"
            "Double collection"         = "[double[]]"
            "Boolean collection"        = "[bool[]]"
            "DateTimeOffset collection" = "[datetime[]]"
            "TimeOfDay collection"      = "[TimeSpan[]]"
        }
        if ($TypeMappings.ContainsKey($typeName)) {
            return $TypeMappings[$typeName]
        }
        elseif ($typeName -match ' collection$') {
            $baseType = $typeName -replace ' collection$', ''
            if ($TypeMappings.ContainsKey($baseType)) {
                return "[${baseType}[]]"
            }
        }
        return "[object[]]"
    }
}
