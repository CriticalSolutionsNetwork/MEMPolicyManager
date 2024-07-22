---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToClass
schema: 2.0.0
---

# Convert-EmMgJsonToClass

## SYNOPSIS
Converts a JSON string to a PowerShell class definition.

## SYNTAX

```
Convert-EmMgJsonToClass [-Json] <String> [-ClassName] <String> [-Operation] <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Convert-EmMgJsonToClass cmdlet takes a JSON string and a class name as input and generates a PowerShell class definition.
The cmdlet supports different operations (create, update, get) to customize the generated class properties and constructors.

## EXAMPLES

### EXAMPLE 1
```
$json = '{"name": "Test", "value": 123}'
PS> Convert-EmMgJsonToClass -Json $json -ClassName "TestClass" -Operation "create"
This example converts the JSON string into a PowerShell class named "TestClass" for the "create" operation.
```

## PARAMETERS

### -Json
The JSON string to be converted into a PowerShell class.
This parameter is mandatory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClassName
The name of the class to be generated.
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

### -Operation
The operation type to customize the generated class.
Valid values are "create", "update", and "get".
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

### [string] The cmdlet accepts a JSON string and a class name as input.
## OUTPUTS

### [string] The cmdlet outputs the generated PowerShell class definition as a string.
## NOTES
The cmdlet generates a PowerShell class with properties, a default constructor, and a parameterized constructor based on the JSON string.
The cmdlet uses different operations to customize the class properties and constructors.

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToClass](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToClass)

