<#
    .SYNOPSIS
        Generates a valid file name by replacing invalid characters.
    .DESCRIPTION
        The Get-ValidFileName function takes a string and replaces any invalid file name characters with a specified replacement character. This ensures the string can be used as a valid file name.
    .PARAMETER String
        The string to be converted into a valid file name. This parameter is mandatory.
    .PARAMETER ReplacementCharacter
        The character used to replace invalid file name characters. Valid values are '_', '-', '.', and ' '. The default value is '_'.
    .OUTPUTS
        System.String Returns a valid file name string.
    .EXAMPLE
        $validFileName = Get-ValidFileName -String "Invalid:FileName*Example?.txt"
        Write-Output $validFileName
        This example converts the string "Invalid:FileName*Example?.txt" into a valid file name by replacing invalid characters with the default replacement character '_'.
    .EXAMPLE
        $validFileName = Get-ValidFileName -String "Invalid:FileName*Example?.txt" -ReplacementCharacter "-"
        Write-Output $validFileName
        This example converts the string "Invalid:FileName*Example?.txt" into a valid file name by replacing invalid characters with the replacement character '-'.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>

function Get-ValidFileName {
    param (
        [Parameter(Mandatory = $true)]
        [string]$String,

        [Parameter(
            HelpMessage = "Specify the character used to replace invalid characters. Default: '_' ",
            Mandatory = $false
        )]
        [ValidateSet('_', '-', '.', ' ')]
        [string]$ReplacementCharacter = '_'
    )
    if ([string]::IsNullOrEmpty($ReplacementCharacter)) {
        throw "Replacement character cannot be empty."
    }
    $illegalChars = ([IO.Path]::GetInvalidFileNameChars() )#+ ':', '[', ']','\','/' ) -join ''
    $regex = "[{0}]" -f [regex]::Escape($illegalChars)

    $filename = $String -replace $regex, $ReplacementCharacter
    $filename = $filename -replace "\[", "_"
    $filename -replace "\]", "_"
}