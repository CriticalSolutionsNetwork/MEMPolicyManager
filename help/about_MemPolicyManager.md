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
