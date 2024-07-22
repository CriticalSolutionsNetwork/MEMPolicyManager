---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmConfiguration
schema: 2.0.0
---

# Backup-EmMdmConfiguration

## SYNOPSIS
Backs up Intune Device Configuration policies to a specified export path.

## SYNTAX

```
Backup-EmMdmConfiguration [[-DeviceType] <String>] [-ExportPath] <String> [[-AuthObject] <EmMdmAuthBase>]
 [[-graphApiVersion] <String>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Backup-EmMdmConfiguration cmdlet connects to Microsoft Graph, retrieves Intune Device Configuration policies, and exports them to the specified directory as JSON files.
The cmdlet supports filtering policies by device type and allows selecting between 'beta' and 'v1.0' versions of the Graph API.
The cmdlet includes confirmation prompts for actions with high impact.

## EXAMPLES

### EXAMPLE 1
```
Backup-EmMdmConfiguration -DeviceType "windows10General" -ExportPath "C:\Backup\DeviceConfigurations"
This example connects to Microsoft Graph, retrieves Windows 10 General Device Configuration policies, and exports them to the specified directory "C:\Backup\DeviceConfigurations" as JSON files.
```

### EXAMPLE 2
```
Backup-EmMdmConfiguration -DeviceType "all" -ExportPath "C:\Backup\DeviceConfigurations" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version, retrieves all Device Configuration policies, and exports them to the specified directory "C:\Backup\DeviceConfigurations" as JSON files.
```

## PARAMETERS

### -DeviceType
The device type filter for the configuration policies.
Valid values are "windows81", "macOSExtensions", "macOSCustom", "macOSDeviceFeatures", "macOSGeneral", "macOSSoftwareUpdate", "macOSEndpointProtection", "androidWorkProfileGeneral", "androidWorkProfileVpn", "windowsHealthMonitoring", "windows81SCEP", "windows10Custom", "windows10EndpointProtection", "windows10General", and "all".
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

### -ExportPath
The directory path where the Device Configuration policies will be exported.
This parameter is mandatory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
Position: 3
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
Position: 4
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
- Get-EMMdmConfigurationAPI
- Backup-EmMdmPolicy
- Disconnect-MgGraph

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmConfiguration](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmConfiguration)

