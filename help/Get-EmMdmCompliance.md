---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmCompliance
schema: 2.0.0
---

# Get-EmMdmCompliance

## SYNOPSIS
Retrieves Intune Device Compliance policies from Microsoft Graph.

## SYNTAX

```
Get-EmMdmCompliance [[-OperatingSystem] <String>] [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Get-EmMdmCompliance cmdlet connects to Microsoft Graph using the specified API version and retrieves Intune Device Compliance policies for a specified operating system.
The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API.

## EXAMPLES

### EXAMPLE 1
```
Get-EmMdmCompliance -OperatingSystem "android"
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Compliance policies for Android devices.
```

### EXAMPLE 2
```
Get-EmMdmCompliance -OperatingSystem "iOS" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Device Compliance policies for iOS devices.
```

### EXAMPLE 3
```
Get-EmMdmCompliance
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Compliance policies for all supported operating systems.
```

## PARAMETERS

### -OperatingSystem
The operating system for which to retrieve compliance policies.
Valid values are "android", "iOS", "Win10", "macos", and "all".
The default value is "all".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: All
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthObject
The authentication object used for connecting to Microsoft Graph.

```yaml
Type: EmMdmAuthBase
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
Position: 3
Default value: Beta
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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

### None. This cmdlet does not accept pipeline input.
## OUTPUTS

### The cmdlet returns an array of Intune Device Compliance policy objects.
## NOTES
The cmdlet uses the following functions:
- Connect-EmMdmGraph
- Get-EmMdmComplianceAPI
- Disconnect-MgGraph

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmCompliance](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmCompliance)

