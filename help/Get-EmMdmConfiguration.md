---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmConfiguration
schema: 2.0.0
---

# Get-EmMdmConfiguration

## SYNOPSIS
Retrieves Intune Device Configuration policies from Microsoft Graph.

## SYNTAX

```
Get-EmMdmConfiguration [[-DeviceType] <String>] [-AuthObject <EmMdmAuthBase>] [-graphApiVersion <String>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Get-EmMdmConfiguration cmdlet connects to Microsoft Graph using the specified API version and retrieves Intune Device Configuration policies for a specified device type.
The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API.

## EXAMPLES

### EXAMPLE 1
```
Get-EmMdmConfiguration -DeviceType "windows81"
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Configuration policies for Windows 8.1 devices.
```

### EXAMPLE 2
```
Get-EmMdmConfiguration -DeviceType "macOSGeneral" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Device Configuration policies for macOS devices.
```

### EXAMPLE 3
```
Get-EmMdmConfiguration
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Configuration policies for all supported device types.
```

## PARAMETERS

### -DeviceType
The device type for which to retrieve configuration policies.
Valid values are "windows81", "macOSExtensions", "macOSCustom", "macOSDeviceFeatures", "macOSGeneral", "macOSSoftwareUpdate", "macOSEndpointProtection",
"androidWorkProfileGeneral", "androidWorkProfileVpn", "windowsHealthMonitoring", "windows81SCEP", "windows10Custom", "windows10EndpointProtection", "windows10General", and "all".
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
Position: Named
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
Position: Named
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

### The cmdlet returns an array of Intune Device Configuration policy objects.
## NOTES
The cmdlet uses the following functions:
- Connect-EmMdmGraph
- Get-EmMdmConfigurationAPI
- Disconnect-MgGraph

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmConfiguration](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmConfiguration)

