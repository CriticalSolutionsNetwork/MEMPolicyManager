# MemPolicyManager Module

## Summary

- The MemPolicyManager module provides a comprehensive set of cmdlets for managing Microsoft Endpoint Manager policies. This module allows administrators to perform various tasks such as backing up, importing, exporting, and comparing policies through the Microsoft Graph API. It aims to streamline policy management and ensure that configurations are consistent and easily recoverable.

## Note

The graphApiVersion parameter is experimental and may not work as expected. The default value is "beta". Do not change the value until further notice.

# Table of Contents
1. [Backup-EmMdmAppConfiguration](#Backup-EmMdmAppConfiguration)
2. [Backup-EmMdmAppProtection](#Backup-EmMdmAppProtection)
3. [Backup-EmMdmCompliance](#Backup-EmMdmCompliance)
4. [Backup-EmMdmConfiguration](#Backup-EmMdmConfiguration)
5. [Backup-EmMdmEndpointSecurity](#Backup-EmMdmEndpointSecurity)
6. [Backup-EmMdmSettingsCatalog](#Backup-EmMdmSettingsCatalog)
7. [Backup-EmMdmSoftwareUpdate](#Backup-EmMdmSoftwareUpdate)
8. [Compare-EmMgClass](#Compare-EmMgClass)
9. [Convert-EmMgJsonToClass](#Convert-EmMgJsonToClass)
10. [Convert-EmMgJsonToFlatObject](#Convert-EmMgJsonToFlatObject)
11. [Get-EmMdmAppConfiguration](#Get-EmMdmAppConfiguration)
12. [Get-EmMdmAppProtection](#Get-EmMdmAppProtection)
13. [Get-EmMdmCompliance](#Get-EmMdmCompliance)
14. [Get-EmMdmConfiguration](#Get-EmMdmConfiguration)
15. [Get-EmMdmEndpointSecurity](#Get-EmMdmEndpointSecurity)
16. [Get-EmMdmSoftwareUpdate](#Get-EmMdmSoftwareUpdate)
17. [Get-EmMgMetadataXml](#Get-EmMgMetadataXml)
18. [Get-EmMgMetadataXmlInfo](#Get-EmMgMetadataXmlInfo)
19. [Get-EmMgJsonResourceJson](#Get-EmMgJsonResourceJson)
20. [Get-EmMgResourceOperationJson](#Get-EmMgResourceOperationJson)
21. [Import-EmMdmAppConfiguration](#Import-EmMdmAppConfiguration)
22. [Import-EmMdmAppProtection](#Import-EmMdmAppProtection)
23. [Import-EmMdmCompliance](#Import-EmMdmCompliance)
24. [Import-EmMdmConfiguration](#Import-EmMdmConfiguration)
25. [Import-EmMdmEndpointSecurity](#Import-EmMdmEndpointSecurity)
26. [Import-EmMdmSettingsCatalog](#Import-EmMdmSettingsCatalog)
27. [Import-EmMdmSoftwareUpdate](#Import-EmMdmSoftwareUpdate)

## Examples

### Backup-EmMdmAppConfiguration

```powershell
# Example 1: Backing up all App Configuration policies
Backup-EmMdmAppConfiguration -ExportPath "C:\Backup\AppConfigurations"
```

### Import-EmMdmAppProtection

```powershell
# Example 1: Importing App Protection Policy from JSON file
Import-EmMdmAppConfiguration -ImportPath "C:\Backup\AppConfigurationPolicy.json"
```
