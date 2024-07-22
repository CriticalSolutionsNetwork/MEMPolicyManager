class GetEmMdmIosManagedAppProtection {
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
    [string]$appDataEncryptionType
    [string]$minimumRequiredSdkVersion
    [object]$deployedAppCount
    [bool]$faceIdBlocked
    [bool]$allowWidgetContentSync
    [object[]]$exemptedAppProtocols
    [string]$minimumWipeSdkVersion
    [string]$allowedIosDeviceModels
    [string]$appActionIfIosDeviceModelNotAllowed
    [string]$appActionIfAccountIsClockedOut
    [bool]$thirdPartyKeyboardsBlocked
    [bool]$filterOpenInToOnlyManagedApps
    [bool]$disableProtectionOfManagedOutboundOpenInData
    [bool]$protectInboundDataFromUnknownSources
    [string]$customBrowserProtocol
    [string]$customDialerAppProtocol
    [object[]]$managedUniversalLinks
    [object[]]$exemptedUniversalLinks
    [string]$minimumWarningSdkVersion
    [string]$messagingRedirectAppUrlScheme

  # Default constructor
  GetEmMdmIosManagedAppProtection() {
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
        $this.appDataEncryptionType = ''
        $this.minimumRequiredSdkVersion = ''
        $this.deployedAppCount = $null
        $this.faceIdBlocked = $false
        $this.allowWidgetContentSync = $false
        $this.exemptedAppProtocols = @()
        $this.minimumWipeSdkVersion = ''
        $this.allowedIosDeviceModels = ''
        $this.appActionIfIosDeviceModelNotAllowed = ''
        $this.appActionIfAccountIsClockedOut = ''
        $this.thirdPartyKeyboardsBlocked = $false
        $this.filterOpenInToOnlyManagedApps = $false
        $this.disableProtectionOfManagedOutboundOpenInData = $false
        $this.protectInboundDataFromUnknownSources = $false
        $this.customBrowserProtocol = ''
        $this.customDialerAppProtocol = ''
        $this.managedUniversalLinks = @()
        $this.exemptedUniversalLinks = @()
        $this.minimumWarningSdkVersion = ''
        $this.messagingRedirectAppUrlScheme = ''
  }

  # Parameterized constructor
  GetEmMdmIosManagedAppProtection ($policy) {
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
        $this.appDataEncryptionType = $policy.appDataEncryptionType
        $this.minimumRequiredSdkVersion = $policy.minimumRequiredSdkVersion
        $this.deployedAppCount = $policy.deployedAppCount
        $this.faceIdBlocked = $policy.faceIdBlocked
        $this.allowWidgetContentSync = $policy.allowWidgetContentSync
        $this.exemptedAppProtocols = $policy.exemptedAppProtocols
        $this.minimumWipeSdkVersion = $policy.minimumWipeSdkVersion
        $this.allowedIosDeviceModels = $policy.allowedIosDeviceModels
        $this.appActionIfIosDeviceModelNotAllowed = $policy.appActionIfIosDeviceModelNotAllowed
        $this.appActionIfAccountIsClockedOut = $policy.appActionIfAccountIsClockedOut
        $this.thirdPartyKeyboardsBlocked = $policy.thirdPartyKeyboardsBlocked
        $this.filterOpenInToOnlyManagedApps = $policy.filterOpenInToOnlyManagedApps
        $this.disableProtectionOfManagedOutboundOpenInData = $policy.disableProtectionOfManagedOutboundOpenInData
        $this.protectInboundDataFromUnknownSources = $policy.protectInboundDataFromUnknownSources
        $this.customBrowserProtocol = $policy.customBrowserProtocol
        $this.customDialerAppProtocol = $policy.customDialerAppProtocol
        $this.managedUniversalLinks = $policy.managedUniversalLinks
        $this.exemptedUniversalLinks = $policy.exemptedUniversalLinks
        $this.minimumWarningSdkVersion = $policy.minimumWarningSdkVersion
        $this.messagingRedirectAppUrlScheme = $policy.messagingRedirectAppUrlScheme
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMdmIosManagedAppProtection"
  }
}
