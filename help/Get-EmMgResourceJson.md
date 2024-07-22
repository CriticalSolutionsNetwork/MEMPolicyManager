---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceJson
schema: 2.0.0
---

# Get-EmMgResourceJson

## SYNOPSIS
Retrieves JSON resource and property information from Microsoft Graph API documentation.

## SYNTAX

```
Get-EmMgResourceJson [-ODataTypes] <String[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-EmMgResourceJson  cmdlet fetches JSON resource data and property tables from specified OData types using Microsoft Graph API documentation hosted on GitHub.
The cmdlet returns the JSON representation of the resource and its properties table.

## EXAMPLES

### EXAMPLE 1
```
Get-EmMgResourceJson -ODataTypes "macOSExtensionsConfiguration", "windows81TrustedRootCertificate"
This example retrieves JSON resource data and properties table for the specified OData types from Microsoft Graph API documentation.
```

## PARAMETERS

### -ODataTypes
An array of OData types for which to retrieve JSON resource data.
This parameter is mandatory.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
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

### [string[]]
### The cmdlet accepts an array of OData types as input.
## OUTPUTS

### [PSCustomObject]
### The cmdlet outputs a custom object containing the JSON representation and properties table of the specified OData types.
## NOTES
The cmdlet constructs the URL to the Microsoft Graph API documentation for each specified OData type, downloads the markdown content, and parses the JSON resource data and properties table.

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceJson](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceJson)

