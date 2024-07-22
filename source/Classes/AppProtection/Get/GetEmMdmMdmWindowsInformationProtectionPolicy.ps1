class GetEmMdmMdmWindowsInformationProtectionPolicy {
  [string]${@odata.type}
    [string]$displayName
    [string]$description
    [datetime]$createdDateTime
    [datetime]$lastModifiedDateTime
    [object[]]$roleScopeTagIds
    [string]$id
    [string]$version
    [string]$enforcementLevel
    [string]$enterpriseDomain
    [object[]]$enterpriseProtectedDomainNames
    [bool]$protectionUnderLockConfigRequired
    [psobject]$dataRecoveryCertificate
    [bool]$revokeOnUnenrollDisabled
    [string]$rightsManagementServicesTemplateId
    [bool]$azureRightsManagementServicesAllowed
    [bool]$iconsVisible
    [object[]]$protectedApps
    [object[]]$exemptApps
    [object[]]$enterpriseNetworkDomainNames
    [object[]]$enterpriseProxiedDomains
    [object[]]$enterpriseIPRanges
    [bool]$enterpriseIPRangesAreAuthoritative
    [object[]]$enterpriseProxyServers
    [object[]]$enterpriseInternalProxyServers
    [bool]$enterpriseProxyServersAreAuthoritative
    [object[]]$neutralDomainResources
    [bool]$indexingEncryptedStoresOrItemsBlocked
    [object[]]$smbAutoEncryptedFileExtensions
    [bool]$isAssigned

  # Default constructor
  GetEmMdmMdmWindowsInformationProtectionPolicy() {
      $this."@odata.type" = ''
        $this.displayName = ''
        $this.description = ''
        $this.createdDateTime = [datetime]::MinValue
        $this.lastModifiedDateTime = [datetime]::MinValue
        $this.roleScopeTagIds = @()
        $this.id = ''
        $this.version = ''
        $this.enforcementLevel = ''
        $this.enterpriseDomain = ''
        $this.enterpriseProtectedDomainNames = @()
        $this.protectionUnderLockConfigRequired = $false
        $this.dataRecoveryCertificate = $null
        $this.revokeOnUnenrollDisabled = $false
        $this.rightsManagementServicesTemplateId = ''
        $this.azureRightsManagementServicesAllowed = $false
        $this.iconsVisible = $false
        $this.protectedApps = @()
        $this.exemptApps = @()
        $this.enterpriseNetworkDomainNames = @()
        $this.enterpriseProxiedDomains = @()
        $this.enterpriseIPRanges = @()
        $this.enterpriseIPRangesAreAuthoritative = $false
        $this.enterpriseProxyServers = @()
        $this.enterpriseInternalProxyServers = @()
        $this.enterpriseProxyServersAreAuthoritative = $false
        $this.neutralDomainResources = @()
        $this.indexingEncryptedStoresOrItemsBlocked = $false
        $this.smbAutoEncryptedFileExtensions = @()
        $this.isAssigned = $false
  }

  # Parameterized constructor
  GetEmMdmMdmWindowsInformationProtectionPolicy ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.displayName = $policy.displayName
        $this.description = $policy.description
        $this.createdDateTime = $policy.createdDateTime
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.id = $policy.id
        $this.version = $policy.version
        $this.enforcementLevel = $policy.enforcementLevel
        $this.enterpriseDomain = $policy.enterpriseDomain
        $this.enterpriseProtectedDomainNames = $policy.enterpriseProtectedDomainNames
        $this.protectionUnderLockConfigRequired = $policy.protectionUnderLockConfigRequired
        $this.dataRecoveryCertificate = $policy.dataRecoveryCertificate
        $this.revokeOnUnenrollDisabled = $policy.revokeOnUnenrollDisabled
        $this.rightsManagementServicesTemplateId = $policy.rightsManagementServicesTemplateId
        $this.azureRightsManagementServicesAllowed = $policy.azureRightsManagementServicesAllowed
        $this.iconsVisible = $policy.iconsVisible
        $this.protectedApps = $policy.protectedApps
        $this.exemptApps = $policy.exemptApps
        $this.enterpriseNetworkDomainNames = $policy.enterpriseNetworkDomainNames
        $this.enterpriseProxiedDomains = $policy.enterpriseProxiedDomains
        $this.enterpriseIPRanges = $policy.enterpriseIPRanges
        $this.enterpriseIPRangesAreAuthoritative = $policy.enterpriseIPRangesAreAuthoritative
        $this.enterpriseProxyServers = $policy.enterpriseProxyServers
        $this.enterpriseInternalProxyServers = $policy.enterpriseInternalProxyServers
        $this.enterpriseProxyServersAreAuthoritative = $policy.enterpriseProxyServersAreAuthoritative
        $this.neutralDomainResources = $policy.neutralDomainResources
        $this.indexingEncryptedStoresOrItemsBlocked = $policy.indexingEncryptedStoresOrItemsBlocked
        $this.smbAutoEncryptedFileExtensions = $policy.smbAutoEncryptedFileExtensions
        $this.isAssigned = $policy.isAssigned
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMdmMdmWindowsInformationProtectionPolicy"
  }
}
