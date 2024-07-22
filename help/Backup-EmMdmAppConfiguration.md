---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmAppConfiguration
schema: 2.0.0
---

# Backup-EmMdmAppConfiguration

## SYNOPSIS
Backs up Intune App Configuration policies to a specified export path.

## SYNTAX

```
Backup-EmMdmAppConfiguration [-ExportPath] <String> [[-AuthObject] <EmMdmAuthBase>]
 [[-graphApiVersion] <String>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Backup-EmMdmAppConfiguration cmdlet connects to Microsoft Graph, retrieves Intune App Configuration policies, and exports them to the specified directory as JSON files.
The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API and includes confirmation prompts for actions with high impact.

## EXAMPLES

### EXAMPLE 1
```
Backup-EmMdmAppConfiguration -ExportPath "C:\Backup\AppConfigurations"
This example connects to Microsoft Graph, retrieves Intune App Configuration policies, and exports them to the specified directory "C:\Backup\AppConfigurations" as JSON files.
```

### EXAMPLE 2
```
$authObject = New-EmMdmGraphAuth -ClientSecretId "your-client-id" -ClientSecretTenantId "your-tenant-id" -ClientSecretValue "your-client-secret"
PS> Backup-EmMdmAppConfiguration -ExportPath "C:\Backup\AppConfigurations" -AuthObject $authObject
This example creates an authentication object using Client Secret authentication and uses it to connect to Microsoft Graph, retrieve Intune App Configuration policies, and export them to the specified directory.
```

## PARAMETERS

### -ExportPath
The directory path where the App Configuration policies will be exported.
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

### [string] The cmdlet accepts a directory path as input.
## OUTPUTS

### [void] This cmdlet does not output any objects.
## NOTES
The cmdlet uses the following functions:
- New-EmMdmBackupDirectory
- Connect-EmMdmGraph
- Get-EmMdmAppConfigurationAPI
- Backup-EmMdmPolicy
- Disconnect-MgGraph

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmAppConfiguration](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmAppConfiguration)

