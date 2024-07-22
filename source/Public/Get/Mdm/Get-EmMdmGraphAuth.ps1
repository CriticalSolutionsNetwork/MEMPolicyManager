<#
    .SYNOPSIS
        Creates an authentication object for connecting to Microsoft Graph using various authentication methods.
    .DESCRIPTION
        The Get-EmMdmGraphAuth function creates an authentication object that can be used to connect to Microsoft Graph.
        The function supports multiple authentication methods, including Client Secret, Certificate Thumbprint, Certificate Name, Managed Identity, System Assigned Identity, Access Token, Environment Variables, and X509 Certificate.
    .PARAMETER ClientSecretId
        The Client ID for the application using Client Secret authentication.
        Mandatory for ClientSecret parameter set.
    .PARAMETER ClientSecretTenantId
        The Tenant ID for the application using Client Secret authentication.
        Mandatory for ClientSecret parameter set.
    .PARAMETER ClientSecretValue
        The Client Secret value for the application using Client Secret authentication.
        Mandatory for ClientSecret parameter set.
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
    .PARAMETER ClientId
        The client id of your application for X509 certificate authentication.
        Mandatory for X509Certificate parameter set.
    .PARAMETER CertificateSubjectName
        The subject distinguished name of a certificate for X509 certificate authentication.
        Mandatory for X509Certificate parameter set.
    .PARAMETER CertificateThumbprint
        The thumbprint of your certificate for X509 certificate authentication.
        Mandatory for X509Certificate parameter set.
    .PARAMETER Certificate
        An X.509 certificate supplied during invocation.
        Mandatory for X509Certificate parameter set.
    .PARAMETER TenantId
        The id of the tenant to connect to for X509 certificate authentication.
        Mandatory for X509Certificate parameter set.
    .Parameter X509CertificateThumbprint
        The thumbprint of your certificate for X509 certificate authentication.
    .INPUTS
        None
    .OUTPUTS
        PSCustomObject
        Returns an authentication object for connecting to Microsoft Graph.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -ClientSecretId "your-client-id" -ClientSecretTenantId "your-tenant-id" -ClientSecretValue "your-client-secret"
        Creates an authentication object using Client Secret authentication.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -CertificateThumbprintClientId "your-client-id" -CertificateThumbprintTenantId "your-tenant-id" -CertificateThumbprint "your-thumbprint"
        Creates an authentication object using Certificate Thumbprint authentication.
    .EXAMPLE
        PS> $authObject = Get-EmMdmGraphAuth -CertificateNameClientId "your-client-id" -CertificateNameTenantId "your-tenant-id" -CertificateName "your-certificatename"
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
        PS> $authObject = Get-EmMdmGraphAuth -ClientId "your-client-id" -CertificateSubjectName "CN=YourCertificate" -CertificateThumbprint "your-thumbprint" -Certificate $certificate -TenantId "your-tenant-id"
        Creates an authentication object using X509 Certificate authentication.
    .NOTES
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMdmGraphAuth
#>
function Get-EmMdmGraphAuth {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = "ClientSecret", Position = 0, HelpMessage = "The Client ID for the application using Client Secret authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$ClientSecretId,

        [Parameter(Mandatory = $true, ParameterSetName = "ClientSecret", Position = 1, HelpMessage = "The Tenant ID for the application using Client Secret authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$ClientSecretTenantId,

        [Parameter(Mandatory = $true, ParameterSetName = "ClientSecret", Position = 2, HelpMessage = "The Client Secret value for the application using Client Secret authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$ClientSecretValue,

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

        [Parameter(Mandatory = $true, ParameterSetName = "ManagedIdentity", Position = 0, HelpMessage = "The Client ID for the Managed Identity.")]
        [ValidateNotNullOrEmpty()]
        [string]$ManagedIdentity,

        [Parameter(Mandatory = $true, ParameterSetName = "SystemAssignedIdentity", Position = 0, HelpMessage = "Indicates the use of a System Assigned Identity for authentication.")]
        [switch]$SystemAssignedIdentity,

        [Parameter(Mandatory = $true, ParameterSetName = "AccessToken", Position = 0, HelpMessage = "Specifies a bearer token for Microsoft Graph service.")]
        [ValidateNotNullOrEmpty()]
        [SecureString]$AccessToken,

        [Parameter(Mandatory = $true, ParameterSetName = "EnvironmentVariable", Position = 0, HelpMessage = "Allows for authentication using environment variables configured on the host machine.")]
        [switch]$EnvironmentVariable,

        [Parameter(Mandatory = $true, ParameterSetName = "X509Certificate", Position = 0, HelpMessage = "The client id of your application for X509 certificate authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$ClientId,

        [Parameter(Mandatory = $true, ParameterSetName = "X509Certificate", Position = 1, HelpMessage = "The subject distinguished name of a certificate for X509 certificate authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$CertificateSubjectName,

        [Parameter(Mandatory = $true, ParameterSetName = "X509Certificate", Position = 2, HelpMessage = "The thumbprint of your certificate for X509 certificate authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$X509CertificateThumbprint,

        [Parameter(Mandatory = $true, ParameterSetName = "X509Certificate", Position = 3, HelpMessage = "An X.509 certificate supplied during invocation.")]
        [ValidateNotNullOrEmpty()]
        [System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate,

        [Parameter(Mandatory = $true, ParameterSetName = "X509Certificate", Position = 4, HelpMessage = "The id of the tenant to connect to for X509 certificate authentication.")]
        [ValidateNotNullOrEmpty()]
        [string]$TenantId
    )
    switch ($PSCmdlet.ParameterSetName) {
        "ClientSecret" {
            return [EmMdmAuthClientSecret]::new($ClientSecretId, $ClientSecretTenantId, $ClientSecretValue)
        }
        "CertificateThumbprint" {
            return [EmMdmAuthCertificateThumbprint]::new($CertificateThumbprintClientId, $CertificateThumbprintTenantId, $CertificateThumbprint)
        }
        "CertificateName" {
            return [EmMdmAuthCertificateName]::new($CertificateNameClientId, $CertificateNameTenantId, $CertificateName)
        }
        "ManagedIdentity" {
            return [EmMdmAuthManagedIdentity]::new($ManagedIdentity)
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
            return [EmMdmAuthX509Certificate]::new($ClientId, $CertificateSubjectName, $X509CertificateThumbprint, $Certificate, $TenantId)
        }
    }
}