---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmEndpointSecurity
schema: 2.0.0
---

# Get-EmMdmEndpointSecurity

## SYNOPSIS
Retrieves Intune Endpoint Security policies from Microsoft Graph.

## SYNTAX

```
Get-EmMdmEndpointSecurity [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Get-EmMdmEndpointSecurity cmdlet connects to Microsoft Graph using the specified API version and retrieves Intune Endpoint Security policies.
The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API.

## EXAMPLES

### EXAMPLE 1
```
Get-EmMdmEndpointSecurity -graphApiVersion "beta"
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Endpoint Security policies.
```

### EXAMPLE 2
```
Get-EmMdmEndpointSecurity -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Endpoint Security policies.
```

## PARAMETERS

### -AuthObject
The authentication object used for connecting to Microsoft Graph.

```yaml
Type: EmMdmAuthBase
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
Position: 2
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

### EmDManagementIntentInstanceCustom[]
### The cmdlet returns an array of EmDManagementIntentInstanceCustom objects representing the Endpoint Security policies.
## NOTES
The cmdlet uses the following functions:
- Connect-EmMdmGraph
- Get-EmEndpointSecurityTemplate
- Get-EmDMIntent
- Get-EmDMTemplateSettingCategory
- Get-EmDMSettingInstance
- Disconnect-MgGraph

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmEndpointSecurity](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmEndpointSecurity)

