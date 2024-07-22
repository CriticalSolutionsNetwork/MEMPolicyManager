---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Compare-EmMgClass
schema: 2.0.0
---

# Compare-EmMgClass

## SYNOPSIS
Compares two PowerShell classes and outputs their differences.

## SYNTAX

```
Compare-EmMgClass [-Class1] <Type> [-Class2] <Type> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Compare-EmMgClass cmdlet compares the properties and methods of two specified PowerShell classes.
It outputs the differences between the classes, if any, or indicates if the classes are identical.

## EXAMPLES

### EXAMPLE 1
```
Compare-EmMgClass -Class1 [ClassA] -Class2 [ClassB]
This example compares ClassA and ClassB, outputting their differences in properties and methods.
```

## PARAMETERS

### -Class1
The first class to compare.
This parameter is mandatory.

```yaml
Type: Type
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Class2
The second class to compare.
This parameter is mandatory.

```yaml
Type: Type
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

### [Type] The cmdlet accepts two class types as input.
## OUTPUTS

### [string] The cmdlet outputs a string indicating whether the classes are different or identical.
### It also outputs the specific property and method differences, if any.
## NOTES
The cmdlet uses the Compare-Object cmdlet to compare properties and methods of the specified classes.

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Compare-EmMgClass](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Compare-EmMgClass)

