﻿<#
    .SYNOPSIS
    Flattens a nested object into a single level object.
    .DESCRIPTION
    Flattens a nested object into a single level object.
    .PARAMETER Objects
    The object (or objects) to be flatten.
    .PARAMETER Separator
    The separator used between the recursive property names
    .PARAMETER Base
    The first index name of an embedded array:
    - 1, arrays will be 1 based: <Parent>.1, <Parent>.2, <Parent>.3, …
    - 0, arrays will be 0 based: <Parent>.0, <Parent>.1, <Parent>.2, …
    - "", the first item in an array will be unnamed and than followed with 1: <Parent>, <Parent>.1, <Parent>.2, …
    .PARAMETER Depth
    The maximal depth of flattening a recursive property. Any negative value will result in an unlimited depth and could cause a infinitive loop.
    .PARAMETER Uncut
    The maximal depth of flattening a recursive property. Any negative value will result in an unlimited depth and could cause a infinitive loop.
    .PARAMETER ExcludeProperty
    The property to be excluded from the output.
    .Parameter Path
    The current path of the object.
    .Parameter OutputObject
    The output object you're working with.
    .EXAMPLE
    $Object3 | ConvertTo-FlatObject
    .NOTES
    Based on https://github.com/EvotecIT/PSSharedGoods/blob/master/License
#>
function ConvertTo-FlatObject {
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipeLine)][Object[]]$Objects,
        [String]$Separator = ".",
        [ValidateSet("", 0, 1)]$Base = 1,
        [int]$Depth = 5,
        [string[]] $ExcludeProperty,
        [Parameter(DontShow)][String[]]$Path,
        [Parameter(DontShow)][System.Collections.IDictionary] $OutputObject
    )
    Begin {
        $InputObjects = [System.Collections.Generic.List[Object]]::new()
    }
    Process {
        foreach ($O in $Objects) {
            if ($null -ne $O) {
                $InputObjects.Add($O)
            }
        }
    }
    End {
        If ($PSBoundParameters.ContainsKey("OutputObject")) {
            $Object = $InputObjects[0]
            $Iterate = [ordered] @{}
            if ($null -eq $Object) {
                #Write-Verbose -Message "ConvertTo-FlatObject - Object is null"
            } elseif ($Object.GetType().Name -in 'String', 'DateTime', 'TimeSpan', 'Version', 'Enum') {
                $Object = $Object.ToString()
            } elseif ($Depth) {
                $Depth--
                If ($Object -is [System.Collections.IDictionary]) {
                    $Iterate = $Object
                } elseif ($Object -is [Array] -or $Object -is [System.Collections.IEnumerable]) {
                    $i = $Base
                    foreach ($Item in $Object.GetEnumerator()) {
                        $NewObject = [ordered] @{}
                        If ($Item -is [System.Collections.IDictionary]) {
                            foreach ($Key in $Item.Keys) {
                                if ($Key -notin $ExcludeProperty) {
                                    $NewObject[$Key] = $Item[$Key]
                                }
                            }
                        } elseif ($Item -isnot [Array] -and $Item -isnot [System.Collections.IEnumerable]) {
                            foreach ($Prop in $Item.PSObject.Properties) {
                                if ($Prop.IsGettable -and $Prop.Name -notin $ExcludeProperty) {
                                    $NewObject["$($Prop.Name)"] = $Item.$($Prop.Name)
                                }
                            }
                        } else {
                            $NewObject = $Item
                        }
                        $Iterate["$i"] = $NewObject
                        $i += 1
                    }
                } else {
                    foreach ($Prop in $Object.PSObject.Properties) {
                        if ($Prop.IsGettable -and $Prop.Name -notin $ExcludeProperty) {
                            $Iterate["$($Prop.Name)"] = $Object.$($Prop.Name)
                        }
                    }
                }
            }
            If ($Iterate.Keys.Count) {
                foreach ($Key in $Iterate.Keys) {
                    if ($Key -notin $ExcludeProperty) {
                        ConvertTo-FlatObject -Objects @(, $Iterate["$Key"]) -Separator $Separator -Base $Base -Depth $Depth -Path ($Path + $Key) -OutputObject $OutputObject -ExcludeProperty $ExcludeProperty
                    }
                }
            } else {
                $Property = $Path -Join $Separator
                if ($Property) {
                    # We only care if property is not empty
                    if ($Object -is [System.Collections.IDictionary] -and $Object.Keys.Count -eq 0) {
                        $OutputObject[$Property] = $null
                    } else {
                        $OutputObject[$Property] = $Object
                    }
                }
            }
        } elseif ($InputObjects.Count -gt 0) {
            foreach ($ItemObject in $InputObjects) {
                $OutputObject = [ordered]@{}
                ConvertTo-FlatObject -Objects @(, $ItemObject) -Separator $Separator -Base $Base -Depth $Depth -Path $Path -OutputObject $OutputObject -ExcludeProperty $ExcludeProperty
                [PSCustomObject] $OutputObject
            }
        }
    }
}