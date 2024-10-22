<#
    .SYNOPSIS
        Connects to Microsoft Graph API using various authentication methods.
    .DESCRIPTION
        The Connect-EmMdmGraph cmdlet connects to the Microsoft Graph API using the specified scopes and an optional authentication object. It supports multiple authentication methods, including Client Secret, Certificate Thumbprint, Certificate Name, Managed Identity, Access Token, Environment Variables, and X509 Certificate.
    .PARAMETER Scopes
        The scopes required for the Microsoft Graph API connection. This parameter is mandatory.
    .PARAMETER AuthObject
        The authentication object used for connecting to Microsoft Graph. This parameter is optional.
    .OUTPUTS
        System.Boolean Returns $true if the connection is successful.
    .EXAMPLE
        $scopes = @("User.Read.All", "Group.Read.All")
        $authObject = Get-EmMdmGraphAuth -ClientSecretId "your-client-id" -ClientSecretTenantId "your-tenant-id" -ClientSecretValue "your-client-secret"
        Connect-EmMdmGraph -Scopes $scopes -AuthObject $authObject
        This example connects to Microsoft Graph using the specified scopes and a Client Secret authentication object.
    .EXAMPLE
        $scopes = @("User.Read.All", "Group.Read.All")
        Connect-EmMdmGraph -Scopes $scopes
        This example connects to Microsoft Graph using the specified scopes without providing an authentication object, assuming the context is already established.
    .NOTES
        Author: DrIOSX
        Date: 07/21/2024
#>
function Connect-EmMdmGraph {
    param (
        [Parameter(Mandatory = $true)]
        [string[]]$Scopes,
        [Parameter(Mandatory = $false)]
        [EmMdmAuthBase]$AuthObject
    )
    Write-Verbose "Connecting to MgGraph..." -Verbose
    try {
        Import-Module Microsoft.Graph.Authentication
        if ($AuthObject) {
            switch ($AuthObject.GetType().Name) {
                "EmMdmAuthClientSecret" {
                    Connect-MgGraph -TenantId $AuthObject.ClientSecretTenantId -ClientSecret $AuthObject.ClientSecretValue | Out-Null #-Scopes $Scopes
                }
                "EmMdmAuthCertificateThumbprint" {
                    Connect-MgGraph -ClientId $AuthObject.CertificateThumbprintClientId -TenantId $AuthObject.CertificateThumbprintTenantId -CertificateThumbprint $AuthObject.CertificateThumbprint | Out-Null #-Scopes $Scopes
                }
                "EmMdmAuthCertificateName" {
                    Connect-MgGraph -ClientId $AuthObject.CertificateNameClientId -TenantId $AuthObject.CertificateNameTenantId -CertificateName $AuthObject.CertificateName | Out-Null #-Scopes $Scopes
                }
                "EmMdmAuthManagedIdentity" {
                    Connect-MgGraph -Identity | Out-Null #-Scopes $Scopes
                }
                "EmMdmUserAuthManagedIdentity" {
                    Connect-MgGraph -Identity -ClientId $AuthObject.ClientId | Out-Null #-Scopes $Scopes
                }
                "EmMdmAuthAccessToken" {
                    Connect-MgGraph -AccessToken $AuthObject.AccessToken | Out-Null #-Scopes $Scopes
                }
                "EmMdmAuthEnvironmentVariable" {
                    Connect-MgGraph -EnvironmentVariable | Out-Null
                }
                "EmMdmAuthX509Certificate" {
                    Connect-MgGraph -ClientId $AuthObject.ClientId -TenantId $AuthObject.TenantId -Certificate $AuthObject.Certificate | Out-Null #-Scopes $Scopes | Out-Null
                }
            }
        } else {
            $context = Get-MgContext
            if ($null -ne $context -and $context.Scopes -contains $Scopes) {
                Write-Verbose "Using existing MgGraph connection context." -Verbose
            } else {
                Connect-MgGraph -Scopes $Scopes | Out-Null
            }
        }
    }
    catch {
        throw "An error occurred while connecting to MgGraph: `n$_"
    }
    return $true
}
