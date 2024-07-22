---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmEndpointSecurity
schema: 2.0.0
---

# Import-EmMdmEndpointSecurity

## SYNOPSIS
Imports Intune Endpoint Security policies from a specified JSON file.

## SYNTAX

```
Import-EmMdmEndpointSecurity [-ImportPath] <String> [[-AuthObject] <EmMdmAuthBase>]
 [[-graphApiVersion] <String>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Import-EmMdmEndpointSecurity cmdlet connects to Microsoft Graph, reads an Intune Endpoint Security policy from a specified JSON file, and creates the policy in Intune.
The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.

## EXAMPLES

### EXAMPLE 1
```
Import-EmMdmEndpointSecurity -ImportPath "C:\Backup\EndpointSecurity\Policy.json"
This example connects to Microsoft Graph, reads the Endpoint Security policy from the specified JSON file, and creates the policy in Intune.
```

## PARAMETERS

### -ImportPath
The file path to the JSON file containing the Endpoint Security policy to import.
This parameter is mandatory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
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
The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0".
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

### [string] The cmdlet accepts a file path as input.
## OUTPUTS

### [PSCustomObject] The cmdlet outputs the result of the created policy.
## NOTES
The cmdlet uses the following functions:
- Connect-EmMdmGraph
- Add-EmMdmEndpointSecurity
- Disconnect-MgGraph

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmEndpointSecurity](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmEndpointSecurity)

