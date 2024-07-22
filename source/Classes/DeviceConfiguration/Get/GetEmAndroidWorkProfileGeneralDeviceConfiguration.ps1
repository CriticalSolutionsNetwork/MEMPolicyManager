class GetEmAndroidWorkProfileGeneralDeviceConfiguration {
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
    [bool]$passwordBlockFaceUnlock
    [bool]$passwordBlockFingerprintUnlock
    [bool]$passwordBlockIrisUnlock
    [bool]$passwordBlockTrustAgents
    [object]$passwordExpirationDays
    [object]$passwordMinimumLength
    [object]$passwordMinutesOfInactivityBeforeScreenTimeout
    [object]$passwordPreviousPasswordBlockCount
    [object]$passwordSignInFailureCountBeforeFactoryReset
    [string]$passwordRequiredType
    [string]$requiredPasswordComplexity
    [bool]$workProfileAllowAppInstallsFromUnknownSources
    [string]$workProfileDataSharingType
    [bool]$workProfileBlockNotificationsWhileDeviceLocked
    [bool]$workProfileBlockAddingAccounts
    [bool]$workProfileBluetoothEnableContactSharing
    [bool]$workProfileBlockScreenCapture
    [bool]$workProfileBlockCrossProfileCallerId
    [bool]$workProfileBlockCamera
    [bool]$workProfileBlockCrossProfileContactsSearch
    [bool]$workProfileBlockCrossProfileCopyPaste
    [string]$workProfileDefaultAppPermissionPolicy
    [bool]$workProfilePasswordBlockFaceUnlock
    [bool]$workProfilePasswordBlockFingerprintUnlock
    [bool]$workProfilePasswordBlockIrisUnlock
    [bool]$workProfilePasswordBlockTrustAgents
    [object]$workProfilePasswordExpirationDays
    [object]$workProfilePasswordMinimumLength
    [object]$workProfilePasswordMinNumericCharacters
    [object]$workProfilePasswordMinNonLetterCharacters
    [object]$workProfilePasswordMinLetterCharacters
    [object]$workProfilePasswordMinLowerCaseCharacters
    [object]$workProfilePasswordMinUpperCaseCharacters
    [object]$workProfilePasswordMinSymbolCharacters
    [object]$workProfilePasswordMinutesOfInactivityBeforeScreenTimeout
    [object]$workProfilePasswordPreviousPasswordBlockCount
    [object]$workProfilePasswordSignInFailureCountBeforeFactoryReset
    [string]$workProfilePasswordRequiredType
    [string]$workProfileRequiredPasswordComplexity
    [bool]$workProfileRequirePassword
    [bool]$securityRequireVerifyApps
    [string]$vpnAlwaysOnPackageIdentifier
    [bool]$vpnEnableAlwaysOnLockdownMode
    [bool]$workProfileAllowWidgets
    [bool]$workProfileBlockPersonalAppInstallsFromUnknownSources
    [string]$workProfileAccountUse
    [object[]]$allowedGoogleAccountDomains
    [bool]$blockUnifiedPasswordForWorkProfile

  # Default constructor
  GetEmAndroidWorkProfileGeneralDeviceConfiguration() {
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
        $this.passwordBlockFaceUnlock = $false
        $this.passwordBlockFingerprintUnlock = $false
        $this.passwordBlockIrisUnlock = $false
        $this.passwordBlockTrustAgents = $false
        $this.passwordExpirationDays = $null
        $this.passwordMinimumLength = $null
        $this.passwordMinutesOfInactivityBeforeScreenTimeout = $null
        $this.passwordPreviousPasswordBlockCount = $null
        $this.passwordSignInFailureCountBeforeFactoryReset = $null
        $this.passwordRequiredType = ''
        $this.requiredPasswordComplexity = ''
        $this.workProfileAllowAppInstallsFromUnknownSources = $false
        $this.workProfileDataSharingType = ''
        $this.workProfileBlockNotificationsWhileDeviceLocked = $false
        $this.workProfileBlockAddingAccounts = $false
        $this.workProfileBluetoothEnableContactSharing = $false
        $this.workProfileBlockScreenCapture = $false
        $this.workProfileBlockCrossProfileCallerId = $false
        $this.workProfileBlockCamera = $false
        $this.workProfileBlockCrossProfileContactsSearch = $false
        $this.workProfileBlockCrossProfileCopyPaste = $false
        $this.workProfileDefaultAppPermissionPolicy = ''
        $this.workProfilePasswordBlockFaceUnlock = $false
        $this.workProfilePasswordBlockFingerprintUnlock = $false
        $this.workProfilePasswordBlockIrisUnlock = $false
        $this.workProfilePasswordBlockTrustAgents = $false
        $this.workProfilePasswordExpirationDays = $null
        $this.workProfilePasswordMinimumLength = $null
        $this.workProfilePasswordMinNumericCharacters = $null
        $this.workProfilePasswordMinNonLetterCharacters = $null
        $this.workProfilePasswordMinLetterCharacters = $null
        $this.workProfilePasswordMinLowerCaseCharacters = $null
        $this.workProfilePasswordMinUpperCaseCharacters = $null
        $this.workProfilePasswordMinSymbolCharacters = $null
        $this.workProfilePasswordMinutesOfInactivityBeforeScreenTimeout = $null
        $this.workProfilePasswordPreviousPasswordBlockCount = $null
        $this.workProfilePasswordSignInFailureCountBeforeFactoryReset = $null
        $this.workProfilePasswordRequiredType = ''
        $this.workProfileRequiredPasswordComplexity = ''
        $this.workProfileRequirePassword = $false
        $this.securityRequireVerifyApps = $false
        $this.vpnAlwaysOnPackageIdentifier = ''
        $this.vpnEnableAlwaysOnLockdownMode = $false
        $this.workProfileAllowWidgets = $false
        $this.workProfileBlockPersonalAppInstallsFromUnknownSources = $false
        $this.workProfileAccountUse = ''
        $this.allowedGoogleAccountDomains = @()
        $this.blockUnifiedPasswordForWorkProfile = $false
  }

  # Parameterized constructor
  GetEmAndroidWorkProfileGeneralDeviceConfiguration ($policy) {
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
        $this.passwordBlockFaceUnlock = $policy.passwordBlockFaceUnlock
        $this.passwordBlockFingerprintUnlock = $policy.passwordBlockFingerprintUnlock
        $this.passwordBlockIrisUnlock = $policy.passwordBlockIrisUnlock
        $this.passwordBlockTrustAgents = $policy.passwordBlockTrustAgents
        $this.passwordExpirationDays = $policy.passwordExpirationDays
        $this.passwordMinimumLength = $policy.passwordMinimumLength
        $this.passwordMinutesOfInactivityBeforeScreenTimeout = $policy.passwordMinutesOfInactivityBeforeScreenTimeout
        $this.passwordPreviousPasswordBlockCount = $policy.passwordPreviousPasswordBlockCount
        $this.passwordSignInFailureCountBeforeFactoryReset = $policy.passwordSignInFailureCountBeforeFactoryReset
        $this.passwordRequiredType = $policy.passwordRequiredType
        $this.requiredPasswordComplexity = $policy.requiredPasswordComplexity
        $this.workProfileAllowAppInstallsFromUnknownSources = $policy.workProfileAllowAppInstallsFromUnknownSources
        $this.workProfileDataSharingType = $policy.workProfileDataSharingType
        $this.workProfileBlockNotificationsWhileDeviceLocked = $policy.workProfileBlockNotificationsWhileDeviceLocked
        $this.workProfileBlockAddingAccounts = $policy.workProfileBlockAddingAccounts
        $this.workProfileBluetoothEnableContactSharing = $policy.workProfileBluetoothEnableContactSharing
        $this.workProfileBlockScreenCapture = $policy.workProfileBlockScreenCapture
        $this.workProfileBlockCrossProfileCallerId = $policy.workProfileBlockCrossProfileCallerId
        $this.workProfileBlockCamera = $policy.workProfileBlockCamera
        $this.workProfileBlockCrossProfileContactsSearch = $policy.workProfileBlockCrossProfileContactsSearch
        $this.workProfileBlockCrossProfileCopyPaste = $policy.workProfileBlockCrossProfileCopyPaste
        $this.workProfileDefaultAppPermissionPolicy = $policy.workProfileDefaultAppPermissionPolicy
        $this.workProfilePasswordBlockFaceUnlock = $policy.workProfilePasswordBlockFaceUnlock
        $this.workProfilePasswordBlockFingerprintUnlock = $policy.workProfilePasswordBlockFingerprintUnlock
        $this.workProfilePasswordBlockIrisUnlock = $policy.workProfilePasswordBlockIrisUnlock
        $this.workProfilePasswordBlockTrustAgents = $policy.workProfilePasswordBlockTrustAgents
        $this.workProfilePasswordExpirationDays = $policy.workProfilePasswordExpirationDays
        $this.workProfilePasswordMinimumLength = $policy.workProfilePasswordMinimumLength
        $this.workProfilePasswordMinNumericCharacters = $policy.workProfilePasswordMinNumericCharacters
        $this.workProfilePasswordMinNonLetterCharacters = $policy.workProfilePasswordMinNonLetterCharacters
        $this.workProfilePasswordMinLetterCharacters = $policy.workProfilePasswordMinLetterCharacters
        $this.workProfilePasswordMinLowerCaseCharacters = $policy.workProfilePasswordMinLowerCaseCharacters
        $this.workProfilePasswordMinUpperCaseCharacters = $policy.workProfilePasswordMinUpperCaseCharacters
        $this.workProfilePasswordMinSymbolCharacters = $policy.workProfilePasswordMinSymbolCharacters
        $this.workProfilePasswordMinutesOfInactivityBeforeScreenTimeout = $policy.workProfilePasswordMinutesOfInactivityBeforeScreenTimeout
        $this.workProfilePasswordPreviousPasswordBlockCount = $policy.workProfilePasswordPreviousPasswordBlockCount
        $this.workProfilePasswordSignInFailureCountBeforeFactoryReset = $policy.workProfilePasswordSignInFailureCountBeforeFactoryReset
        $this.workProfilePasswordRequiredType = $policy.workProfilePasswordRequiredType
        $this.workProfileRequiredPasswordComplexity = $policy.workProfileRequiredPasswordComplexity
        $this.workProfileRequirePassword = $policy.workProfileRequirePassword
        $this.securityRequireVerifyApps = $policy.securityRequireVerifyApps
        $this.vpnAlwaysOnPackageIdentifier = $policy.vpnAlwaysOnPackageIdentifier
        $this.vpnEnableAlwaysOnLockdownMode = $policy.vpnEnableAlwaysOnLockdownMode
        $this.workProfileAllowWidgets = $policy.workProfileAllowWidgets
        $this.workProfileBlockPersonalAppInstallsFromUnknownSources = $policy.workProfileBlockPersonalAppInstallsFromUnknownSources
        $this.workProfileAccountUse = $policy.workProfileAccountUse
        $this.allowedGoogleAccountDomains = $policy.allowedGoogleAccountDomains
        $this.blockUnifiedPasswordForWorkProfile = $policy.blockUnifiedPasswordForWorkProfile
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmAndroidWorkProfileGeneralDeviceConfiguration"
  }
}
