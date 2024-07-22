<#
    .SYNOPSIS
        Downloads the Microsoft Graph metadata XML file.
    .DESCRIPTION
        The Get-EmMgMetadataXml cmdlet connects to Microsoft Graph using the specified API version and downloads the metadata XML file to the specified output path.
        The cmdlet supports both 'beta' and 'v1.0' versions of the Graph API.
    .PARAMETER OutputPath
        The file path where the metadata XML file will be saved. This parameter is mandatory.
    .PARAMETER graphApiVersion
        The version of the Microsoft Graph API to use.
        Valid values are "beta" and "v1.0".
        The default value is "beta".
    .INPUTS
        None. This cmdlet does not accept pipeline input.
    .OUTPUTS
        [string]
        The cmdlet outputs a message indicating the success or failure of the metadata XML download.
    .EXAMPLE
        PS> Get-EmMgMetadataXml -OutputPath "C:\GraphMetadata\metadata.xml"
        This example connects to Microsoft Graph using the 'beta' API version and downloads the metadata XML file to "C:\GraphMetadata\metadata.xml".
    .EXAMPLE
        PS> Get-EmMgMetadataXml -OutputPath "C:\GraphMetadata\metadata.xml" -graphApiVersion "v1.0"
        This example connects to Microsoft Graph using the 'v1.0' API version and downloads the metadata XML file to "C:\GraphMetadata\metadata.xml".
    .NOTES
        The cmdlet uses the following functions:
        - Invoke-WebRequest
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXml
#>

function Get-EmMgMetadataXml {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0,
            HelpMessage = "Specify the output path where the metadata XML will be saved."
        )]
        [ValidateNotNullOrEmpty()]
        [string]$OutputPath,
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Specify the version of the Microsoft Graph API to use. Default is 'beta'."
        )]
        [ValidateSet("beta", "v1.0")]
        [string]$graphApiVersion = "beta"
    )
    process {
        try {
            $metadataUrl = "https://graph.microsoft.com/$graphApiVersion/`$metadata/"
            Invoke-WebRequest -Method Get -Uri $metadataUrl -OutFile $OutputPath -UseBasicParsing
            Write-Verbose "Metadata XML downloaded successfully to $OutputPath." -Verbose
        }
        catch {
            Write-Error "Failed to download metadata XML: $_"
        }
    }
}
