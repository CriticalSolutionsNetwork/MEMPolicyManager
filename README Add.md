# MemPolicyManager Module

## Summary

- The MemPolicyManager module provides a comprehensive set of cmdlets for managing Microsoft Endpoint Manager policies. This module allows administrators to perform various tasks such as backing up, importing, exporting, and comparing policies through the Microsoft Graph API. It aims to streamline policy management and ensure that configurations are consistent and easily recoverable.
- The module is a personal project and is not officially supported by Microsoft. Use it at your own risk.
- The project was born out of a lack of native PowerShell cmdlets for easily managing Microsoft Endpoint Manager policies. The module aims to fill this gap, and assist me in developing my ability to work with MgGraph.
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
# Application Auth Examples

# Application Permissions required:
#   DeviceManagementConfiguration.ReadWrite.All,
#   DeviceManagementApps.ReadWrite.All,
#   DeviceManagementManagedDevices.ReadWrite.All

## Client Secret Authentication ##
# Application (client) ID, Tenant ID, and Client Secret are required.
    PS C:\> $ClientId = "12345678-1234-1234-1234-123456789012"
    PS C:\> $TenantId = "12345678-1234-1234-1234-123456789012"
### Options for providing the Client Secret value
    # To manually input the Client Secret value, use the following command:
    PS C:\> $ClientSecretPSCredential = Get-Credential -Credential $ClientId
    # To provide the secret value in plain text, use the following command:
    PS C:\> $ClientSecret = ConvertTo-SecureString "<ClientSecretValue>" -AsPlainText
    # To retrieve the secret value from a local Vault, use the following command:
    PS C:\> $ClientSecret = Get-Secret -Name "MgGraphSecret" -VaultName "EmMdmVault"
    # To Create a PSAutomationCredential object with the Client/App Id and Client Secret (as a secure string).
    PS C:\> $ClientSecretPSCredential = [PsCredential]::New($ClientId,$ClientSecret)

    # Create the authentication object with the Client Secret values.
    PS C:\> $authObject = Get-EmMdmGraphAuth -ClientSecretTenantId $TenantId -ClientSecretValue $ClientSecretPSCredential
    # Example Usage: Retrieve the policies using the authentication object.
    PS C:\> $policies = Get-EmMdmAppConfiguration -AuthObject $authObject
### Options for providing the Client Secret value
## Client Secret Authentication ##

# Certificate Authentication Options
## Self-Signed Certificate Authentication ##
    # Create a self-signed certificate and export it to a file.
    PS C:\> $CertName = "EmMdmMgGraphCert" # Replace CN=EmMdmMgGraphCert
    PS C:\> $cert = New-SelfSignedCertificate -Subject "CN=$CertName" -CertStoreLocation "Cert:\CurrentUser\My" `
    -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
    # Export the certificate to a file and upload the public key to the MgGraph application.
    PS C:\> Export-Certificate -Cert $cert -FilePath "C:\temp\$CertName.cer"   ## Specify your preferred location
## Self-Signed Certificate Authentication ##

## Certificate Thumbprint Authentication ##
    # Retrieve the certificate thumbprint from the local certificate store using the previous steps.
    PS C:\> $ThumbPrint = $cert.Thumbprint
    # Retrieve the certificate thumbprint from a local Vault if saved previously.
    PS C:\> $ClientCertThumbPrint = Get-Secret -Name "EmMdmMgGraphThumbprint" -Vault "EmMdmVault" -AsPlainText
    # Create the authentication object with the certificate thumbprint.
    PS C:\> $authObject = Get-EmMdmGraphAuth -CertificateThumbprintClientId $ClientId -CertificateThumbprintTenantId $TenantId -CertificateThumbprint $ClientCertThumbPrint
    # Example Usage: Retrieve the policies using the authentication object.
    PS C:\> $policies = Get-EmMdmAppConfiguration -AuthObject $authObject
## Certificate Thumbprint Authentication ##

## Certificate Name Authentication ##
    PS C:\> $CertName = "CN=EmMdmMgGraphCert"  ## Replace CN=EmMdmMgGraphCert
    PS C:\> $authObject = Get-EmMdmGraphAuth -CertificateNameClientId $ClientId -CertificateNameTenantId $TenantId -CertificateName $CertName
    PS C:\> $policies = Get-EmMdmAppConfiguration -AuthObject $authObject
## Certificate Name Authentication ##

## X509 Certificate Authentication ##
    PS C:\> $ThumbPrint = Get-Secret -Name "EmMdmMgGraphThumbprint" -Vault "EmMdmVault" -AsPlainText
    PS C:\> $Cert = Get-ChildItem Cert:\CurrentUser\My\$ThumbPrint
    PS C:\> $authObject = Get-EmMdmGraphAuth -X509CertificateClientId $ClientId -X509CertificateTenantId $TenantId -X509Certificate $Cert
    PS C:\> $policies = Get-EmMdmAppConfiguration -AuthObject $authObject
## X509 Certificate Authentication ##
## Certificate Authentication Options

## Access Token Authentication ##
    # Instantiate the Client ID, Tenant ID, and Client Secret values.
    $ClientId = "12345678-1234-1234-1234-123456789012"
    $TenantId = "12345678-1234-1234-1234-123456789012"
    $ClientSecret = Get-Secret -Name "MgGraphClientSecret" -Vault "EmMdmVault" -AsPlainText
    $ContentType = "application/x-www-form-urlencoded"
    $scope = "https://graph.microsoft.com/.default"
    # Construct the URI
    $uri = "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token"
    # Construct the body of the request
    $body = @{
        client_id     = $ClientId
        scope         = $scope
        client_secret = $ClientSecret
        grant_type    = "client_credentials"
    }
    # Make the POST request to get the token
    $response = Invoke-RestMethod -Uri $uri -Method Post -ContentType $ContentType -Body $body
    $AccessToken = $response.access_token |  ConvertTo-SecureString -AsPlainText -Force
    # Create the authentication object with the access token.
    $authObject = Get-EmMdmGraphAuth -AccessToken $AccessToken
    # Example Usage: Retrieve the policies using the authentication object.
    $policies = Get-EmMdmAppConfiguration -AuthObject $authObject
## Access Token Authentication ##

## System Assigned Managed Identity Authentication (Azure Resource)##
    # Create the authentication object
    $authObject = Get-EmMdmGraphAuth -SystemAssignedIdentity
    # Example Usage: Retrieve the policies using the authentication object.
    $policies = Get-EmMdmAppConfiguration -AuthObject $authObject
## System Assigned Managed Identity Authentication (Azure Resource)##

## User Assigned Managed Identity Authentication (Azure Resource)##
    # Create the authentication object
    $authObject = Get-EmMdmGraphAuth -UserAuthManagedIdentity "12345678-1234-1234-1234-123456789012"
    # Example Usage: Retrieve the policies using the authentication object.
    $policies = Get-EmMdmAppConfiguration -AuthObject $authObject
## User Assigned Managed Identity Authentication (Azure Resource)##

## Connect using Environment Variables ##
    # Set the environment variables
    $authObject = Get-EmMdmGraphAuth -EnvironmentVariable
    # Example Usage: Retrieve the policies using the authentication object.
    $policies = Get-EmMdmAppConfiguration -AuthObject $authObject
## Connect using Environment Variables ##
```
