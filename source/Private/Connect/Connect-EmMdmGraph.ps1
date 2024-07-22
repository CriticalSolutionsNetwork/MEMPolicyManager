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
                    Connect-MgGraph -ClientId $AuthObject.ClientSecretId -TenantId $AuthObject.ClientSecretTenantId -ClientSecret $AuthObject.ClientSecretValue -Scopes $Scopes | Out-Null
                }
                "EmMdmAuthCertificateThumbprint" {
                    Connect-MgGraph -ClientId $AuthObject.CertificateThumbprintClientId -TenantId $AuthObject.CertificateThumbprintTenantId -CertificateThumbprint $AuthObject.CertificateThumbprint -Scopes $Scopes | Out-Null
                }
                "EmMdmAuthCertificateName" {
                    Connect-MgGraph -ClientId $AuthObject.CertificateNameClientId -TenantId $AuthObject.CertificateNameTenantId -CertificateName $AuthObject.CertificateName -Scopes $Scopes | Out-Null
                }
                "EmMdmAuthManagedIdentity" {
                    Connect-MgGraph -Identity -Scopes $Scopes | Out-Null
                }
                "EmMdmAuthAccessToken" {
                    Connect-MgGraph -AccessToken $AuthObject.AccessToken -Scopes $Scopes | Out-Null
                }
                "EmMdmAuthEnvironmentVariable" {
                    Connect-MgGraph -EnvironmentVariable -Scopes $Scopes | Out-Null
                }
                "EmMdmAuthX509Certificate" {
                    Connect-MgGraph -ClientId $AuthObject.ClientId -CertificateSubjectName $AuthObject.CertificateSubjectName -CertificateThumbprint $AuthObject.CertificateThumbprint -Certificate $AuthObject.Certificate -TenantId $AuthObject.TenantId -Scopes $Scopes | Out-Null
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
