<#
    .SYNOPSIS
        Converts a JSON string or file to a flat PowerShell object.
    .DESCRIPTION
        The Convert-EmMgJsonToFlatObject cmdlet takes a JSON string or a path to a JSON file and converts it into a flat PowerShell object.
        The cmdlet supports importing JSON from a file or directly from a string provided in the pipeline.
    .PARAMETER ImportPath
        The path to the JSON file to be imported. This parameter is mandatory when using the 'Import' parameter set.
    .PARAMETER JSON
        The JSON string to be converted to a flat object. This parameter is mandatory when using the 'StringObject' parameter set.
    .INPUTS
        [string] The cmdlet accepts a JSON string or a file path as input.
    .OUTPUTS
        [PSCustomObject] The cmdlet outputs a flat PowerShell object.
    .EXAMPLE
        PS> Convert-EmMgJsonToFlatObject -ImportPath "C:\path\to\file.json"
        This example imports the JSON file from the specified path and converts it to a flat PowerShell object.
    .EXAMPLE
        PS> '{"name": "Test", "value": {"nested": 123}}' | Convert-EmMgJsonToFlatObject
        This example takes a JSON string from the pipeline, converts it to a flat PowerShell object, and outputs the result.
    .NOTES
        The cmdlet uses the ConvertTo-FlatObject function to flatten the JSON structure.
        The cmdlet supports two parameter sets: 'Import' for importing JSON from a file and 'StringObject' for converting JSON strings.
        Borrowed private function code from: https://powersnippets.com/convertto-flatobject/
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToFlatObject
#>

function Convert-EmMgJsonToFlatObject {
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param (
        [Parameter(
            Mandatory = $true,
            ParameterSetName = 'Import',
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Path to the JSON file to be imported."
        )]
        [ValidateScript({ Test-Path $_ -PathType Leaf })]
        [String]$ImportPath,
        [Parameter(
            Mandatory = $true,
            ParameterSetName = 'StringObject',
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "JSON string to be converted to a flat object."
        )]
        [ValidateNotNullOrEmpty()]
        [String]$JSON
    )
    process {
        #  Using code found at : https://powersnippets.com/convertto-flatobject/
        switch ($PSCmdlet.ParameterSetName) {
            'Import' {
                $output = (Get-Content $ImportPath | ConvertFrom-Json -NoEnumerate -AsHashtable) | ConvertTo-FlatObject
            }
            Default {
                $output = ($JSON | ConvertFrom-Json -NoEnumerate -AsHashtable) | ConvertTo-FlatObject
            }
        }
        return $output
    }
}