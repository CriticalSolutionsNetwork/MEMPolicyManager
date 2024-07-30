---
external help file: MemPolicyManager-help.xml
Module Name: MemPolicyManager
online version:
schema: 2.0.0
---

# Get-EmMdmGraphAuth

## SYNOPSIS
Creates an authentication object for connecting to Microsoft Graph using various authentication methods.

## SYNTAX

### ClientSecret
```
Get-EmMdmGraphAuth [-ClientSecretTenantId] <String> [-ClientSecretValue] <PSCredential>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### CertificateThumbprint
```
Get-EmMdmGraphAuth [-CertificateThumbprintClientId] <String> [-CertificateThumbprintTenantId] <String>
 [-CertificateThumbprint] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### CertificateName
```
Get-EmMdmGraphAuth [-CertificateNameClientId] <String> [-CertificateNameTenantId] <String>
 [-CertificateName] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### UserAuthManagedIdentity
```
Get-EmMdmGraphAuth [-UserAuthManagedIdentity] <String> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### SystemAssignedIdentity
```
Get-EmMdmGraphAuth [-SystemAssignedIdentity] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### AccessToken
```
Get-EmMdmGraphAuth [-AccessToken] <SecureString> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### EnvironmentVariable
```
Get-EmMdmGraphAuth [-EnvironmentVariable] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### X509Certificate
```
Get-EmMdmGraphAuth [-X509CertificateClientId] <String> [-X509Certificate] <X509Certificate>
 [-X509CertificateTenantId] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Get-EmMdmGraphAuth function creates an authentication object that can be used to connect to Microsoft Graph.
The function supports multiple authentication methods, including Client Secret, Certificate Thumbprint, Certificate Name, Managed Identity, System Assigned Identity, Access Token, Environment Variables, and X509 Certificate.

## EXAMPLES

### EXAMPLE 1
```
$authObject = Get-EmMdmGraphAuth -ClientSecretId "your-client-id" -ClientSecretTenantId "your-tenant-id" -ClientSecretValue "your-client-secret"
Creates an authentication object using Client Secret authentication.
```

### EXAMPLE 2
```
$authObject = Get-EmMdmGraphAuth -CertificateThumbprintClientId "your-client-id" -CertificateThumbprintTenantId "your-tenant-id" -CertificateThumbprint "your-thumbprint"
Creates an authentication object using Certificate Thumbprint authentication.
```

### EXAMPLE 3
```
$authObject = Get-EmMdmGraphAuth -CertificateNameClientId "your-client-id" -CertificateNameTenantId "your-tenant-id" -CertificateName "your-certificatename"
Creates an authentication object using Certificate Name authentication.
```

### EXAMPLE 4
```
$authObject = Get-EmMdmGraphAuth -ManagedIdentity "your-client-id"
Creates an authentication object using Managed Identity authentication.
```

### EXAMPLE 5
```
$authObject = Get-EmMdmGraphAuth -SystemAssignedIdentity
Creates an authentication object using System Assigned Identity authentication.
```

### EXAMPLE 6
```
$authObject = Get-EmMdmGraphAuth -AccessToken (ConvertTo-SecureString -String "your-access-token" -AsPlainText -Force)
Creates an authentication object using Access Token authentication.
```

### EXAMPLE 7
```
$authObject = Get-EmMdmGraphAuth -EnvironmentVariable
Creates an authentication object using Environment Variable authentication.
```

### EXAMPLE 8
```
$authObject = Get-EmMdmGraphAuth -ClientId "your-client-id" -CertificateSubjectName "CN=YourCertificate" -CertificateThumbprint "your-thumbprint" -Certificate $certificate -TenantId "your-tenant-id"
Creates an authentication object using X509 Certificate authentication.
```

## PARAMETERS

### -ClientSecretTenantId
The Tenant ID for the application using Client Secret authentication.
Mandatory for ClientSecret parameter set.

```yaml
Type: String
Parameter Sets: ClientSecret
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClientSecretValue
The Client Secret value for the application using Client Secret authentication.
Mandatory for ClientSecret parameter set.

```yaml
Type: PSCredential
Parameter Sets: ClientSecret
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificateThumbprintClientId
The Client ID for the application using Certificate Thumbprint authentication.
Mandatory for CertificateThumbprint parameter set.

```yaml
Type: String
Parameter Sets: CertificateThumbprint
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificateThumbprintTenantId
The Tenant ID for the application using Certificate Thumbprint authentication.
Mandatory for CertificateThumbprint parameter set.

```yaml
Type: String
Parameter Sets: CertificateThumbprint
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificateThumbprint
The Certificate Thumbprint for the application using Certificate Thumbprint authentication.
Mandatory for CertificateThumbprint parameter set.

```yaml
Type: String
Parameter Sets: CertificateThumbprint
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificateNameClientId
The Client ID for the application using Certificate Name authentication.
Mandatory for CertificateName parameter set.

```yaml
Type: String
Parameter Sets: CertificateName
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificateNameTenantId
The Tenant ID for the application using Certificate Name authentication.
Mandatory for CertificateName parameter set.

```yaml
Type: String
Parameter Sets: CertificateName
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificateName
The Certificate Name for the application using Certificate Name authentication.
Mandatory for CertificateName parameter set.

```yaml
Type: String
Parameter Sets: CertificateName
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserAuthManagedIdentity
The Client ID for the Managed Identity.

```yaml
Type: String
Parameter Sets: UserAuthManagedIdentity
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SystemAssignedIdentity
Indicates the use of a System Assigned Identity for authentication.
Mandatory for SystemAssignedIdentity parameter set.

```yaml
Type: SwitchParameter
Parameter Sets: SystemAssignedIdentity
Aliases:

Required: True
Position: 1
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccessToken
Specifies a bearer token for Microsoft Graph service.
Mandatory for AccessToken parameter set.

```yaml
Type: SecureString
Parameter Sets: AccessToken
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnvironmentVariable
Allows for authentication using environment variables configured on the host machine.
Mandatory for EnvironmentVariable parameter set.

```yaml
Type: SwitchParameter
Parameter Sets: EnvironmentVariable
Aliases:

Required: True
Position: 1
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -X509CertificateClientId
The client id of your application for X509 certificate authentication.
Mandatory for X509Certificate parameter set.

```yaml
Type: String
Parameter Sets: X509Certificate
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -X509Certificate
An X.509 certificate supplied during invocation.

```yaml
Type: X509Certificate
Parameter Sets: X509Certificate
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -X509CertificateTenantId
The id of the tenant to connect to for X509 certificate authentication.
Mandatory for X509Certificate parameter set.

```yaml
Type: String
Parameter Sets: X509Certificate
Aliases:

Required: True
Position: 3
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

### None
## OUTPUTS

### PSCustomObject
### Returns an authentication object for connecting to Microsoft Graph.
## NOTES
https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmGraphAuth

## RELATED LINKS
