class GetEmMdmAndroidManagedAppProtection {
  [string]${@odata.type}
    [string]$displayName
    [string]$description
    [datetime]$createdDateTime
    [datetime]$lastModifiedDateTime
    [object[]]$roleScopeTagIds
    [string]$id
    [string]$version
    [string]$periodOfflineBeforeAccessCheck
    [string]$periodOnlineBeforeAccessCheck
    [string]$allowedInboundDataTransferSources
    [string]$allowedOutboundDataTransferDestinations
    [bool]$organizationalCredentialsRequired
    [string]$allowedOutboundClipboardSharingLevel
    [bool]$dataBackupBlocked
    [bool]$deviceComplianceRequired
    [bool]$managedBrowserToOpenLinksRequired
    [bool]$saveAsBlocked
    [string]$periodOfflineBeforeWipeIsEnforced
    [bool]$pinRequired
    [object]$maximumPinRetries
    [bool]$simplePinBlocked
    [object]$minimumPinLength
    [string]$pinCharacterSet
    [string]$periodBeforePinReset
    [object[]]$allowedDataStorageLocations
    [bool]$contactSyncBlocked
    [bool]$printBlocked
    [bool]$fingerprintBlocked
    [bool]$disableAppPinIfDevicePinIsSet
    [string]$maximumRequiredOsVersion
    [string]$maximumWarningOsVersion
    [string]$maximumWipeOsVersion
    [string]$minimumRequiredOsVersion
    [string]$minimumWarningOsVersion
    [string]$minimumRequiredAppVersion
    [string]$minimumWarningAppVersion
    [string]$minimumWipeOsVersion
    [string]$minimumWipeAppVersion
    [string]$appActionIfDeviceComplianceRequired
    [string]$appActionIfMaximumPinRetriesExceeded
    [string]$pinRequiredInsteadOfBiometricTimeout
    [object]$allowedOutboundClipboardSharingExceptionLength
    [string]$notificationRestriction
    [object]$previousPinBlockCount
    [string]$managedBrowser
    [string]$maximumAllowedDeviceThreatLevel
    [string]$mobileThreatDefenseRemediationAction
    [string]$mobileThreatDefensePartnerPriority
    [bool]$blockDataIngestionIntoOrganizationDocuments
    [object[]]$allowedDataIngestionLocations
    [string]$appActionIfUnableToAuthenticateUser
    [string]$dialerRestrictionLevel
    [string]$gracePeriodToBlockAppsDuringOffClockHours
    [string]$protectedMessagingRedirectAppType
    [bool]$isAssigned
    [string]$targetedAppManagementLevels
    [string]$appGroupType
    [bool]$screenCaptureBlocked
    [bool]$disableAppEncryptionIfDeviceEncryptionIsEnabled
    [bool]$encryptAppData
    [object]$deployedAppCount
    [string]$minimumRequiredPatchVersion
    [string]$minimumWarningPatchVersion
    [object[]]$exemptedAppPackages
    [string]$minimumWipePatchVersion
    [string]$allowedAndroidDeviceManufacturers
    [string]$appActionIfAndroidDeviceManufacturerNotAllowed
    [string]$appActionIfAccountIsClockedOut
    [string]$appActionIfSamsungKnoxAttestationRequired
    [string]$requiredAndroidSafetyNetDeviceAttestationType
    [string]$appActionIfAndroidSafetyNetDeviceAttestationFailed
    [string]$requiredAndroidSafetyNetAppsVerificationType
    [string]$appActionIfAndroidSafetyNetAppsVerificationFailed
    [string]$customBrowserPackageId
    [string]$customBrowserDisplayName
    [string]$minimumRequiredCompanyPortalVersion
    [string]$minimumWarningCompanyPortalVersion
    [string]$minimumWipeCompanyPortalVersion
    [bool]$keyboardsRestricted
    [object[]]$approvedKeyboards
    [object[]]$allowedAndroidDeviceModels
    [string]$appActionIfAndroidDeviceModelNotAllowed
    [string]$customDialerAppPackageId
    [string]$customDialerAppDisplayName
    [bool]$biometricAuthenticationBlocked
    [string]$requiredAndroidSafetyNetEvaluationType
    [object]$blockAfterCompanyPortalUpdateDeferralInDays
    [object]$warnAfterCompanyPortalUpdateDeferralInDays
    [object]$wipeAfterCompanyPortalUpdateDeferralInDays
    [bool]$deviceLockRequired
    [string]$appActionIfDeviceLockNotSet
    [bool]$connectToVpnOnLaunch
    [string]$appActionIfDevicePasscodeComplexityLessThanLow
    [string]$appActionIfDevicePasscodeComplexityLessThanMedium
    [string]$appActionIfDevicePasscodeComplexityLessThanHigh
    [bool]$requireClass3Biometrics
    [bool]$requirePinAfterBiometricChange
    [bool]$fingerprintAndBiometricEnabled
    [string]$messagingRedirectAppPackageId
    [string]$messagingRedirectAppDisplayName

