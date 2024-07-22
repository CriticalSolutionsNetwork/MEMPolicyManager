<#
    .SYNOPSIS
        Exports JSON data to a specified path.
    .DESCRIPTION
        This function exports the provided JSON data to a specified path. This is a private function and is not exported by the module.
    .EXAMPLE
        Export-JSONData -Policy $Policy -ExportPath 'C:\Export'
    .PARAMETER JSON
        The JSON data to be exported.
    .PARAMETER ExportPath
        The path where the JSON file will be exported.
    .PARAMETER Depth
        The depth of the JSON data.
    .PARAMETER AltName
        Specifies whether to use the name or displayName property.
    .PARAMETER ExportType
        The type of export to perform. The default is All.
    .PARAMETER Policy
        The JSON data to be exported.
    .NOTES
        This function is intended for internal use within the module.
#>
function Export-JSONData {
    [cmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [object[]]$Policy,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$ExportPath,
        [int]$Depth = 100,
        [switch]$AltName,
        [Parameter()]
        [ValidateSet("JSON", "CSV", "All")]
        [string]$ExportType = "All"
    )
    process {
        if ($AltName) {
            $name = "name"
        }
        else {
            $name = "displayName"
        }
        try {
            <#
                        if ($Policy -eq "" -or $null -eq $Policy) {
                Write-Verbose "No JSON specified, please specify valid JSON..."
            }
            elseif (!$ExportPath) {
                Write-Verbose "No export path parameter set, please provide a path to export the file"
            }
            elseif (!(Test-Path $ExportPath)) {
                Write-Verbose "$ExportPath doesn't exist, can't export JSON Data"
            }
            #>
            $JSON1 = ConvertTo-Json $Policy -Depth $Depth
            $JSON_Convert = $JSON1 | ConvertFrom-Json -AsHashtable -NoEnumerate
            $displayName = $JSON_Convert.$name
            # Updating display name to follow file naming conventions
            $displayName = $displayName -replace '\<|\>|:|"|/|\\|\||\?|\*', "_"
            $FileName_CSV = "$DisplayName" + "_" + $(Get-Date -f dd-MM-yyyy-H-mm-ss) + ".csv"
            $FileName_JSON = "$displayName" + "_" + $(Get-Date -Format dd-MM-yyyy-H-mm-ss) + ".json"
            #$FileName_HTML = "$displayName" + "_" + $(Get-Date -Format dd-MM-yyyy-H-mm-ss) + ".html"
            $Object = ($JSON1 | ConvertFrom-Json | ConvertTo-FlatObject -Depth 100 | ConvertTo-Json | ConvertFrom-Json -AsHashtable).GetEnumerator() | Select-Object -Property Key, Value
            $FileName_CSV = Get-ValidFileName -String $FileName_CSV
            $FileName_JSON = Get-ValidFileName -String $FileName_JSON
            #$FileName_HTML = Get-ValidFileName -String $FileName_HTML
            $JSONPATH = "$( Join-Path -Path $ExportPath -ChildPath $FileName_JSON)"
            Write-Information "Export Path: $ExportPath" -InformationAction Continue
            switch ($ExportType) {
                'CSV' {
                    $Object | Export-Csv -LiteralPath "$( Join-Path -Path $ExportPath -ChildPath $FileName_CSV)" -Delimiter "," -NoTypeInformation -Append -Force
                    Write-Verbose "CSV created in $ExportPath\$FileName_CSV..." -Verbose
                }
                'JSON' {
                    $JSON1 | Set-Content -LiteralPath "$JSONPATH"
                    Write-Verbose "JSON created in $ExportPath\$FileName_JSON..." -Verbose
                }
                #'HTML' {
                # ConvertTo-EmMgJsonEditorHtml -JsonFilePath $JSONPATH -OutputHtmlFilePath "$( Join-Path -Path $ExportPath -ChildPath $FileName_HTML)"
                # Write-Verbose "HTML created in $ExportPath\$FileName_HTML..." -Verbose
                #}
                Default {
                    $Object | Export-Csv -LiteralPath "$( Join-Path -Path $ExportPath -ChildPath $FileName_CSV)" -Delimiter "," -NoTypeInformation -Append -Force
                    Write-Verbose "CSV created in $ExportPath\$FileName_CSV..." -Verbose
                    $JSON1 | Set-Content -LiteralPath "$JSONPATH"
                    Write-Verbose "JSON created in $ExportPath\$FileName_JSON..." -Verbose
                    #ConvertTo-EmMgJsonEditorHtml -JsonFilePath $JSONPATH -OutputHtmlFilePath "$( Join-Path -Path $ExportPath -ChildPath $FileName_HTML)"
                    #Write-Verbose "HTML created in $ExportPath\$FileName_HTML..." -Verbose
                }
            }
        }
        catch {
            throw $_
        }
    }
}
