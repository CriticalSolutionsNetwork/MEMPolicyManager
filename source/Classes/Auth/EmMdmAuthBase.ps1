# Base authentication class
class EmMdmAuthBase {
    EmMdmAuthBase() {}
}

# Client secret authentication class
class EmMdmAuthClientSecret : EmMdmAuthBase {
    [string]$ClientSecretTenantId
    [System.Management.Automation.PSCredential]$ClientSecretValue
    EmMdmAuthClientSecret([string]$clientSecretTenantId, [System.Management.Automation.PSCredential]$clientSecretValue) : base() {
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
    [string]$TenantId
    [X509Certificate]$Certificate
    EmMdmAuthX509Certificate([string]$clientId,[string]$tenantId, [X509Certificate]$certificate) : base() {
        $this.ClientId = $clientId
        $this.TenantId = $tenantId
        $this.Certificate = $certificate

    }
}