  # Default constructor
  GetEmMdmAndroidManagedAppProtection() {
      $this."@odata.type" = ''
        $this.displayName = ''
        $this.description = ''
        $this.createdDateTime = [datetime]::MinValue
        $this.lastModifiedDateTime = [datetime]::MinValue
        $this.roleScopeTagIds = @()
        $this.id = ''
        $this.version = ''
        $this.periodOfflineBeforeAccessCheck = ''
        $this.periodOnlineBeforeAccessCheck = ''
        $this.allowedInboundDataTransferSources = ''
        $this.allowedOutboundDataTransferDestinations = ''
        $this.organizationalCredentialsRequired = $false
        $this.allowedOutboundClipboardSharingLevel = ''
        $this.dataBackupBlocked = $false
        $this.deviceComplianceRequired = $false
        $this.managedBrowserToOpenLinksRequired = $false
        $this.saveAsBlocked = $false
        $this.periodOfflineBeforeWipeIsEnforced = ''
        $this.pinRequired = $false
        $this.maximumPinRetries = $null
        $this.simplePinBlocked = $false
        $this.minimumPinLength = $null
        $this.pinCharacterSet = ''
        $this.periodBeforePinReset = ''
        $this.allowedDataStorageLocations = @()
        $this.contactSyncBlocked = $false
        $this.printBlocked = $false
        $this.fingerprintBlocked = $false
        $this.disableAppPinIfDevicePinIsSet = $false
        $this.maximumRequiredOsVersion = ''
        $this.maximumWarningOsVersion = ''
        $this.maximumWipeOsVersion = ''
        $this.minimumRequiredOsVersion = ''
        $this.minimumWarningOsVersion = ''
        $this.minimumRequiredAppVersion = ''
        $this.minimumWarningAppVersion = ''
        $this.minimumWipeOsVersion = ''
        $this.minimumWipeAppVersion = ''
        $this.appActionIfDeviceComplianceRequired = ''
        $this.appActionIfMaximumPinRetriesExceeded = ''
        $this.pinRequiredInsteadOfBiometricTimeout = ''
        $this.allowedOutboundClipboardSharingExceptionLength = $null
        $this.notificationRestriction = ''
        $this.previousPinBlockCount = $null
        $this.managedBrowser = ''
        $this.maximumAllowedDeviceThreatLevel = ''
        $this.mobileThreatDefenseRemediationAction = ''
        $this.mobileThreatDefensePartnerPriority = ''
        $this.blockDataIngestionIntoOrganizationDocuments = $false
        $this.allowedDataIngestionLocations = @()
        $this.appActionIfUnableToAuthenticateUser = ''
        $this.dialerRestrictionLevel = ''
        $this.gracePeriodToBlockAppsDuringOffClockHours = ''
        $this.protectedMessagingRedirectAppType = ''
        $this.isAssigned = $false
        $this.targetedAppManagementLevels = ''
        $this.appGroupType = ''
        $this.screenCaptureBlocked = $false
        $this.disableAppEncryptionIfDeviceEncryptionIsEnabled = $false
        $this.encryptAppData = $false
        $this.deployedAppCount = $null
        $this.minimumRequiredPatchVersion = ''
        $this.minimumWarningPatchVersion = ''
        $this.exemptedAppPackages = @()
        $this.minimumWipePatchVersion = ''
        $this.allowedAndroidDeviceManufacturers = ''
        $this.appActionIfAndroidDeviceManufacturerNotAllowed = ''
        $this.appActionIfAccountIsClockedOut = ''
        $this.appActionIfSamsungKnoxAttestationRequired = ''
        $this.requiredAndroidSafetyNetDeviceAttestationType = ''
        $this.appActionIfAndroidSafetyNetDeviceAttestationFailed = ''
        $this.requiredAndroidSafetyNetAppsVerificationType = ''
        $this.appActionIfAndroidSafetyNetAppsVerificationFailed = ''
        $this.customBrowserPackageId = ''
        $this.customBrowserDisplayName = ''
        $this.minimumRequiredCompanyPortalVersion = ''
        $this.minimumWarningCompanyPortalVersion = ''
        $this.minimumWipeCompanyPortalVersion = ''
        $this.keyboardsRestricted = $false
        $this.approvedKeyboards = @()
        $this.allowedAndroidDeviceModels = @()
        $this.appActionIfAndroidDeviceModelNotAllowed = ''
        $this.customDialerAppPackageId = ''
        $this.customDialerAppDisplayName = ''
        $this.biometricAuthenticationBlocked = $false
        $this.requiredAndroidSafetyNetEvaluationType = ''
        $this.blockAfterCompanyPortalUpdateDeferralInDays = $null
        $this.warnAfterCompanyPortalUpdateDeferralInDays = $null
        $this.wipeAfterCompanyPortalUpdateDeferralInDays = $null
        $this.deviceLockRequired = $false
        $this.appActionIfDeviceLockNotSet = ''
        $this.connectToVpnOnLaunch = $false
        $this.appActionIfDevicePasscodeComplexityLessThanLow = ''
        $this.appActionIfDevicePasscodeComplexityLessThanMedium = ''
        $this.appActionIfDevicePasscodeComplexityLessThanHigh = ''
        $this.requireClass3Biometrics = $false
        $this.requirePinAfterBiometricChange = $false
        $this.fingerprintAndBiometricEnabled = $false
        $this.messagingRedirectAppPackageId = ''
        $this.messagingRedirectAppDisplayName = ''
  }

