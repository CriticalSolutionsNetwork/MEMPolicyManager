class GetEmMdmWindowsManagedAppProtection {
  [string]${@odata.type}
    [string]$displayName
    [string]$description
    [datetime]$createdDateTime
    [datetime]$lastModifiedDateTime
    [object[]]$roleScopeTagIds
    [string]$id
    [string]$version
    [bool]$isAssigned
    [object]$deployedAppCount
    [bool]$printBlocked
    [string]$allowedInboundDataTransferSources
    [string]$allowedOutboundClipboardSharingLevel
    [string]$allowedOutboundDataTransferDestinations
    [string]$appActionIfUnableToAuthenticateUser
    [string]$maximumAllowedDeviceThreatLevel
    [string]$mobileThreatDefenseRemediationAction
    [string]$minimumRequiredSdkVersion
    [string]$minimumWipeSdkVersion
    [string]$minimumRequiredOsVersion
    [string]$minimumWarningOsVersion
    [string]$minimumWipeOsVersion
    [string]$minimumRequiredAppVersion
    [string]$minimumWarningAppVersion
    [string]$minimumWipeAppVersion
    [string]$maximumRequiredOsVersion
    [string]$maximumWarningOsVersion
    [string]$maximumWipeOsVersion
    [string]$periodOfflineBeforeWipeIsEnforced
    [string]$periodOfflineBeforeAccessCheck

  # Default constructor
  GetEmMdmWindowsManagedAppProtection() {
      $this."@odata.type" = ''
        $this.displayName = ''
        $this.description = ''
        $this.createdDateTime = [datetime]::MinValue
        $this.lastModifiedDateTime = [datetime]::MinValue
        $this.roleScopeTagIds = @()
        $this.id = ''
        $this.version = ''
        $this.isAssigned = $false
        $this.deployedAppCount = $null
        $this.printBlocked = $false
        $this.allowedInboundDataTransferSources = ''
        $this.allowedOutboundClipboardSharingLevel = ''
        $this.allowedOutboundDataTransferDestinations = ''
        $this.appActionIfUnableToAuthenticateUser = ''
        $this.maximumAllowedDeviceThreatLevel = ''
        $this.mobileThreatDefenseRemediationAction = ''
        $this.minimumRequiredSdkVersion = ''
        $this.minimumWipeSdkVersion = ''
        $this.minimumRequiredOsVersion = ''
        $this.minimumWarningOsVersion = ''
        $this.minimumWipeOsVersion = ''
        $this.minimumRequiredAppVersion = ''
        $this.minimumWarningAppVersion = ''
        $this.minimumWipeAppVersion = ''
        $this.maximumRequiredOsVersion = ''
        $this.maximumWarningOsVersion = ''
        $this.maximumWipeOsVersion = ''
        $this.periodOfflineBeforeWipeIsEnforced = ''
        $this.periodOfflineBeforeAccessCheck = ''
  }

  # Parameterized constructor
  GetEmMdmWindowsManagedAppProtection ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.displayName = $policy.displayName
        $this.description = $policy.description
        $this.createdDateTime = $policy.createdDateTime
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.id = $policy.id
        $this.version = $policy.version
        $this.isAssigned = $policy.isAssigned
        $this.deployedAppCount = $policy.deployedAppCount
        $this.printBlocked = $policy.printBlocked
        $this.allowedInboundDataTransferSources = $policy.allowedInboundDataTransferSources
        $this.allowedOutboundClipboardSharingLevel = $policy.allowedOutboundClipboardSharingLevel
        $this.allowedOutboundDataTransferDestinations = $policy.allowedOutboundDataTransferDestinations
        $this.appActionIfUnableToAuthenticateUser = $policy.appActionIfUnableToAuthenticateUser
        $this.maximumAllowedDeviceThreatLevel = $policy.maximumAllowedDeviceThreatLevel
        $this.mobileThreatDefenseRemediationAction = $policy.mobileThreatDefenseRemediationAction
        $this.minimumRequiredSdkVersion = $policy.minimumRequiredSdkVersion
        $this.minimumWipeSdkVersion = $policy.minimumWipeSdkVersion
        $this.minimumRequiredOsVersion = $policy.minimumRequiredOsVersion
        $this.minimumWarningOsVersion = $policy.minimumWarningOsVersion
        $this.minimumWipeOsVersion = $policy.minimumWipeOsVersion
        $this.minimumRequiredAppVersion = $policy.minimumRequiredAppVersion
        $this.minimumWarningAppVersion = $policy.minimumWarningAppVersion
        $this.minimumWipeAppVersion = $policy.minimumWipeAppVersion
        $this.maximumRequiredOsVersion = $policy.maximumRequiredOsVersion
        $this.maximumWarningOsVersion = $policy.maximumWarningOsVersion
        $this.maximumWipeOsVersion = $policy.maximumWipeOsVersion
        $this.periodOfflineBeforeWipeIsEnforced = $policy.periodOfflineBeforeWipeIsEnforced
        $this.periodOfflineBeforeAccessCheck = $policy.periodOfflineBeforeAccessCheck
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMdmWindowsManagedAppProtection"
  }
}
