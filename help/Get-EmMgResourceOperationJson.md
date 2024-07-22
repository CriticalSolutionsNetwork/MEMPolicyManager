---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceOperationJson
schema: 2.0.0
---

# Get-EmMgResourceOperationJson

## SYNOPSIS
Retrieves JSON examples for specified OData types and operations from Microsoft Graph API documentation.

## SYNTAX

```
Get-EmMgResourceOperationJson [-ODataTypes] <String[]> [-Operation] <String> [-Resource] <String>
 [[-graphApiVersion] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-EmMgResourceOperationJson cmdlet fetches JSON examples for specified OData types and operations (get, create, update) from the Microsoft Graph API documentation hosted on GitHub.
The cmdlet returns JSON representations for the specified operations.

## EXAMPLES

### EXAMPLE 1
```
Get-EmMgResourceOperationJson -ODataTypes "androidCompliancePolicy", "iosCompliancePolicy" -Operation "get" -Resource "intune-deviceconfig"
This example retrieves JSON examples for the specified OData types and get operations from Microsoft Graph API documentation.
```

## PARAMETERS

### -ODataTypes
An array of OData types for which to retrieve JSON examples.
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

### -Operation
The operation type for which to retrieve JSON examples.
Valid values are "get", "create", and "update".
This parameter is mandatory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Resource
The resource type for which to retrieve JSON examples.
Valid values are "intune-deviceconfig" and "intune-mam".
This parameter is mandatory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -graphApiVersion
The version of the Microsoft Graph API to use.
Valid values are "beta" and "v1.0".
The default value is "beta".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Beta
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
### The cmdlet outputs a custom object containing JSON examples for the specified OData types and operations.
## NOTES
The cmdlet constructs the URL to the Microsoft Graph API documentation for each specified OData type and operation, downloads the markdown content, and parses the JSON examples.

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceOperationJson](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceOperationJson)

