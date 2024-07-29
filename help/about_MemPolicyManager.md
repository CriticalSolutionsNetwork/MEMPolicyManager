# MemPolicyManager
## about_MemPolicyManager

# SHORT DESCRIPTION

- A PowerShell module for managing Microsoft Endpoint Manager policies, including backup, import, export, and comparison using Microsoft Graph API.

# LONG DESCRIPTION

- The MemPolicyManager module provides a comprehensive set of cmdlets for managing Microsoft Endpoint Manager policies. This module allows administrators to perform various tasks such as backing up, importing, exporting, and comparing policies through the Microsoft Graph API. It aims to streamline policy management and ensure that configurations are consistent and easily recoverable.

# EXAMPLES

```powershell
    # Backup Examples

    # Backup Intune App Configuration policies to a specified directory
        PS C:\> Backup-EmMdmAppConfiguration -ExportPath "C:\Backup\AppConfigurations"

    # Import Intune App Configuration policies from a specified directory
        PS C:\> Import-EmMdmAppConfiguration -ImportPath "C:\Backup\AppConfigurations\IOSDeviceConfig.json"

    # Compare two Endpoint Manager policy classes
        PS C:\> Compare-EmMgClass -Class1 [Type1] -Class2 [Type2]

    # Retrieve Intune App Configuration policies using a specific Graph API version
        PS C:\> Get-EmMdmAppConfiguration

    # Application Auth Examples

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

# NOTE

- Only beta api is supported at the moment.

# TROUBLESHOOTING NOTE

- Look out on the Github repository for issues and new releases.

# SEE ALSO

- https://github.com/criticalsolutionsnetwork/MemPolicyManager

# KEYWORDS

- Microsoft Graph API
- Endpoint Manager
- Intune
- Policy Management
- Backup
- Import
- Export
- Compare
