<#
    .SYNOPSIS
        Creates an authentication object for connecting to Microsoft Graph using various authentication methods.
    .DESCRIPTION
        The Get-EmMdmGraphAuth function creates an authentication object that can be used to connect to Microsoft Graph.
        The function supports multiple authentication methods, including Client Secret, Certificate Thumbprint, Certificate Name, Managed Identity, System Assigned Identity, Access Token, Environment Variables, and X509 Certificate.
        Use help Get-EmMdmGraphAuth -Syntax for more information on the parameters.
        Self Signed Example:
            $CertName = "{certificateName}"    ## Replace {certificateName}
                $cert = New-SelfSignedCertificate -Subject "CN=$CertName" -CertStoreLocation "Cert:\CurrentUser\My" `
                -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
                # Public Key for upload to MgGraph application
                Export-Certificate -Cert $cert -FilePath "C:\temp\$CertName.cer"   ## Specify your preferred location
                $ThumbPrint = $Cert.Thumbprint
                $CertName = $cert.Subject
    .PARAMETER ClientSecretId
        The Client ID for the application using Client Secret authentication.
        Mandatory for ClientSecret parameter set.
    .PARAMETER ClientSecretTenantId
        The Tenant ID for the application using Client Secret authentication.
        Mandatory for ClientSecret parameter set.
    .PARAMETER ClientSecretValue
        The Client Secret value for the application using Client Secret authentication.
        Mandatory for ClientSecret parameter set. Must be a PSCredential object.
    .PARAMETER CertificateThumbprintClientId
        The Client ID for the application using Certificate Thumbprint authentication.
        Mandatory for CertificateThumbprint parameter set.
    .PARAMETER CertificateThumbprintTenantId
        The Tenant ID for the application using Certificate Thumbprint authentication.
        Mandatory for CertificateThumbprint parameter set.
    .PARAMETER CertificateThumbprint
        The Certificate Thumbprint for the application using Certificate Thumbprint authentication.
        Mandatory for CertificateThumbprint parameter set.
    .PARAMETER CertificateNameClientId
        The Client ID for the application using Certificate Name authentication.
        Mandatory for CertificateName parameter set.
    .PARAMETER CertificateNameTenantId
        The Tenant ID for the application using Certificate Name authentication.
        Mandatory for CertificateName parameter set.
    .PARAMETER CertificateName
        The Certificate Name for the application using Certificate Name authentication.
        Mandatory for CertificateName parameter set.
    .PARAMETER ManagedIdentity
        The Client ID for the Managed Identity.
        Mandatory for ManagedIdentity parameter set.
    .PARAMETER SystemAssignedIdentity
        Indicates the use of a System Assigned Identity for authentication.
        Mandatory for SystemAssignedIdentity parameter set.
    .PARAMETER AccessToken
        Specifies a bearer token for Microsoft Graph service.
        Mandatory for AccessToken parameter set.
    .PARAMETER EnvironmentVariable
        Allows for authentication using environment variables configured on the host machine.
        Mandatory for EnvironmentVariable parameter set.
    .PARAMETER X509CertificateClientId
        The client id of your application for X509 certificate authentication.
        Mandatory for X509Certificate parameter set.
    .PARAMETER X509CertificateClientId
        An X.509 certificate supplied during invocation.
        Mandatory for X509Certificate parameter set.
    .PARAMETER X509CertificateTenantId
        The id of the tenant to connect to for X509 certificate authentication.
        Mandatory for X509Certificate parameter set.
    .INPUTS
        None
    .OUTPUTS
        PSCustomObject
        Returns an authentication object for connecting to Microsoft Graph.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -ClientSecretTenantId $TenantId -ClientSecretValue $ClientSecretPSCredential
        Creates an authentication object using Client Secret authentication.
        The Client Secret value is provided as a PSCredential object.
        # $ClientId = "<your-client-id>"
        # ClientSecret = ConvertTo-SecureString -String "<your-client-secret>" -AsPlainText -Force
        # Ex: $ClientSecretPSCredential = [PsCredential]::New($ClientId,$ClientSecret)
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -CertificateThumbprintClientId $ClientId -CertificateThumbprintTenantId $TenantId -CertificateThumbprint $ClientCertThumbPrint
        Creates an authentication object using Certificate Thumbprint authentication.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -CertificateNameClientId $ClientId -CertificateNameTenantId $TenantId -CertificateName $CertName
        Creates an authentication object using Certificate Name authentication.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -ManagedIdentity "your-client-id"
        Creates an authentication object using Managed Identity authentication.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -SystemAssignedIdentity
        Creates an authentication object using System Assigned Identity authentication.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -AccessToken (ConvertTo-SecureString -String "your-access-token" -AsPlainText -Force)
        Creates an authentication object using Access Token authentication.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -EnvironmentVariable
        Creates an authentication object using Environment Variable authentication.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -X509CertificateClientId $ClientId -X509CertificateTenantId $TenantId -X509Certificate $Cert
        Creates an authentication object using X509 Certificate authentication.
    .NOTES
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmGraphAuth
#>
function Get-EmMdmGraphAuth {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = "ClientSecret", Position = 0, HelpMessage = "The Tenant ID for the application using Client Secret authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$ClientSecretTenantId,

        [Parameter(Mandatory = $true, ParameterSetName = "ClientSecret", Position = 1, HelpMessage = "The Client Secret value for the application using Client Secret authentication.")]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]$ClientSecretValue,

        [Parameter(Mandatory = $true, ParameterSetName = "CertificateThumbprint", Position = 0, HelpMessage = "The Client ID for the application using Certificate Thumbprint authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$CertificateThumbprintClientId,

        [Parameter(Mandatory = $true, ParameterSetName = "CertificateThumbprint", Position = 1, HelpMessage = "The Tenant ID for the application using Certificate Thumbprint authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$CertificateThumbprintTenantId,

        [Parameter(Mandatory = $true, ParameterSetName = "CertificateThumbprint", Position = 2, HelpMessage = "The Certificate Thumbprint for the application using Certificate Thumbprint authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$CertificateThumbprint,

        [Parameter(Mandatory = $true, ParameterSetName = "CertificateName", Position = 0, HelpMessage = "The Client ID for the application using Certificate Name authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$CertificateNameClientId,

        [Parameter(Mandatory = $true, ParameterSetName = "CertificateName", Position = 1, HelpMessage = "The Tenant ID for the application using Certificate Name authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$CertificateNameTenantId,

        [Parameter(Mandatory = $true, ParameterSetName = "CertificateName", Position = 2, HelpMessage = "The Certificate Name for the application using Certificate Name authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$CertificateName,

        [Parameter(Mandatory = $true, ParameterSetName = "UserAuthManagedIdentity", Position = 0, HelpMessage = "The Client ID for the Managed Identity.")]
        [ValidateNotNullOrEmpty()]
        [string]$UserAuthManagedIdentity,

        [Parameter(Mandatory = $true, ParameterSetName = "SystemAssignedIdentity", Position = 0, HelpMessage = "Indicates the use of a System Assigned Identity for authentication.")]
        [switch]$SystemAssignedIdentity,

        [Parameter(Mandatory = $true, ParameterSetName = "AccessToken", Position = 0, HelpMessage = "Specifies a bearer token for Microsoft Graph service.")]
        [ValidateNotNullOrEmpty()]
        [SecureString]$AccessToken,

        [Parameter(Mandatory = $true, ParameterSetName = "EnvironmentVariable", Position = 0, HelpMessage = "Allows for authentication using environment variables configured on the host machine.")]
        [switch]$EnvironmentVariable,

        [Parameter(Mandatory = $true, ParameterSetName = "X509Certificate", Position = 0, HelpMessage = "The client id of your application for X509 certificate authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$X509CertificateClientId,

        [Parameter(Mandatory = $true, ParameterSetName = "X509Certificate", Position = 1, HelpMessage = "An X.509 certificate supplied during invocation.")]
        [ValidateNotNullOrEmpty()]
        [X509Certificate]$X509Certificate,

        [Parameter(Mandatory = $true, ParameterSetName = "X509Certificate", Position = 2, HelpMessage = "The id of the tenant to connect to for X509 certificate authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$X509CertificateTenantId
    )
    process {
        try {
            switch ($PSCmdlet.ParameterSetName) {
                "ClientSecret" {
                    return [EmMdmAuthClientSecret]::new($ClientSecretTenantId, $ClientSecretValue)
                }
                "CertificateThumbprint" {
                    return [EmMdmAuthCertificateThumbprint]::new($CertificateThumbprintClientId, $CertificateThumbprintTenantId, $CertificateThumbprint)
                }
                "CertificateName" {
                    return [EmMdmAuthCertificateName]::new($CertificateNameClientId, $CertificateNameTenantId, $CertificateName)
                }
                "UserAuthManagedIdentity" {
                    return [EmMdmUserAuthManagedIdentity]::new($UserAuthManagedIdentity)
                }
                "SystemAssignedIdentity" {
                    if ($SystemAssignedIdentity) {
                        return [EmMdmAuthManagedIdentity]::new($true)
                    }
                }
                "AccessToken" {
                    return [EmMdmAuthAccessToken]::new($AccessToken)
                }
                "EnvironmentVariable" {
                    if ($EnvironmentVariable) {
                        return [EmMdmAuthEnvironmentVariable]::new()
                    }
                }
                "X509Certificate" {
                    return [EmMdmAuthX509Certificate]::new($X509CertificateClientId, $X509CertificateTenantId, $X509Certificate )
                }
            }
        }
        catch {
            throw "Get-EMMdmGraphAuth Error: `n$_"
        }
    }
}