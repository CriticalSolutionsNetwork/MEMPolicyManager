class GetEmAndroidWorkProfileVpnConfiguration {
  [string]${@odata.type}
    [string]$id
    [datetime]$lastModifiedDateTime
    [object[]]$roleScopeTagIds
    [bool]$supportsScopeTags
    [psobject]$deviceManagementApplicabilityRuleOsEdition
    [psobject]$deviceManagementApplicabilityRuleOsVersion
    [psobject]$deviceManagementApplicabilityRuleDeviceMode
    [datetime]$createdDateTime
    [string]$description
    [string]$displayName
    [object]$version
    [string]$connectionName
    [string]$connectionType
    [string]$role
    [string]$realm
    [object[]]$servers
    [string]$fingerprint
    [object[]]$customData
    [object[]]$customKeyValueData
    [string]$authenticationMethod
    [psobject]$proxyServer
    [object[]]$targetedPackageIds
    [object[]]$targetedMobileApps
    [bool]$alwaysOn
    [bool]$alwaysOnLockdown
    [string]$microsoftTunnelSiteId
    [object[]]$proxyExclusionList

  # Default constructor
  GetEmAndroidWorkProfileVpnConfiguration() {
      $this."@odata.type" = ''
        $this.id = ''
        $this.lastModifiedDateTime = [datetime]::MinValue
        $this.roleScopeTagIds = @()
        $this.supportsScopeTags = $false
        $this.deviceManagementApplicabilityRuleOsEdition = $null
        $this.deviceManagementApplicabilityRuleOsVersion = $null
        $this.deviceManagementApplicabilityRuleDeviceMode = $null
        $this.createdDateTime = [datetime]::MinValue
        $this.description = ''
        $this.displayName = ''
        $this.version = $null
        $this.connectionName = ''
        $this.connectionType = ''
        $this.role = ''
        $this.realm = ''
        $this.servers = @()
        $this.fingerprint = ''
        $this.customData = @()
        $this.customKeyValueData = @()
        $this.authenticationMethod = ''
        $this.proxyServer = $null
        $this.targetedPackageIds = @()
        $this.targetedMobileApps = @()
        $this.alwaysOn = $false
        $this.alwaysOnLockdown = $false
        $this.microsoftTunnelSiteId = ''
        $this.proxyExclusionList = @()
  }

  # Parameterized constructor
  GetEmAndroidWorkProfileVpnConfiguration ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.id = $policy.id
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.supportsScopeTags = $policy.supportsScopeTags
        $this.deviceManagementApplicabilityRuleOsEdition = $policy.deviceManagementApplicabilityRuleOsEdition
        $this.deviceManagementApplicabilityRuleOsVersion = $policy.deviceManagementApplicabilityRuleOsVersion
        $this.deviceManagementApplicabilityRuleDeviceMode = $policy.deviceManagementApplicabilityRuleDeviceMode
        $this.createdDateTime = $policy.createdDateTime
        $this.description = $policy.description
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.connectionName = $policy.connectionName
        $this.connectionType = $policy.connectionType
        $this.role = $policy.role
        $this.realm = $policy.realm
        $this.servers = $policy.servers
        $this.fingerprint = $policy.fingerprint
        $this.customData = $policy.customData
        $this.customKeyValueData = $policy.customKeyValueData
        $this.authenticationMethod = $policy.authenticationMethod
        $this.proxyServer = $policy.proxyServer
        $this.targetedPackageIds = $policy.targetedPackageIds
        $this.targetedMobileApps = $policy.targetedMobileApps
        $this.alwaysOn = $policy.alwaysOn
        $this.alwaysOnLockdown = $policy.alwaysOnLockdown
        $this.microsoftTunnelSiteId = $policy.microsoftTunnelSiteId
        $this.proxyExclusionList = $policy.proxyExclusionList
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmAndroidWorkProfileVpnConfiguration"
  }
}
