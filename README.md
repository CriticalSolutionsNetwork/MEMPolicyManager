# MemPolicyManager Module

## Summary

- The MemPolicyManager module provides a comprehensive set of cmdlets for managing Microsoft Endpoint Manager policies. This module allows administrators to perform various tasks such as backing up, importing, exporting, and comparing policies through the Microsoft Graph API. It aims to streamline policy management and ensure that configurations are consistent and easily recoverable.
- The module is a personal project and is not officially supported by Microsoft. Use it at your own risk.
- The project was born out of a lack of native PowerShell cmdlets for easily managing Microsoft Endpoint Manager policies. The module aims to fill this gap until Microsoft support is more robust.
- The module was inspired and borrows concepts and code from: https://github.com/microsoft/mggraph-intune-samples/tree/main

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
16. [Get-EmMdmGraphAuth](#Get-EmMdmGraphAuth)
17. [Get-EmMdmSoftwareUpdate](#Get-EmMdmSoftwareUpdate)
18. [Get-EmMgMetadataXml](#Get-EmMgMetadataXml)
19. [Get-EmMgMetadataXmlInfo](#Get-EmMgMetadataXmlInfo)
20. [Get-EmMgJsonResourceJson](#Get-EmMgJsonResourceJson)
21. [Get-EmMgResourceOperationJson](#Get-EmMgResourceOperationJson)
22. [Import-EmMdmAppConfiguration](#Import-EmMdmAppConfiguration)
23. [Import-EmMdmAppProtection](#Import-EmMdmAppProtection)
24. [Import-EmMdmCompliance](#Import-EmMdmCompliance)
25. [Import-EmMdmConfiguration](#Import-EmMdmConfiguration)
26. [Import-EmMdmEndpointSecurity](#Import-EmMdmEndpointSecurity)
27. [Import-EmMdmSettingsCatalog](#Import-EmMdmSettingsCatalog)
28. [Import-EmMdmSoftwareUpdate](#Import-EmMdmSoftwareUpdate)

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

### Application Auth Examples

```powershell
### Application Auth Examples

# Application Permissions required:
#   DeviceManagementConfiguration.ReadWrite.All,
#   DeviceManagementApps.ReadWrite.All,
#   DeviceManagementManagedDevices.ReadWrite.All

## Client Secret Authentication ##
# Application (client) ID, Tenant ID, and Client Secret are required.
    PS C:\> $ClientId = "12345678-1234-1234-1234-123456789012"
    PS C:\> $TenantId = "12345678-1234-1234-1234-123456789012"

# To manually input the Client Secret value, use the following command:
# $ClientSecretPSCredential = Get-Credential -Credential $ClientId
# To provide the secret value in plain text, use the following command:
# $ClientSecret = ConvertTo-SecureString "<ClientSecretValue>" -AsPlainText
# To retrieve the secret value from a local Vault, use the following command:
    PS C:\> $ClientSecret = Get-Secret -Name "MgGraphSecret" -VaultName "EmMdmVault"
# Create a PSAutomationCredential object with the Client ID and Client Secret.
    PS C:\> $ClientSecretPSCredential = [PsCredential]::New($ClientId,$ClientSecret)
# Create the authentication object with the Client Secret values.
    PS C:\> $authObject = Get-EmMdmGraphAuth -ClientSecretTenantId $TenantId -ClientSecretValue $ClientSecretPSCredential
    PS C:\> $policies = Get-EmMdmAppConfiguration -AuthObject $authObject

## Self-Signed Certificate Authentication ##
    PS C:\> $CertName = "EmMdmMgGraphCert" # "{certificateName}"    ## Replace {certificateName}
    PS C:\> $cert = New-SelfSignedCertificate -Subject "CN=$CertName" -CertStoreLocation "Cert:\CurrentUser\My" `
    -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
    PS C:\> Export-Certificate -Cert $cert -FilePath "C:\temp\$CertName.cer"   ## Specify your preferred location

## Certificate Thumbprint Authentication ##
    PS C:\> $ThumbPrint = $Cert.Thumbprint
    PS C:\> $ClientCertThumbPrint = Get-Secret -Name "EmMdmMgGraphThumbprint" -Vault "EmMdmVault" -AsPlainText
    PS C:\> $authObject = Get-EmMdmGraphAuth -CertificateThumbprintClientId $ClientId -CertificateThumbprintTenantId $TenantId -CertificateThumbprint $ClientCertThumbPrint
    PS C:\> $policies = Get-EmMdmAppConfiguration -AuthObject $authObject

## Certificate Name Authentication ##
    PS C:\> $CertName = "CN=EmMdmMgGraphCert" # "{certificateName}"    ## Replace {certificateName}
    PS C:\> $authObject = Get-EmMdmGraphAuth -CertificateNameClientId $ClientId -CertificateNameTenantId $TenantId -CertificateName $CertName
    PS C:\> $policies = Get-EmMdmAppConfiguration -AuthObject $authObject

## X509 Certificate Authentication ##
    PS C:\> $ThumbPrint = Get-Secret -Name "EmMdmMgGraphThumbprint" -Vault "EmMdmVault" -AsPlainText
    PS C:\> $Cert = Get-ChildItem Cert:\CurrentUser\My\$ThumbPrint
    PS C:\> $authObject = Get-EmMdmGraphAuth -X509CertificateClientId $ClientId -X509CertificateTenantId $TenantId -X509Certificate $Cert
    PS C:\> $policies = Get-EmMdmAppConfiguration -AuthObject $authObject
```

## Backup-EmMdmAppConfiguration
### Synopsis
Backs up Intune App Configuration policies to a specified export path.
### Syntax
```powershell

Backup-EmMdmAppConfiguration [-ExportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ExportPath</nobr> |  | The directory path where the App Configuration policies will be exported. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a directory path as input.

### Outputs
 - \\[void\] This cmdlet does not output any objects.

### Note
The cmdlet uses the following functions: - New-EmMdmBackupDirectory - Connect-EmMdmGraph - Get-EmMdmAppConfigurationAPI - Backup-EmMdmPolicy - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Backup-EmMdmAppConfiguration -ExportPath "C:\Backup\AppConfigurations"
This example connects to Microsoft Graph, retrieves Intune App Configuration policies, and exports them to the specified directory "C:\Backup\AppConfigurations" as JSON files.
```


**EXAMPLE 2**
```powershell
$authObject = Get-EmMdmGraphAuth -ClientSecretId "your-client-id" -ClientSecretTenantId "your-tenant-id" -ClientSecretValue "your-client-secret"
PS> Backup-EmMdmAppConfiguration -ExportPath "C:\Backup\AppConfigurations" -AuthObject $authObject
This example creates an authentication object using Client Secret authentication and uses it to connect to Microsoft Graph, retrieve Intune App Configuration policies, and export them to the specified directory.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmAppConfiguration](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmAppConfiguration)
## Backup-EmMdmAppProtection
### Synopsis
Backs up Intune App Protection policies to a specified export path.
### Syntax
```powershell

Backup-EmMdmAppProtection [-ExportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ExportPath</nobr> |  | The directory path where the App Protection policies will be exported. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a directory path as input.

### Outputs
 - \\[void\] This cmdlet does not output any objects.

### Note
The cmdlet uses the following functions: - New-EmMdmBackupDirectory - Connect-EmMdmGraph - Get-EmMdmAppProtectionAPI - Backup-EmMdmPolicy - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Backup-EmMdmAppProtection -ExportPath "C:\Backup\AppProtections"
This example connects to Microsoft Graph, retrieves Intune App Protection policies, and exports them to the specified directory "C:\Backup\AppProtections" as JSON files.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmAppProtection](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmAppProtection)
## Backup-EmMdmCompliance
### Synopsis
Backs up Intune Device Compliance policies to a specified export path.
### Syntax
```powershell

Backup-EmMdmCompliance [-ExportPath] <String> [[-OperatingSystem] <String>] [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ExportPath</nobr> |  | The directory path where the Device Compliance policies will be exported. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>OperatingSystem</nobr> |  | The operating system filter for the compliance policies. Valid values are "android", "iOS", "Win10", "macos", and "all". The default value is "all". | false | false | all |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a directory path as input.

### Outputs
 - \\[string\] This cmdlet returns the export path upon successful completion.

### Note
The cmdlet uses the following functions: - New-EmMdmBackupDirectory - Connect-EmMdmGraph - Get-EmMdmComplianceAPI - Backup-EmMdmPolicy - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Backup-EmMdmCompliance -ExportPath "C:\Backup\CompliancePolicies" -OperatingSystem "Win10"
This example connects to Microsoft Graph, retrieves Windows 10 Device Compliance policies, and exports them to the specified directory "C:\Backup\CompliancePolicies" as JSON files.
```


**EXAMPLE 2**
```powershell
Backup-EmMdmCompliance -ExportPath "C:\Backup\CompliancePolicies" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version, retrieves all Device Compliance policies, and exports them to the specified directory "C:\Backup\CompliancePolicies" as JSON files.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmCompliance](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmCompliance)
## Backup-EmMdmConfiguration
### Synopsis
Backs up Intune Device Configuration policies to a specified export path.
### Syntax
```powershell

Backup-EmMdmConfiguration [[-DeviceType] <String>] [-ExportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>DeviceType</nobr> |  | The device type filter for the configuration policies. Valid values are "windows81", "macOSExtensions", "macOSCustom", "macOSDeviceFeatures", "macOSGeneral", "macOSSoftwareUpdate", "macOSEndpointProtection", "androidWorkProfileGeneral", "androidWorkProfileVpn", "windowsHealthMonitoring", "windows81SCEP", "windows10Custom", "windows10EndpointProtection", "windows10General", and "all". The default value is "all". | false | false | all |
| <nobr>ExportPath</nobr> |  | The directory path where the Device Configuration policies will be exported. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a directory path as input.

### Outputs
 - \\[void\] This cmdlet does not output any objects.

### Note
The cmdlet uses the following functions: - New-EmMdmBackupDirectory - Connect-EmMdmGraph - Get-EMMdmConfigurationAPI - Backup-EmMdmPolicy - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Backup-EmMdmConfiguration -DeviceType "windows10General" -ExportPath "C:\Backup\DeviceConfigurations"
This example connects to Microsoft Graph, retrieves Windows 10 General Device Configuration policies, and exports them to the specified directory "C:\Backup\DeviceConfigurations" as JSON files.
```


**EXAMPLE 2**
```powershell
Backup-EmMdmConfiguration -DeviceType "all" -ExportPath "C:\Backup\DeviceConfigurations" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version, retrieves all Device Configuration policies, and exports them to the specified directory "C:\Backup\DeviceConfigurations" as JSON files.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmConfiguration](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmConfiguration)
## Backup-EmMdmEndpointSecurity
### Synopsis
Backs up Intune Endpoint Security policies to a specified export path.
### Syntax
```powershell

Backup-EmMdmEndpointSecurity [-ExportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ExportPath</nobr> |  | The directory path where the Endpoint Security policies will be exported. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a directory path as input.

### Outputs
 - \\[void\] This cmdlet does not output any objects.

### Note
The cmdlet uses the following functions: - New-EmMdmBackupDirectory - Connect-EmMdmGraph - Get-EmEndpointSecurityTemplate - Get-EmDMIntent - Get-EmDMTemplateSettingCategory - Get-EmDMSettingInstance - Backup-EmMdmPolicy - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Backup-EmMdmEndpointSecurity -ExportPath "C:\Backup\EndpointSecurity"
This example connects to Microsoft Graph, retrieves Intune Endpoint Security policies, and exports them to the specified directory "C:\Backup\EndpointSecurity" as JSON files.
```


**EXAMPLE 2**
```powershell
Backup-EmMdmEndpointSecurity -ExportPath "C:\Backup\EndpointSecurity" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version, retrieves Intune Endpoint Security policies, and exports them to the specified directory "C:\Backup\EndpointSecurity" as JSON files.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmEndpointSecurity](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmEndpointSecurity)
## Backup-EmMdmSettingsCatalog
### Synopsis
Backs up Intune Settings Catalog policies to a specified export path.
### Syntax
```powershell

Backup-EmMdmSettingsCatalog [-ExportPath] <String> [[-Platform] <String>] [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ExportPath</nobr> |  | The directory path where the Settings Catalog policies will be exported. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>Platform</nobr> |  | The platform for which to retrieve policies. Valid values are "windows10" and "macOS". The default value is null, which retrieves policies for all platforms. | false | false |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a directory path as input.

### Outputs
 - \\[void\] This cmdlet does not output any objects.

### Note
The cmdlet uses the following functions: - New-EmMdmBackupDirectory - Connect-EmMdmGraph - Get-EmMdmSettingsCatalogAPI - Get-EmMdmSettingsCatalogSettingsAPI - Backup-EmMdmPolicy - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Backup-EmMdmSettingsCatalog -ExportPath "C:\Backup\SettingsCatalog"
This example connects to Microsoft Graph, retrieves Intune Settings Catalog policies, and exports them to the specified directory "C:\Backup\SettingsCatalog" as JSON files.
```


**EXAMPLE 2**
```powershell
Backup-EmMdmSettingsCatalog -ExportPath "C:\Backup\SettingsCatalog" -Platform "windows10"
This example connects to Microsoft Graph, retrieves Intune Settings Catalog policies for Windows 10, and exports them to the specified directory "C:\Backup\SettingsCatalog" as JSON files.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmSettingsCatalog](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmSettingsCatalog)
## Backup-EmMdmSoftwareUpdate
### Synopsis
Backs up Intune Software Update policies to a specified export path.
### Syntax
```powershell

Backup-EmMdmSoftwareUpdate [-ExportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ExportPath</nobr> |  | The directory path where the Software Update policies will be exported. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a directory path as input.

### Outputs
 - \\[void\] This cmdlet does not output any objects.

### Note
The cmdlet uses the following functions: - New-EmMdmBackupDirectory - Connect-EmMdmGraph - Get-EmMdmConfigurationAPI - Backup-EmMdmPolicy - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Backup-EmMdmSoftwareUpdate -ExportPath "C:\Backup\SoftwareUpdates"
This example connects to Microsoft Graph, retrieves Intune Software Update policies, and exports them to the specified directory "C:\Backup\SoftwareUpdates" as JSON files.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmSoftwareUpdate](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Backup-EmMdmSoftwareUpdate)
## Compare-EmMgClass
### Synopsis
Compares two PowerShell classes and outputs their differences.
### Syntax
```powershell

Compare-EmMgClass [-Class1] <Type> [-Class2] <Type> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Class1</nobr> |  | The first class to compare. This parameter is mandatory. | true | false |  |
| <nobr>Class2</nobr> |  | The second class to compare. This parameter is mandatory. | true | false |  |
### Inputs
 - \\[Type\] The cmdlet accepts two class types as input.

### Outputs
 - \\[string\] The cmdlet outputs a string indicating whether the classes are different or identical. It also outputs the specific property and method differences, if any.

### Note
The cmdlet uses the Compare-Object cmdlet to compare properties and methods of the specified classes.

### Examples
**EXAMPLE 1**
```powershell
Compare-EmMgClass -Class1 [ClassA] -Class2 [ClassB]
This example compares ClassA and ClassB, outputting their differences in properties and methods.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Compare-EmMgClass](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Compare-EmMgClass)
## Convert-EmMgJsonToClass
### Synopsis
Converts a JSON string to a PowerShell class definition.
### Syntax
```powershell

Convert-EmMgJsonToClass [-Json] <String> [-ClassName] <String> [-Operation] <String> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Json</nobr> |  | The JSON string to be converted into a PowerShell class. This parameter is mandatory. | true | false |  |
| <nobr>ClassName</nobr> |  | The name of the class to be generated. This parameter is mandatory. | true | false |  |
| <nobr>Operation</nobr> |  | The operation type to customize the generated class. Valid values are "create", "update", and "get". This parameter is mandatory. | true | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a JSON string and a class name as input.

### Outputs
 - \\[string\] The cmdlet outputs the generated PowerShell class definition as a string.

### Note
The cmdlet generates a PowerShell class with properties, a default constructor, and a parameterized constructor based on the JSON string. The cmdlet uses different operations to customize the class properties and constructors.

### Examples
**EXAMPLE 1**
```powershell
$json = '{"name": "Test", "value": 123}'
PS> Convert-EmMgJsonToClass -Json $json -ClassName "TestClass" -Operation "create"
This example converts the JSON string into a PowerShell class named "TestClass" for the "create" operation.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToClass](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToClass)
## Convert-EmMgJsonToFlatObject
### Synopsis
Converts a JSON string or file to a flat PowerShell object.
### Syntax
```powershell

Convert-EmMgJsonToFlatObject -ImportPath <String> [<CommonParameters>]

Convert-EmMgJsonToFlatObject -JSON <String> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ImportPath</nobr> |  | The path to the JSON file to be imported. This parameter is mandatory when using the 'Import' parameter set. | true | true \(ByPropertyName\) |  |
| <nobr>JSON</nobr> |  | The JSON string to be converted to a flat object. This parameter is mandatory when using the 'StringObject' parameter set. | true | true \(ByValue, ByPropertyName\) |  |
### Inputs
 - \\[string\] The cmdlet accepts a JSON string or a file path as input.

### Outputs
 - \\[PSCustomObject\] The cmdlet outputs a flat PowerShell object.

### Note
The cmdlet uses the ConvertTo-FlatObject function to flatten the JSON structure. The cmdlet supports two parameter sets: 'Import' for importing JSON from a file and 'StringObject' for converting JSON strings. Borrowed private function code from: https://powersnippets.com/convertto-flatobject/

### Examples
**EXAMPLE 1**
```powershell
Convert-EmMgJsonToFlatObject -ImportPath "C:\path\to\file.json"
This example imports the JSON file from the specified path and converts it to a flat PowerShell object.
```


**EXAMPLE 2**
```powershell
'{"name": "Test", "value": {"nested": 123}}' | Convert-EmMgJsonToFlatObject
This example takes a JSON string from the pipeline, converts it to a flat PowerShell object, and outputs the result.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToFlatObject](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToFlatObject)
## Get-EmMdmAppConfiguration
### Synopsis
Retrieves Intune App Configuration policies from Microsoft Graph.
### Syntax
```powershell

Get-EmMdmAppConfiguration [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - None. This cmdlet does not accept pipeline input.

### Outputs
 - \\[GetEmMdmTargetedManagedAppConfiguration\\[\]\] The cmdlet returns an array of Intune App Configuration policy objects.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Get-EmMdmAppConfigurationAPI - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Get-EmMdmAppConfiguration
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune App Configuration policies.
```


**EXAMPLE 2**
```powershell
Get-EmMdmAppConfiguration -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune App Configuration policies.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmAppConfiguration](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmAppConfiguration)
## Get-EmMdmAppProtection
### Synopsis
Retrieves Intune App Protection policies from Microsoft Graph.
### Syntax
```powershell

Get-EmMdmAppProtection [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - None. This cmdlet does not accept pipeline input.

### Outputs
 - \\[pscustomobject\\[\]\] The cmdlet returns an array of Intune App Protection policy objects.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Get-EmMdmAppProtectionAPI - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Get-EmMdmAppProtection
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune App Protection policies.
```


**EXAMPLE 2**
```powershell
Get-EmMdmAppProtection -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune App Protection policies.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmAppProtection](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmAppProtection)
## Get-EmMdmCompliance
### Synopsis
Retrieves Intune Device Compliance policies from Microsoft Graph.
### Syntax
```powershell

Get-EmMdmCompliance [[-OperatingSystem] <String>] [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>OperatingSystem</nobr> |  | The operating system for which to retrieve compliance policies. Valid values are "android", "iOS", "Win10", "macos", and "all". The default value is "all". | false | false | all |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - None. This cmdlet does not accept pipeline input.

### Outputs
 - The cmdlet returns an array of Intune Device Compliance policy objects.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Get-EmMdmComplianceAPI - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Get-EmMdmCompliance -OperatingSystem "android"
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Compliance policies for Android devices.
```


**EXAMPLE 2**
```powershell
Get-EmMdmCompliance -OperatingSystem "iOS" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Device Compliance policies for iOS devices.
```


**EXAMPLE 3**
```powershell
Get-EmMdmCompliance
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Compliance policies for all supported operating systems.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmCompliance](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmCompliance)
## Get-EmMdmConfiguration
### Synopsis
Retrieves Intune Device Configuration policies from Microsoft Graph.
### Syntax
```powershell

Get-EmMdmConfiguration [[-DeviceType] <String>] [-AuthObject <EmMdmAuthBase>] [-graphApiVersion <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>DeviceType</nobr> |  | The device type for which to retrieve configuration policies. Valid values are "windows81", "macOSExtensions", "macOSCustom", "macOSDeviceFeatures", "macOSGeneral", "macOSSoftwareUpdate", "macOSEndpointProtection", "androidWorkProfileGeneral", "androidWorkProfileVpn", "windowsHealthMonitoring", "windows81SCEP", "windows10Custom", "windows10EndpointProtection", "windows10General", and "all". The default value is "all". | false | false | all |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - None. This cmdlet does not accept pipeline input.

### Outputs
 - The cmdlet returns an array of Intune Device Configuration policy objects.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Get-EmMdmConfigurationAPI - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Get-EmMdmConfiguration -DeviceType "windows81"
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Configuration policies for Windows 8.1 devices.
```


**EXAMPLE 2**
```powershell
Get-EmMdmConfiguration -DeviceType "macOSGeneral" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Device Configuration policies for macOS devices.
```


**EXAMPLE 3**
```powershell
Get-EmMdmConfiguration
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Configuration policies for all supported device types.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmConfiguration](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmConfiguration)
## Get-EmMdmEndpointSecurity
### Synopsis
Retrieves Intune Endpoint Security policies from Microsoft Graph.
### Syntax
```powershell

Get-EmMdmEndpointSecurity [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - None. This cmdlet does not accept pipeline input.

### Outputs
 - EmDManagementIntentInstanceCustom\\[\] The cmdlet returns an array of EmDManagementIntentInstanceCustom objects representing the Endpoint Security policies.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Get-EmEndpointSecurityTemplate - Get-EmDMIntent - Get-EmDMTemplateSettingCategory - Get-EmDMSettingInstance - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Get-EmMdmEndpointSecurity -graphApiVersion $graphApiVersion
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Endpoint Security policies.
```


**EXAMPLE 2**
```powershell
Get-EmMdmEndpointSecurity -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Endpoint Security policies.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmEndpointSecurity](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmEndpointSecurity)
## Get-EmMdmGraphAuth
### Synopsis
Creates an authentication object for connecting to Microsoft Graph using various authentication methods.
### Syntax
```powershell

Get-EmMdmGraphAuth [-ClientSecretTenantId] <String> [-ClientSecretValue] <PSCredential> [<CommonParameters>]

Get-EmMdmGraphAuth [-CertificateThumbprintClientId] <String> [-CertificateThumbprintTenantId] <String> [-CertificateThumbprint] <String> [<CommonParameters>]

Get-EmMdmGraphAuth [-CertificateNameClientId] <String> [-CertificateNameTenantId] <String> [-CertificateName] <String> [<CommonParameters>]

Get-EmMdmGraphAuth [-ManagedIdentity] <String> [<CommonParameters>]

Get-EmMdmGraphAuth [-SystemAssignedIdentity] [<CommonParameters>]

Get-EmMdmGraphAuth [-AccessToken] <SecureString> [<CommonParameters>]

Get-EmMdmGraphAuth [-EnvironmentVariable] [<CommonParameters>]

Get-EmMdmGraphAuth [-X509CertificateClientId] <String> [-X509Certificate] <X509Certificate> [-X509CertificateTenantId] <String> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ClientSecretTenantId</nobr> |  | The Tenant ID for the application using Client Secret authentication. Mandatory for ClientSecret parameter set. | true | false |  |
| <nobr>ClientSecretValue</nobr> |  | The Client Secret value for the application using Client Secret authentication. Mandatory for ClientSecret parameter set. Must be a PSCredential object. | true | false |  |
| <nobr>CertificateThumbprintClientId</nobr> |  | The Client ID for the application using Certificate Thumbprint authentication. Mandatory for CertificateThumbprint parameter set. | true | false |  |
| <nobr>CertificateThumbprintTenantId</nobr> |  | The Tenant ID for the application using Certificate Thumbprint authentication. Mandatory for CertificateThumbprint parameter set. | true | false |  |
| <nobr>CertificateThumbprint</nobr> |  | The Certificate Thumbprint for the application using Certificate Thumbprint authentication. Mandatory for CertificateThumbprint parameter set. | true | false |  |
| <nobr>CertificateNameClientId</nobr> |  | The Client ID for the application using Certificate Name authentication. Mandatory for CertificateName parameter set. | true | false |  |
| <nobr>CertificateNameTenantId</nobr> |  | The Tenant ID for the application using Certificate Name authentication. Mandatory for CertificateName parameter set. | true | false |  |
| <nobr>CertificateName</nobr> |  | The Certificate Name for the application using Certificate Name authentication. Mandatory for CertificateName parameter set. | true | false |  |
| <nobr>ManagedIdentity</nobr> |  | The Client ID for the Managed Identity. Mandatory for ManagedIdentity parameter set. | true | false |  |
| <nobr>SystemAssignedIdentity</nobr> |  | Indicates the use of a System Assigned Identity for authentication. Mandatory for SystemAssignedIdentity parameter set. | true | false | False |
| <nobr>AccessToken</nobr> |  | Specifies a bearer token for Microsoft Graph service. Mandatory for AccessToken parameter set. | true | false |  |
| <nobr>EnvironmentVariable</nobr> |  | Allows for authentication using environment variables configured on the host machine. Mandatory for EnvironmentVariable parameter set. | true | false | False |
| <nobr>X509CertificateClientId</nobr> |  | The client id of your application for X509 certificate authentication. Mandatory for X509Certificate parameter set. | true | false |  |
| <nobr>X509Certificate</nobr> |  |  | true | false |  |
| <nobr>X509CertificateTenantId</nobr> |  | The id of the tenant to connect to for X509 certificate authentication. Mandatory for X509Certificate parameter set. | true | false |  |
### Inputs
 - None

### Outputs
 - PSCustomObject Returns an authentication object for connecting to Microsoft Graph.

### Note
https://criticalsolutionsnetwork.github.io/MemPolicyManager/\\#Get-EmMdmGraphAuth

### Examples
**EXAMPLE 1**
```powershell
$authObject = Get-EmMdmGraphAuth -ClientSecretTenantId $TenantId -ClientSecretValue $ClientSecretPSCredential
Creates an authentication object using Client Secret authentication.
The Client Secret value is provided as a PSCredential object.
# $ClientId = "<your-client-id>"
# ClientSecret = ConvertTo-SecureString -String "<your-client-secret>" -AsPlainText -Force
# Ex: $ClientSecretPSCredential = [PsCredential]::New($ClientId,$ClientSecret)
```


**EXAMPLE 2**
```powershell
$authObject = Get-EmMdmGraphAuth -CertificateThumbprintClientId $ClientId -CertificateThumbprintTenantId $TenantId -CertificateThumbprint $ClientCertThumbPrint
Creates an authentication object using Certificate Thumbprint authentication.
```


**EXAMPLE 3**
```powershell
$authObject = Get-EmMdmGraphAuth -CertificateNameClientId $ClientId -CertificateNameTenantId $TenantId -CertificateName $CertName
Creates an authentication object using Certificate Name authentication.
```


**EXAMPLE 4**
```powershell
$authObject = Get-EmMdmGraphAuth -ManagedIdentity "your-client-id"
Creates an authentication object using Managed Identity authentication.
```


**EXAMPLE 5**
```powershell
$authObject = Get-EmMdmGraphAuth -SystemAssignedIdentity
Creates an authentication object using System Assigned Identity authentication.
```


**EXAMPLE 6**
```powershell
$authObject = Get-EmMdmGraphAuth -AccessToken (ConvertTo-SecureString -String "your-access-token" -AsPlainText -Force)
Creates an authentication object using Access Token authentication.
```


**EXAMPLE 7**
```powershell
$authObject = Get-EmMdmGraphAuth -EnvironmentVariable
Creates an authentication object using Environment Variable authentication.
```


**EXAMPLE 8**
```powershell
$authObject = Get-EmMdmGraphAuth -X509CertificateClientId $ClientId -X509CertificateTenantId $TenantId -X509Certificate $Cert
Creates an authentication object using X509 Certificate authentication.
```


## Get-EmMdmSoftwareUpdate
### Synopsis
Retrieves Intune Device Update policies from Microsoft Graph.
### Syntax
```powershell

Get-EmMdmSoftwareUpdate [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - None. This cmdlet does not accept pipeline input.

### Outputs
 - \\[pscustomobject\\[\]\] The cmdlet returns an array of PSCustomObject representing the Device Update policies.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Get-EmMdmConfigurationAPI - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Get-EmMdmSoftwareUpdate -graphApiVersion $graphApiVersion
This example connects to Microsoft Graph using the 'beta' API version and retrieves Intune Device Update policies.
```


**EXAMPLE 2**
```powershell
Get-EmMdmSoftwareUpdate -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and retrieves Intune Device Update policies.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmSoftwareUpdate](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmSoftwareUpdate)
## Get-EmMgMetadataXml
### Synopsis
Downloads the Microsoft Graph metadata XML file.
### Syntax
```powershell

Get-EmMgMetadataXml [-OutputPath] <String> [-graphApiVersion <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>OutputPath</nobr> |  | The file path where the metadata XML file will be saved. This parameter is mandatory. | true | true \(ByPropertyName\) |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
### Inputs
 - None. This cmdlet does not accept pipeline input.

### Outputs
 - \\[string\] The cmdlet outputs a message indicating the success or failure of the metadata XML download.

### Note
The cmdlet uses the following functions: - Invoke-WebRequest

### Examples
**EXAMPLE 1**
```powershell
Get-EmMgMetadataXml -OutputPath "C:\GraphMetadata\metadata.xml"
This example connects to Microsoft Graph using the 'beta' API version and downloads the metadata XML file to "C:\GraphMetadata\metadata.xml".
```


**EXAMPLE 2**
```powershell
Get-EmMgMetadataXml -OutputPath "C:\GraphMetadata\metadata.xml" -graphApiVersion "v1.0"
This example connects to Microsoft Graph using the 'v1.0' API version and downloads the metadata XML file to "C:\GraphMetadata\metadata.xml".
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXml](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXml)
## Get-EmMgMetadataXmlInfo
### Synopsis
Retrieves metadata information for a specific entity type from a Microsoft Graph metadata XML file.
### Syntax
```powershell

Get-EmMgMetadataXmlInfo [-XmlFilePath] <String> [-TypeName] <String> [[-InfoType] <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>XmlFilePath</nobr> |  | The file path to the Microsoft Graph metadata XML file. This parameter is mandatory. | true | false |  |
| <nobr>TypeName</nobr> |  | The name of the entity type to retrieve information for. This parameter is mandatory. | true | false |  |
| <nobr>InfoType</nobr> |  | The type of information to retrieve. Default is "EntityType". | false | false | EntityType |
### Inputs
 - None. This cmdlet does not accept pipeline input.

### Outputs
 - \\[PSCustomObject\] The cmdlet outputs a custom object containing detailed information about the specified entity type, including its properties, methods, actions, enums, relationships, and a JSON representation.

### Note
The cmdlet uses XPath queries to navigate the metadata XML and extract relevant information.

### Examples
**EXAMPLE 1**
```powershell
Get-EmMgMetadataXmlInfo -XmlFilePath "C:\GraphMetadata\metadata.xml" -TypeName "User"
This example retrieves metadata information for the 'User' entity type from the specified Microsoft Graph metadata XML file.
```


**EXAMPLE 2**
```powershell
Get-EmMgMetadataXmlInfo -XmlFilePath "C:\GraphMetadata\metadata.xml" -TypeName "Device"
This example retrieves metadata information for the 'Device' entity type from the specified Microsoft Graph metadata XML file.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXmlInfo](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXmlInfo)
## Get-EmMgResourceJson
### Synopsis
Retrieves JSON resource and property information from Microsoft Graph API documentation.
### Syntax
```powershell

Get-EmMgResourceJson [-ODataTypes] <String[]> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ODataTypes</nobr> |  | An array of OData types for which to retrieve JSON resource data. This parameter is mandatory. | true | false |  |
### Inputs
 - \\[string\\[\]\] The cmdlet accepts an array of OData types as input.

### Outputs
 - \\[PSCustomObject\] The cmdlet outputs a custom object containing the JSON representation and properties table of the specified OData types.

### Note
The cmdlet constructs the URL to the Microsoft Graph API documentation for each specified OData type, downloads the markdown content, and parses the JSON resource data and properties table.

### Examples
**EXAMPLE 1**
```powershell
Get-EmMgResourceJson -ODataTypes "macOSExtensionsConfiguration", "windows81TrustedRootCertificate"
This example retrieves JSON resource data and properties table for the specified OData types from Microsoft Graph API documentation.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceJson](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceJson)
## Get-EmMgResourceOperationJson
### Synopsis
Retrieves JSON examples for specified OData types and operations from Microsoft Graph API documentation.
### Syntax
```powershell

Get-EmMgResourceOperationJson [-ODataTypes] <String[]> [-Operation] <String> [-Resource] <String> [[-graphApiVersion] <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ODataTypes</nobr> |  | An array of OData types for which to retrieve JSON examples. This parameter is mandatory. | true | false |  |
| <nobr>Operation</nobr> |  | The operation type for which to retrieve JSON examples. Valid values are "get", "create", and "update". This parameter is mandatory. | true | false |  |
| <nobr>Resource</nobr> |  | The resource type for which to retrieve JSON examples. Valid values are "intune-deviceconfig" and "intune-mam". This parameter is mandatory. | true | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
### Inputs
 - \\[string\\[\]\] The cmdlet accepts an array of OData types as input.

### Outputs
 - \\[PSCustomObject\] The cmdlet outputs a custom object containing JSON examples for the specified OData types and operations.

### Note
The cmdlet constructs the URL to the Microsoft Graph API documentation for each specified OData type and operation, downloads the markdown content, and parses the JSON examples.

### Examples
**EXAMPLE 1**
```powershell
Get-EmMgResourceOperationJson -ODataTypes "androidCompliancePolicy", "iosCompliancePolicy" -Operation "get" -Resource "intune-deviceconfig"
This example retrieves JSON examples for the specified OData types and get operations from Microsoft Graph API documentation.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceOperationJson](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgResourceOperationJson)
## Import-EmMdmAppConfiguration
### Synopsis
Imports Intune App Configuration policies from a specified JSON file.
### Syntax
```powershell

Import-EmMdmAppConfiguration [-ImportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ImportPath</nobr> |  | The file path to the JSON file containing the App Configuration policy to import. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a file path as input.

### Outputs
 - \\[string\] The cmdlet outputs the ID of the created policy.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Add-EmMdmAppConfiguration - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Import-EmMdmAppConfiguration -ImportPath "C:\Backup\AppConfigurations\Policy.json"
This example connects to Microsoft Graph, reads the App Configuration policy from the specified JSON file, and creates the policy in Intune.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmAppConfiguration](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmAppConfiguration)
## Import-EmMdmAppProtection
### Synopsis
Imports Intune App Protection policies from a specified JSON file.
### Syntax
```powershell

Import-EmMdmAppProtection [-ImportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ImportPath</nobr> |  | The file path to the JSON file containing the App Protection policy to import. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a file path as input.

### Outputs
 - \\[string\] The cmdlet outputs the ID of the created policy.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Add-EmMdmAppProtection - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Import-EmMdmAppProtection -ImportPath "C:\Backup\AppProtections\Policy.json"
This example connects to Microsoft Graph, reads the App Protection policy from the specified JSON file, and creates the policy in Intune.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmAppProtection](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmAppProtection)
## Import-EmMdmCompliance
### Synopsis
Imports Intune Compliance policies from a specified JSON file.
### Syntax
```powershell

Import-EmMdmCompliance [-ImportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ImportPath</nobr> |  | The file path to the JSON file containing the Compliance policy to import. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a file path as input.

### Outputs
 - \\[pscustomobject\] The cmdlet outputs the result of the created policy.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Add-EmMdmCompliance - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Import-EmMdmCompliance -ImportPath "C:\Backup\CompliancePolicies\Policy.json"
This example connects to Microsoft Graph, reads the Compliance policy from the specified JSON file, and creates the policy in Intune.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmCompliance](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmCompliance)
## Import-EmMdmConfiguration
### Synopsis
Imports Intune Device Configuration policies from a specified JSON file.
### Syntax
```powershell

Import-EmMdmConfiguration [-ImportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ImportPath</nobr> |  | The file path to the JSON file containing the Device Configuration policy to import. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a file path as input.

### Outputs
 - \\[string\] The cmdlet outputs the result of the created policy.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Add-EmMdmConfiguration - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Import-EmMdmConfiguration -ImportPath "C:\Backup\DeviceConfigurations\Policy.json"
This example connects to Microsoft Graph, reads the Device Configuration policy from the specified JSON file, and creates the policy in Intune.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmConfiguration](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmConfiguration)
## Import-EmMdmEndpointSecurity
### Synopsis
Imports Intune Endpoint Security policies from a specified JSON file.
### Syntax
```powershell

Import-EmMdmEndpointSecurity [-ImportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ImportPath</nobr> |  | The file path to the JSON file containing the Endpoint Security policy to import. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a file path as input.

### Outputs
 - \\[PSCustomObject\] The cmdlet outputs the result of the created policy.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Add-EmMdmEndpointSecurity - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Import-EmMdmEndpointSecurity -ImportPath "C:\Backup\EndpointSecurity\Policy.json"
This example connects to Microsoft Graph, reads the Endpoint Security policy from the specified JSON file, and creates the policy in Intune.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmEndpointSecurity](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmEndpointSecurity)
## Import-EmMdmSettingsCatalog
### Synopsis
Imports Intune Settings Catalog policies from a specified JSON file.
### Syntax
```powershell

Import-EmMdmSettingsCatalog [-ImportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ImportPath</nobr> |  | The file path to the JSON file containing the Settings Catalog policy to import. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a file path as input.

### Outputs
 - \\[void\] This cmdlet does not output any objects.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Add-EmMdmSettingsCatalog - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Import-EmMdmSettingsCatalog -ImportPath "C:\Backup\SettingsCatalog\Policy.json"
This example connects to Microsoft Graph, reads the Settings Catalog policy from the specified JSON file, and creates the policy in Intune.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmSettingsCatalog](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmSettingsCatalog)
## Import-EmMdmSoftwareUpdate
### Synopsis
Imports Intune Software Update policies from a specified JSON file.
### Syntax
```powershell

Import-EmMdmSoftwareUpdate [-ImportPath] <String> [[-AuthObject] <EmMdmAuthBase>] [[-graphApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ImportPath</nobr> |  | The file path to the JSON file containing the Software Update policy to import. This parameter is mandatory. | true | true \(ByValue, ByPropertyName\) |  |
| <nobr>AuthObject</nobr> |  | The authentication object used for connecting to Microsoft Graph. | false | false |  |
| <nobr>graphApiVersion</nobr> |  | The version of the Microsoft Graph API to use. Valid values are "beta" and "v1.0". The default value is "beta". | false | false | beta |
| <nobr>WhatIf</nobr> | wi |  | false | false |  |
| <nobr>Confirm</nobr> | cf |  | false | false |  |
### Inputs
 - \\[string\] The cmdlet accepts a file path as input.

### Outputs
 - \\[string\] The ID of the created policy.

### Note
The cmdlet uses the following functions: - Connect-EmMdmGraph - Add-EmMdmConfiguration - Disconnect-MgGraph

### Examples
**EXAMPLE 1**
```powershell
Import-EmMdmSoftwareUpdate -ImportPath "C:\Backup\SoftwareUpdates\Policy.json"
This example connects to Microsoft Graph, reads the Software Update policy from the specified JSON file, and creates the policy in Intune.
```


### Links

 - [https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmSoftwareUpdate](https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Import-EmMdmSoftwareUpdate)