  # Parameterized constructor
  GetEmMdmAndroidManagedAppProtection ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.displayName = $policy.displayName
        $this.description = $policy.description
        $this.createdDateTime = $policy.createdDateTime
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.id = $policy.id
        $this.version = $policy.version
        $this.periodOfflineBeforeAccessCheck = $policy.periodOfflineBeforeAccessCheck
        $this.periodOnlineBeforeAccessCheck = $policy.periodOnlineBeforeAccessCheck
        $this.allowedInboundDataTransferSources = $policy.allowedInboundDataTransferSources
        $this.allowedOutboundDataTransferDestinations = $policy.allowedOutboundDataTransferDestinations
        $this.organizationalCredentialsRequired = $policy.organizationalCredentialsRequired
        $this.allowedOutboundClipboardSharingLevel = $policy.allowedOutboundClipboardSharingLevel
        $this.dataBackupBlocked = $policy.dataBackupBlocked
        $this.deviceComplianceRequired = $policy.deviceComplianceRequired
        $this.managedBrowserToOpenLinksRequired = $policy.managedBrowserToOpenLinksRequired
        $this.saveAsBlocked = $policy.saveAsBlocked
        $this.periodOfflineBeforeWipeIsEnforced = $policy.periodOfflineBeforeWipeIsEnforced
        $this.pinRequired = $policy.pinRequired
        $this.maximumPinRetries = $policy.maximumPinRetries
        $this.simplePinBlocked = $policy.simplePinBlocked
        $this.minimumPinLength = $policy.minimumPinLength
        $this.pinCharacterSet = $policy.pinCharacterSet
        $this.periodBeforePinReset = $policy.periodBeforePinReset
        $this.allowedDataStorageLocations = $policy.allowedDataStorageLocations
        $this.contactSyncBlocked = $policy.contactSyncBlocked
        $this.printBlocked = $policy.printBlocked
        $this.fingerprintBlocked = $policy.fingerprintBlocked
        $this.disableAppPinIfDevicePinIsSet = $policy.disableAppPinIfDevicePinIsSet
        $this.maximumRequiredOsVersion = $policy.maximumRequiredOsVersion
        $this.maximumWarningOsVersion = $policy.maximumWarningOsVersion
        $this.maximumWipeOsVersion = $policy.maximumWipeOsVersion
        $this.minimumRequiredOsVersion = $policy.minimumRequiredOsVersion
        $this.minimumWarningOsVersion = $policy.minimumWarningOsVersion
        $this.minimumRequiredAppVersion = $policy.minimumRequiredAppVersion
        $this.minimumWarningAppVersion = $policy.minimumWarningAppVersion
        $this.minimumWipeOsVersion = $policy.minimumWipeOsVersion
        $this.minimumWipeAppVersion = $policy.minimumWipeAppVersion
        $this.appActionIfDeviceComplianceRequired = $policy.appActionIfDeviceComplianceRequired
        $this.appActionIfMaximumPinRetriesExceeded = $policy.appActionIfMaximumPinRetriesExceeded
        $this.pinRequiredInsteadOfBiometricTimeout = $policy.pinRequiredInsteadOfBiometricTimeout
        $this.allowedOutboundClipboardSharingExceptionLength = $policy.allowedOutboundClipboardSharingExceptionLength
        $this.notificationRestriction = $policy.notificationRestriction
        $this.previousPinBlockCount = $policy.previousPinBlockCount
        $this.managedBrowser = $policy.managedBrowser
        $this.maximumAllowedDeviceThreatLevel = $policy.maximumAllowedDeviceThreatLevel
        $this.mobileThreatDefenseRemediationAction = $policy.mobileThreatDefenseRemediationAction
        $this.mobileThreatDefensePartnerPriority = $policy.mobileThreatDefensePartnerPriority
        $this.blockDataIngestionIntoOrganizationDocuments = $policy.blockDataIngestionIntoOrganizationDocuments
        $this.allowedDataIngestionLocations = $policy.allowedDataIngestionLocations
        $this.appActionIfUnableToAuthenticateUser = $policy.appActionIfUnableToAuthenticateUser
        $this.dialerRestrictionLevel = $policy.dialerRestrictionLevel
        $this.gracePeriodToBlockAppsDuringOffClockHours = $policy.gracePeriodToBlockAppsDuringOffClockHours
        $this.protectedMessagingRedirectAppType = $policy.protectedMessagingRedirectAppType
        $this.isAssigned = $policy.isAssigned
        $this.targetedAppManagementLevels = $policy.targetedAppManagementLevels
        $this.appGroupType = $policy.appGroupType
        $this.screenCaptureBlocked = $policy.screenCaptureBlocked
        $this.disableAppEncryptionIfDeviceEncryptionIsEnabled = $policy.disableAppEncryptionIfDeviceEncryptionIsEnabled
        $this.encryptAppData = $policy.encryptAppData
        $this.deployedAppCount = $policy.deployedAppCount
        $this.minimumRequiredPatchVersion = $policy.minimumRequiredPatchVersion
        $this.minimumWarningPatchVersion = $policy.minimumWarningPatchVersion
        $this.exemptedAppPackages = $policy.exemptedAppPackages
        $this.minimumWipePatchVersion = $policy.minimumWipePatchVersion
        $this.allowedAndroidDeviceManufacturers = $policy.allowedAndroidDeviceManufacturers
        $this.appActionIfAndroidDeviceManufacturerNotAllowed = $policy.appActionIfAndroidDeviceManufacturerNotAllowed
        $this.appActionIfAccountIsClockedOut = $policy.appActionIfAccountIsClockedOut
        $this.appActionIfSamsungKnoxAttestationRequired = $policy.appActionIfSamsungKnoxAttestationRequired
        $this.requiredAndroidSafetyNetDeviceAttestationType = $policy.requiredAndroidSafetyNetDeviceAttestationType
        $this.appActionIfAndroidSafetyNetDeviceAttestationFailed = $policy.appActionIfAndroidSafetyNetDeviceAttestationFailed
        $this.requiredAndroidSafetyNetAppsVerificationType = $policy.requiredAndroidSafetyNetAppsVerificationType
        $this.appActionIfAndroidSafetyNetAppsVerificationFailed = $policy.appActionIfAndroidSafetyNetAppsVerificationFailed
        $this.customBrowserPackageId = $policy.customBrowserPackageId
        $this.customBrowserDisplayName = $policy.customBrowserDisplayName
        $this.minimumRequiredCompanyPortalVersion = $policy.minimumRequiredCompanyPortalVersion
        $this.minimumWarningCompanyPortalVersion = $policy.minimumWarningCompanyPortalVersion
        $this.minimumWipeCompanyPortalVersion = $policy.minimumWipeCompanyPortalVersion
        $this.keyboardsRestricted = $policy.keyboardsRestricted
        $this.approvedKeyboards = $policy.approvedKeyboards
        $this.allowedAndroidDeviceModels = $policy.allowedAndroidDeviceModels
        $this.appActionIfAndroidDeviceModelNotAllowed = $policy.appActionIfAndroidDeviceModelNotAllowed
        $this.customDialerAppPackageId = $policy.customDialerAppPackageId
        $this.customDialerAppDisplayName = $policy.customDialerAppDisplayName
        $this.biometricAuthenticationBlocked = $policy.biometricAuthenticationBlocked
        $this.requiredAndroidSafetyNetEvaluationType = $policy.requiredAndroidSafetyNetEvaluationType
        $this.blockAfterCompanyPortalUpdateDeferralInDays = $policy.blockAfterCompanyPortalUpdateDeferralInDays
        $this.warnAfterCompanyPortalUpdateDeferralInDays = $policy.warnAfterCompanyPortalUpdateDeferralInDays
        $this.wipeAfterCompanyPortalUpdateDeferralInDays = $policy.wipeAfterCompanyPortalUpdateDeferralInDays
        $this.deviceLockRequired = $policy.deviceLockRequired
        $this.appActionIfDeviceLockNotSet = $policy.appActionIfDeviceLockNotSet
        $this.connectToVpnOnLaunch = $policy.connectToVpnOnLaunch
        $this.appActionIfDevicePasscodeComplexityLessThanLow = $policy.appActionIfDevicePasscodeComplexityLessThanLow
        $this.appActionIfDevicePasscodeComplexityLessThanMedium = $policy.appActionIfDevicePasscodeComplexityLessThanMedium
        $this.appActionIfDevicePasscodeComplexityLessThanHigh = $policy.appActionIfDevicePasscodeComplexityLessThanHigh
        $this.requireClass3Biometrics = $policy.requireClass3Biometrics
        $this.requirePinAfterBiometricChange = $policy.requirePinAfterBiometricChange
        $this.fingerprintAndBiometricEnabled = $policy.fingerprintAndBiometricEnabled
        $this.messagingRedirectAppPackageId = $policy.messagingRedirectAppPackageId
        $this.messagingRedirectAppDisplayName = $policy.messagingRedirectAppDisplayName
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMdmAndroidManagedAppProtection"
  }
}
