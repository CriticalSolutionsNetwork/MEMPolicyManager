---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToFlatObject
schema: 2.0.0
---

# Convert-EmMgJsonToFlatObject

## SYNOPSIS
Converts a JSON string or file to a flat PowerShell object.

## SYNTAX

### Import
```
Convert-EmMgJsonToFlatObject -ImportPath <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### StringObject
```
Convert-EmMgJsonToFlatObject -JSON <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Convert-EmMgJsonToFlatObject cmdlet takes a JSON string or a path to a JSON file and converts it into a flat PowerShell object.
The cmdlet supports importing JSON from a file or directly from a string provided in the pipeline.

## EXAMPLES

### EXAMPLE 1
```
Convert-EmMgJsonToFlatObject -ImportPath "C:\path\to\file.json"
This example imports the JSON file from the specified path and converts it to a flat PowerShell object.
```

### EXAMPLE 2
```
'{"name": "Test", "value": {"nested": 123}}' | Convert-EmMgJsonToFlatObject
This example takes a JSON string from the pipeline, converts it to a flat PowerShell object, and outputs the result.
```

## PARAMETERS

### -ImportPath
The path to the JSON file to be imported.
This parameter is mandatory when using the 'Import' parameter set.

```yaml
Type: String
Parameter Sets: Import
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -JSON
The JSON string to be converted to a flat object.
This parameter is mandatory when using the 'StringObject' parameter set.

```yaml
Type: String
Parameter Sets: StringObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### [string] The cmdlet accepts a JSON string or a file path as input.
## OUTPUTS

### [PSCustomObject] The cmdlet outputs a flat PowerShell object.
## NOTES
The cmdlet uses the ConvertTo-FlatObject function to flatten the JSON structure.
The cmdlet supports two parameter sets: 'Import' for importing JSON from a file and 'StringObject' for converting JSON strings.
Borrowed private function code from: https://powersnippets.com/convertto-flatobject/

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToFlatObject](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToFlatObject)

