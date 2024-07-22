class GetEmMacOSDeviceFeaturesConfiguration {
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
    [object[]]$airPrintDestinations
    [object[]]$autoLaunchItems
    [bool]$adminShowHostInfo
    [string]$loginWindowText
    [bool]$authorizedUsersListHidden
    [bool]$authorizedUsersListHideLocalUsers
    [bool]$authorizedUsersListHideMobileAccounts
    [bool]$authorizedUsersListIncludeNetworkUsers
    [bool]$authorizedUsersListHideAdminUsers
    [bool]$authorizedUsersListShowOtherManagedUsers
    [bool]$shutDownDisabled
    [bool]$restartDisabled
    [bool]$sleepDisabled
    [bool]$consoleAccessDisabled
    [bool]$shutDownDisabledWhileLoggedIn
    [bool]$restartDisabledWhileLoggedIn
    [bool]$powerOffDisabledWhileLoggedIn
    [bool]$logOutDisabledWhileLoggedIn
    [bool]$screenLockDisableImmediate
    [object[]]$associatedDomains
    [object[]]$appAssociatedDomains
    [psobject]$singleSignOnExtension
    [psobject]$macOSSingleSignOnExtension
    [bool]$contentCachingEnabled
    [string]$contentCachingType
    [object]$contentCachingMaxSizeBytes
    [string]$contentCachingDataPath
    [bool]$contentCachingDisableConnectionSharing
    [bool]$contentCachingForceConnectionSharing
    [string]$contentCachingClientPolicy
    [object[]]$contentCachingClientListenRanges
    [string]$contentCachingPeerPolicy
    [object[]]$contentCachingPeerListenRanges
    [object[]]$contentCachingPeerFilterRanges
    [string]$contentCachingParentSelectionPolicy
    [object[]]$contentCachingParents
    [bool]$contentCachingLogClientIdentities
    [object[]]$contentCachingPublicRanges
    [bool]$contentCachingBlockDeletion
    [bool]$contentCachingShowAlerts
    [bool]$contentCachingKeepAwake
    [object]$contentCachingPort

  # Default constructor
  GetEmMacOSDeviceFeaturesConfiguration() {
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
        $this.airPrintDestinations = @()
        $this.autoLaunchItems = @()
        $this.adminShowHostInfo = $false
        $this.loginWindowText = ''
        $this.authorizedUsersListHidden = $false
        $this.authorizedUsersListHideLocalUsers = $false
        $this.authorizedUsersListHideMobileAccounts = $false
        $this.authorizedUsersListIncludeNetworkUsers = $false
        $this.authorizedUsersListHideAdminUsers = $false
        $this.authorizedUsersListShowOtherManagedUsers = $false
        $this.shutDownDisabled = $false
        $this.restartDisabled = $false
        $this.sleepDisabled = $false
        $this.consoleAccessDisabled = $false
        $this.shutDownDisabledWhileLoggedIn = $false
        $this.restartDisabledWhileLoggedIn = $false
        $this.powerOffDisabledWhileLoggedIn = $false
        $this.logOutDisabledWhileLoggedIn = $false
        $this.screenLockDisableImmediate = $false
        $this.associatedDomains = @()
        $this.appAssociatedDomains = @()
        $this.singleSignOnExtension = $null
        $this.macOSSingleSignOnExtension = $null
        $this.contentCachingEnabled = $false
        $this.contentCachingType = ''
        $this.contentCachingMaxSizeBytes = $null
        $this.contentCachingDataPath = ''
        $this.contentCachingDisableConnectionSharing = $false
        $this.contentCachingForceConnectionSharing = $false
        $this.contentCachingClientPolicy = ''
        $this.contentCachingClientListenRanges = @()
        $this.contentCachingPeerPolicy = ''
        $this.contentCachingPeerListenRanges = @()
        $this.contentCachingPeerFilterRanges = @()
        $this.contentCachingParentSelectionPolicy = ''
        $this.contentCachingParents = @()
        $this.contentCachingLogClientIdentities = $false
        $this.contentCachingPublicRanges = @()
        $this.contentCachingBlockDeletion = $false
        $this.contentCachingShowAlerts = $false
        $this.contentCachingKeepAwake = $false
        $this.contentCachingPort = $null
  }

  # Parameterized constructor
  GetEmMacOSDeviceFeaturesConfiguration ($policy) {
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
        $this.airPrintDestinations = $policy.airPrintDestinations
        $this.autoLaunchItems = $policy.autoLaunchItems
        $this.adminShowHostInfo = $policy.adminShowHostInfo
        $this.loginWindowText = $policy.loginWindowText
        $this.authorizedUsersListHidden = $policy.authorizedUsersListHidden
        $this.authorizedUsersListHideLocalUsers = $policy.authorizedUsersListHideLocalUsers
        $this.authorizedUsersListHideMobileAccounts = $policy.authorizedUsersListHideMobileAccounts
        $this.authorizedUsersListIncludeNetworkUsers = $policy.authorizedUsersListIncludeNetworkUsers
        $this.authorizedUsersListHideAdminUsers = $policy.authorizedUsersListHideAdminUsers
        $this.authorizedUsersListShowOtherManagedUsers = $policy.authorizedUsersListShowOtherManagedUsers
        $this.shutDownDisabled = $policy.shutDownDisabled
        $this.restartDisabled = $policy.restartDisabled
        $this.sleepDisabled = $policy.sleepDisabled
        $this.consoleAccessDisabled = $policy.consoleAccessDisabled
        $this.shutDownDisabledWhileLoggedIn = $policy.shutDownDisabledWhileLoggedIn
        $this.restartDisabledWhileLoggedIn = $policy.restartDisabledWhileLoggedIn
        $this.powerOffDisabledWhileLoggedIn = $policy.powerOffDisabledWhileLoggedIn
        $this.logOutDisabledWhileLoggedIn = $policy.logOutDisabledWhileLoggedIn
        $this.screenLockDisableImmediate = $policy.screenLockDisableImmediate
        $this.associatedDomains = $policy.associatedDomains
        $this.appAssociatedDomains = $policy.appAssociatedDomains
        $this.singleSignOnExtension = $policy.singleSignOnExtension
        $this.macOSSingleSignOnExtension = $policy.macOSSingleSignOnExtension
        $this.contentCachingEnabled = $policy.contentCachingEnabled
        $this.contentCachingType = $policy.contentCachingType
        $this.contentCachingMaxSizeBytes = $policy.contentCachingMaxSizeBytes
        $this.contentCachingDataPath = $policy.contentCachingDataPath
        $this.contentCachingDisableConnectionSharing = $policy.contentCachingDisableConnectionSharing
        $this.contentCachingForceConnectionSharing = $policy.contentCachingForceConnectionSharing
        $this.contentCachingClientPolicy = $policy.contentCachingClientPolicy
        $this.contentCachingClientListenRanges = $policy.contentCachingClientListenRanges
        $this.contentCachingPeerPolicy = $policy.contentCachingPeerPolicy
        $this.contentCachingPeerListenRanges = $policy.contentCachingPeerListenRanges
        $this.contentCachingPeerFilterRanges = $policy.contentCachingPeerFilterRanges
        $this.contentCachingParentSelectionPolicy = $policy.contentCachingParentSelectionPolicy
        $this.contentCachingParents = $policy.contentCachingParents
        $this.contentCachingLogClientIdentities = $policy.contentCachingLogClientIdentities
        $this.contentCachingPublicRanges = $policy.contentCachingPublicRanges
        $this.contentCachingBlockDeletion = $policy.contentCachingBlockDeletion
        $this.contentCachingShowAlerts = $policy.contentCachingShowAlerts
        $this.contentCachingKeepAwake = $policy.contentCachingKeepAwake
        $this.contentCachingPort = $policy.contentCachingPort
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMacOSDeviceFeaturesConfiguration"
  }
}
