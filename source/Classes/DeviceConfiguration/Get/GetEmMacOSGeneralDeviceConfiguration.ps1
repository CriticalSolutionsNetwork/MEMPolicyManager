class GetEmMacOSGeneralDeviceConfiguration {
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
    [object[]]$compliantAppsList
    [string]$compliantAppListType
    [object[]]$emailInDomainSuffixes
    [bool]$passwordBlockSimple
    [object]$passwordExpirationDays
    [object]$passwordMinimumCharacterSetCount
    [object]$passwordMinimumLength
    [object]$passwordMinutesOfInactivityBeforeLock
    [object]$passwordMinutesOfInactivityBeforeScreenTimeout
    [object]$passwordPreviousPasswordBlockCount
    [string]$passwordRequiredType
    [bool]$passwordRequired
    [object]$passwordMaximumAttemptCount
    [object]$passwordMinutesUntilFailedLoginReset
    [bool]$keychainBlockCloudSync
    [bool]$safariBlockAutofill
    [bool]$cameraBlocked
    [bool]$iTunesBlockMusicService
    [bool]$spotlightBlockInternetResults
    [bool]$keyboardBlockDictation
    [bool]$definitionLookupBlocked
    [bool]$appleWatchBlockAutoUnlock
    [bool]$iTunesBlockFileSharing
    [bool]$iCloudBlockDocumentSync
    [bool]$iCloudBlockMail
    [bool]$iCloudBlockAddressBook
    [bool]$iCloudBlockCalendar
    [bool]$iCloudBlockReminders
    [bool]$iCloudBlockBookmarks
    [bool]$iCloudBlockNotes
    [bool]$airDropBlocked
    [bool]$passwordBlockModification
    [bool]$passwordBlockFingerprintUnlock
    [bool]$passwordBlockAutoFill
    [bool]$passwordBlockProximityRequests
    [bool]$passwordBlockAirDropSharing
    [object]$softwareUpdatesEnforcedDelayInDays
    [string]$updateDelayPolicy
    [bool]$contentCachingBlocked
    [bool]$iCloudBlockPhotoLibrary
    [bool]$screenCaptureBlocked
    [bool]$classroomAppBlockRemoteScreenObservation
    [bool]$classroomAppForceUnpromptedScreenObservation
    [bool]$classroomForceAutomaticallyJoinClasses
    [bool]$classroomForceRequestPermissionToLeaveClasses
    [bool]$classroomForceUnpromptedAppAndDeviceLock
    [bool]$iCloudBlockActivityContinuation
    [object[]]$privacyAccessControls
    [bool]$addingGameCenterFriendsBlocked
    [bool]$gameCenterBlocked
    [bool]$multiplayerGamingBlocked
    [bool]$wallpaperModificationBlocked
    [bool]$eraseContentAndSettingsBlocked
    [object]$softwareUpdateMajorOSDeferredInstallDelayInDays
    [object]$softwareUpdateMinorOSDeferredInstallDelayInDays
    [object]$softwareUpdateNonOSDeferredInstallDelayInDays
    [object]$touchIdTimeoutInHours
    [bool]$iCloudPrivateRelayBlocked
    [bool]$iCloudDesktopAndDocumentsBlocked
    [bool]$activationLockWhenSupervisedAllowed

  # Default constructor
  GetEmMacOSGeneralDeviceConfiguration() {
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
        $this.compliantAppsList = @()
        $this.compliantAppListType = ''
        $this.emailInDomainSuffixes = @()
        $this.passwordBlockSimple = $false
        $this.passwordExpirationDays = $null
        $this.passwordMinimumCharacterSetCount = $null
        $this.passwordMinimumLength = $null
        $this.passwordMinutesOfInactivityBeforeLock = $null
        $this.passwordMinutesOfInactivityBeforeScreenTimeout = $null
        $this.passwordPreviousPasswordBlockCount = $null
        $this.passwordRequiredType = ''
        $this.passwordRequired = $false
        $this.passwordMaximumAttemptCount = $null
        $this.passwordMinutesUntilFailedLoginReset = $null
        $this.keychainBlockCloudSync = $false
        $this.safariBlockAutofill = $false
        $this.cameraBlocked = $false
        $this.iTunesBlockMusicService = $false
        $this.spotlightBlockInternetResults = $false
        $this.keyboardBlockDictation = $false
        $this.definitionLookupBlocked = $false
        $this.appleWatchBlockAutoUnlock = $false
        $this.iTunesBlockFileSharing = $false
        $this.iCloudBlockDocumentSync = $false
        $this.iCloudBlockMail = $false
        $this.iCloudBlockAddressBook = $false
        $this.iCloudBlockCalendar = $false
        $this.iCloudBlockReminders = $false
        $this.iCloudBlockBookmarks = $false
        $this.iCloudBlockNotes = $false
        $this.airDropBlocked = $false
        $this.passwordBlockModification = $false
        $this.passwordBlockFingerprintUnlock = $false
        $this.passwordBlockAutoFill = $false
        $this.passwordBlockProximityRequests = $false
        $this.passwordBlockAirDropSharing = $false
        $this.softwareUpdatesEnforcedDelayInDays = $null
        $this.updateDelayPolicy = ''
        $this.contentCachingBlocked = $false
        $this.iCloudBlockPhotoLibrary = $false
        $this.screenCaptureBlocked = $false
        $this.classroomAppBlockRemoteScreenObservation = $false
        $this.classroomAppForceUnpromptedScreenObservation = $false
        $this.classroomForceAutomaticallyJoinClasses = $false
        $this.classroomForceRequestPermissionToLeaveClasses = $false
        $this.classroomForceUnpromptedAppAndDeviceLock = $false
        $this.iCloudBlockActivityContinuation = $false
        $this.privacyAccessControls = @()
        $this.addingGameCenterFriendsBlocked = $false
        $this.gameCenterBlocked = $false
        $this.multiplayerGamingBlocked = $false
        $this.wallpaperModificationBlocked = $false
        $this.eraseContentAndSettingsBlocked = $false
        $this.softwareUpdateMajorOSDeferredInstallDelayInDays = $null
        $this.softwareUpdateMinorOSDeferredInstallDelayInDays = $null
        $this.softwareUpdateNonOSDeferredInstallDelayInDays = $null
        $this.touchIdTimeoutInHours = $null
        $this.iCloudPrivateRelayBlocked = $false
        $this.iCloudDesktopAndDocumentsBlocked = $false
        $this.activationLockWhenSupervisedAllowed = $false
  }

  # Parameterized constructor
  GetEmMacOSGeneralDeviceConfiguration ($policy) {
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
        $this.compliantAppsList = $policy.compliantAppsList
        $this.compliantAppListType = $policy.compliantAppListType
        $this.emailInDomainSuffixes = $policy.emailInDomainSuffixes
        $this.passwordBlockSimple = $policy.passwordBlockSimple
        $this.passwordExpirationDays = $policy.passwordExpirationDays
        $this.passwordMinimumCharacterSetCount = $policy.passwordMinimumCharacterSetCount
        $this.passwordMinimumLength = $policy.passwordMinimumLength
        $this.passwordMinutesOfInactivityBeforeLock = $policy.passwordMinutesOfInactivityBeforeLock
        $this.passwordMinutesOfInactivityBeforeScreenTimeout = $policy.passwordMinutesOfInactivityBeforeScreenTimeout
        $this.passwordPreviousPasswordBlockCount = $policy.passwordPreviousPasswordBlockCount
        $this.passwordRequiredType = $policy.passwordRequiredType
        $this.passwordRequired = $policy.passwordRequired
        $this.passwordMaximumAttemptCount = $policy.passwordMaximumAttemptCount
        $this.passwordMinutesUntilFailedLoginReset = $policy.passwordMinutesUntilFailedLoginReset
        $this.keychainBlockCloudSync = $policy.keychainBlockCloudSync
        $this.safariBlockAutofill = $policy.safariBlockAutofill
        $this.cameraBlocked = $policy.cameraBlocked
        $this.iTunesBlockMusicService = $policy.iTunesBlockMusicService
        $this.spotlightBlockInternetResults = $policy.spotlightBlockInternetResults
        $this.keyboardBlockDictation = $policy.keyboardBlockDictation
        $this.definitionLookupBlocked = $policy.definitionLookupBlocked
        $this.appleWatchBlockAutoUnlock = $policy.appleWatchBlockAutoUnlock
        $this.iTunesBlockFileSharing = $policy.iTunesBlockFileSharing
        $this.iCloudBlockDocumentSync = $policy.iCloudBlockDocumentSync
        $this.iCloudBlockMail = $policy.iCloudBlockMail
        $this.iCloudBlockAddressBook = $policy.iCloudBlockAddressBook
        $this.iCloudBlockCalendar = $policy.iCloudBlockCalendar
        $this.iCloudBlockReminders = $policy.iCloudBlockReminders
        $this.iCloudBlockBookmarks = $policy.iCloudBlockBookmarks
        $this.iCloudBlockNotes = $policy.iCloudBlockNotes
        $this.airDropBlocked = $policy.airDropBlocked
        $this.passwordBlockModification = $policy.passwordBlockModification
        $this.passwordBlockFingerprintUnlock = $policy.passwordBlockFingerprintUnlock
        $this.passwordBlockAutoFill = $policy.passwordBlockAutoFill
        $this.passwordBlockProximityRequests = $policy.passwordBlockProximityRequests
        $this.passwordBlockAirDropSharing = $policy.passwordBlockAirDropSharing
        $this.softwareUpdatesEnforcedDelayInDays = $policy.softwareUpdatesEnforcedDelayInDays
        $this.updateDelayPolicy = $policy.updateDelayPolicy
        $this.contentCachingBlocked = $policy.contentCachingBlocked
        $this.iCloudBlockPhotoLibrary = $policy.iCloudBlockPhotoLibrary
        $this.screenCaptureBlocked = $policy.screenCaptureBlocked
        $this.classroomAppBlockRemoteScreenObservation = $policy.classroomAppBlockRemoteScreenObservation
        $this.classroomAppForceUnpromptedScreenObservation = $policy.classroomAppForceUnpromptedScreenObservation
        $this.classroomForceAutomaticallyJoinClasses = $policy.classroomForceAutomaticallyJoinClasses
        $this.classroomForceRequestPermissionToLeaveClasses = $policy.classroomForceRequestPermissionToLeaveClasses
        $this.classroomForceUnpromptedAppAndDeviceLock = $policy.classroomForceUnpromptedAppAndDeviceLock
        $this.iCloudBlockActivityContinuation = $policy.iCloudBlockActivityContinuation
        $this.privacyAccessControls = $policy.privacyAccessControls
        $this.addingGameCenterFriendsBlocked = $policy.addingGameCenterFriendsBlocked
        $this.gameCenterBlocked = $policy.gameCenterBlocked
        $this.multiplayerGamingBlocked = $policy.multiplayerGamingBlocked
        $this.wallpaperModificationBlocked = $policy.wallpaperModificationBlocked
        $this.eraseContentAndSettingsBlocked = $policy.eraseContentAndSettingsBlocked
        $this.softwareUpdateMajorOSDeferredInstallDelayInDays = $policy.softwareUpdateMajorOSDeferredInstallDelayInDays
        $this.softwareUpdateMinorOSDeferredInstallDelayInDays = $policy.softwareUpdateMinorOSDeferredInstallDelayInDays
        $this.softwareUpdateNonOSDeferredInstallDelayInDays = $policy.softwareUpdateNonOSDeferredInstallDelayInDays
        $this.touchIdTimeoutInHours = $policy.touchIdTimeoutInHours
        $this.iCloudPrivateRelayBlocked = $policy.iCloudPrivateRelayBlocked
        $this.iCloudDesktopAndDocumentsBlocked = $policy.iCloudDesktopAndDocumentsBlocked
        $this.activationLockWhenSupervisedAllowed = $policy.activationLockWhenSupervisedAllowed
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMacOSGeneralDeviceConfiguration"
  }
}
