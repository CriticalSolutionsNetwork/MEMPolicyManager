---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXml
schema: 2.0.0
---

# Get-EmMgMetadataXml

## SYNOPSIS
Downloads the Microsoft Graph metadata XML file.

## SYNTAX

```
Get-EmMgMetadataXml [-OutputPath] <String> [-graphApiVersion <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The Get-EmMgMetadataXml cmdlet connects to Microsoft Graph using the specified API version and downloads the metadata XML file to the specified output path.
The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API.

## EXAMPLES

### EXAMPLE 1
```
Get-EmMgMetadataXml -OutputPath "C:\GraphMetadata\metadata.xml"
This example connects to Microsoft Graph using the 'beta' API version and downloads the metadata XML file to "C:\GraphMetadata\metadata.xml".
```

### EXAMPLE 2
```
Get-EmMgMetadataXml -OutputPath "C:\GraphMetadata\metadata.xml" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and downloads the metadata XML file to "C:\GraphMetadata\metadata.xml".
```

## PARAMETERS

### -OutputPath
The file path where the metadata XML file will be saved.
This parameter is mandatory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
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

### [string]
### The cmdlet outputs a message indicating the success or failure of the metadata XML download.
## NOTES
The cmdlet uses the following functions:
- Invoke-WebRequest

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXml](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXml)

