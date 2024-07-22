---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version: https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXmlInfo
schema: 2.0.0
---

# Get-EmMgMetadataXmlInfo

## SYNOPSIS
Retrieves metadata information for a specific entity type from a Microsoft Graph metadata XML file.

## SYNTAX

```
Get-EmMgMetadataXmlInfo [-XmlFilePath] <String> [-TypeName] <String> [[-InfoType] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-EmMgMetadataXmlInfo cmdlet parses a Microsoft Graph metadata XML file and retrieves detailed information for a specified entity type.
It gathers properties, methods, actions, enums, and relationships related to the entity type, and provides a JSON representation of the entity.

## EXAMPLES

### EXAMPLE 1
```
Get-EmMgMetadataXmlInfo -XmlFilePath "C:\GraphMetadata\metadata.xml" -TypeName "User"
This example retrieves metadata information for the 'User' entity type from the specified Microsoft Graph metadata XML file.
```

### EXAMPLE 2
```
Get-EmMgMetadataXmlInfo -XmlFilePath "C:\GraphMetadata\metadata.xml" -TypeName "Device"
This example retrieves metadata information for the 'Device' entity type from the specified Microsoft Graph metadata XML file.
```

## PARAMETERS

### -XmlFilePath
The file path to the Microsoft Graph metadata XML file.
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

### -TypeName
The name of the entity type to retrieve information for.
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

### -InfoType
The type of information to retrieve.
Default is "EntityType".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: EntityType
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

### [PSCustomObject]
### The cmdlet outputs a custom object containing detailed information about the specified entity type, including its properties, methods, actions, enums, relationships, and a JSON representation.
## NOTES
The cmdlet uses XPath queries to navigate the metadata XML and extract relevant information.

## RELATED LINKS

[https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXmlInfo](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXmlInfo)

