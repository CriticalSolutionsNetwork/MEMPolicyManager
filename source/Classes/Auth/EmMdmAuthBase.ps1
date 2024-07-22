# Base authentication class
class EmMdmAuthBase {
    EmMdmAuthBase() {}
}

# Client secret authentication class
class EmMdmAuthClientSecret : EmMdmAuthBase {
    [string]$ClientSecretId
    [string]$ClientSecretTenantId
    [string]$ClientSecretValue
    EmMdmAuthClientSecret([string]$clientSecretId, [string]$clientSecretTenantId, [string]$clientSecretValue) : base() {
        $this.ClientSecretId = $clientSecretId
        $this.ClientSecretTenantId = $clientSecretTenantId
        $this.ClientSecretValue = $clientSecretValue
    }
}

# Certificate thumbprint authentication class
class EmMdmAuthCertificateThumbprint : EmMdmAuthBase {
    [string]$CertificateThumbprintClientId
    [string]$CertificateThumbprintTenantId
    [string]$CertificateThumbprint
    EmMdmAuthCertificateThumbprint([string]$certificateThumbprintClientId, [string]$certificateThumbprintTenantId, [string]$certificateThumbprint) : base() {
        $this.CertificateThumbprintClientId = $certificateThumbprintClientId
        $this.CertificateThumbprintTenantId = $certificateThumbprintTenantId
        $this.CertificateThumbprint = $certificateThumbprint
    }
}

# Certificate name authentication class
class EmMdmAuthCertificateName : EmMdmAuthBase {
    [string]$CertificateNameClientId
    [string]$CertificateNameTenantId
    [string]$CertificateName
    EmMdmAuthCertificateName([string]$certificateNameClientId, [string]$certificateNameTenantId, [string]$certificateName) : base() {
        $this.CertificateNameClientId = $certificateNameClientId
        $this.CertificateNameTenantId = $certificateNameTenantId
        $this.CertificateName = $certificateName
    }
}

# Managed identity authentication class
class EmMdmAuthManagedIdentity : EmMdmAuthBase {
    [bool]$SystemAssignedIdentity
    EmMdmAuthManagedIdentity([bool]$systemAssignedIdentity) : base() {
        $this.SystemAssignedIdentity = $systemAssignedIdentity
    }
}

# Access token authentication class
class EmMdmAuthAccessToken : EmMdmAuthBase {
    [SecureString]$AccessToken
    EmMdmAuthAccessToken([SecureString]$accessToken) : base() {
        $this.AccessToken = $accessToken
    }
}

# Environment variable authentication class
class EmMdmAuthEnvironmentVariable : EmMdmAuthBase {
    EmMdmAuthEnvironmentVariable() : base() {}
}

# X509 certificate authentication class
class EmMdmAuthX509Certificate : EmMdmAuthBase {
    [string]$ClientId
    [string]$CertificateSubjectName
    [string]$CertificateThumbprint
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate
    [string]$TenantId
    EmMdmAuthX509Certificate([string]$clientId, [string]$certificateSubjectName, [string]$certificateThumbprint, [System.Security.Cryptography.X509Certificates.X509Certificate2]$certificate, [string]$tenantId) : base() {
        $this.ClientId = $clientId
        $this.CertificateSubjectName = $certificateSubjectName
        $this.CertificateThumbprint = $certificateThumbprint
        $this.Certificate = $certificate
        $this.TenantId = $tenantId
    }
}
