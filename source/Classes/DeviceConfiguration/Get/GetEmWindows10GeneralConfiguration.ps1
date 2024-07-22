class GetEmWindows10GeneralConfiguration {
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
    [bool]$taskManagerBlockEndTask
    [object]$energySaverOnBatteryThresholdPercentage
    [object]$energySaverPluggedInThresholdPercentage
    [string]$powerLidCloseActionOnBattery
    [string]$powerLidCloseActionPluggedIn
    [string]$powerButtonActionOnBattery
    [string]$powerButtonActionPluggedIn
    [string]$powerSleepButtonActionOnBattery
    [string]$powerSleepButtonActionPluggedIn
    [string]$powerHybridSleepOnBattery
    [string]$powerHybridSleepPluggedIn
    [psobject]$windows10AppsForceUpdateSchedule
    [bool]$enableAutomaticRedeployment
    [string]$microsoftAccountSignInAssistantSettings
    [bool]$authenticationAllowSecondaryDevice
    [string]$authenticationWebSignIn
    [string]$authenticationPreferredAzureADTenantDomainName
    [bool]$cryptographyAllowFipsAlgorithmPolicy
    [object[]]$displayAppListWithGdiDPIScalingTurnedOn
    [object[]]$displayAppListWithGdiDPIScalingTurnedOff
    [string]$enterpriseCloudPrintDiscoveryEndPoint
    [string]$enterpriseCloudPrintOAuthAuthority
    [string]$enterpriseCloudPrintOAuthClientIdentifier
    [string]$enterpriseCloudPrintResourceIdentifier
    [object]$enterpriseCloudPrintDiscoveryMaxLimit
    [string]$enterpriseCloudPrintMopriaDiscoveryResourceIdentifier
    [string]$experienceDoNotSyncBrowserSettings
    [bool]$messagingBlockSync
    [bool]$messagingBlockMMS
    [bool]$messagingBlockRichCommunicationServices
    [object[]]$printerNames
    [string]$printerDefaultName
    [bool]$printerBlockAddition
    [bool]$searchBlockDiacritics
    [bool]$searchDisableAutoLanguageDetection
    [bool]$searchDisableIndexingEncryptedItems
    [bool]$searchEnableRemoteQueries
    [bool]$searchDisableUseLocation
    [bool]$searchDisableLocation
    [bool]$searchDisableIndexerBackoff
    [bool]$searchDisableIndexingRemovableDrive
    [bool]$searchEnableAutomaticIndexSizeManangement
    [bool]$searchBlockWebResults
    [string]$findMyFiles
    [bool]$securityBlockAzureADJoinedDevicesAutoEncryption
    [string]$diagnosticsDataSubmissionMode
    [bool]$oneDriveDisableFileSync
    [string]$systemTelemetryProxyServer
    [string]$edgeTelemetryForMicrosoft365Analytics
    [string]$inkWorkspaceAccess
    [string]$inkWorkspaceAccessState
    [bool]$inkWorkspaceBlockSuggestedApps
    [bool]$smartScreenEnableAppInstallControl
    [string]$smartScreenAppInstallControl
    [string]$personalizationDesktopImageUrl
    [string]$personalizationLockScreenImageUrl
    [object[]]$bluetoothAllowedServices
    [bool]$bluetoothBlockAdvertising
    [bool]$bluetoothBlockPromptedProximalConnections
    [bool]$bluetoothBlockDiscoverableMode
    [bool]$bluetoothBlockPrePairing
    [bool]$edgeBlockAutofill
    [bool]$edgeBlocked
    [string]$edgeCookiePolicy
    [bool]$edgeBlockDeveloperTools
    [bool]$edgeBlockSendingDoNotTrackHeader
    [bool]$edgeBlockExtensions
    [bool]$edgeBlockInPrivateBrowsing
    [bool]$edgeBlockJavaScript
    [bool]$edgeBlockPasswordManager
    [bool]$edgeBlockAddressBarDropdown
    [bool]$edgeBlockCompatibilityList
    [bool]$edgeClearBrowsingDataOnExit
    [bool]$edgeAllowStartPagesModification
    [bool]$edgeDisableFirstRunPage
    [bool]$edgeBlockLiveTileDataCollection
    [bool]$edgeSyncFavoritesWithInternetExplorer
    [string]$edgeFavoritesListLocation
    [bool]$edgeBlockEditFavorites
    [string]$edgeNewTabPageURL
    [psobject]$edgeHomeButtonConfiguration
    [bool]$edgeHomeButtonConfigurationEnabled
    [string]$edgeOpensWith
    [bool]$edgeBlockSideloadingExtensions
    [object[]]$edgeRequiredExtensionPackageFamilyNames
    [bool]$edgeBlockPrinting
    [string]$edgeFavoritesBarVisibility
    [bool]$edgeBlockSavingHistory
    [bool]$edgeBlockFullScreenMode
    [bool]$edgeBlockWebContentOnNewTabPage
    [bool]$edgeBlockTabPreloading
    [bool]$edgeBlockPrelaunch
    [string]$edgeShowMessageWhenOpeningInternetExplorerSites
    [bool]$edgePreventCertificateErrorOverride
    [string]$edgeKioskModeRestriction
    [object]$edgeKioskResetAfterIdleTimeInMinutes
    [bool]$cellularBlockDataWhenRoaming
    [bool]$cellularBlockVpn
    [bool]$cellularBlockVpnWhenRoaming
    [string]$cellularData
    [bool]$defenderRequireRealTimeMonitoring
    [bool]$defenderRequireBehaviorMonitoring
    [bool]$defenderRequireNetworkInspectionSystem
    [bool]$defenderScanDownloads
    [bool]$defenderScheduleScanEnableLowCpuPriority
    [bool]$defenderDisableCatchupQuickScan
    [bool]$defenderDisableCatchupFullScan
    [bool]$defenderScanScriptsLoadedInInternetExplorer
    [bool]$defenderBlockEndUserAccess
    [object]$defenderSignatureUpdateIntervalInHours
    [string]$defenderMonitorFileActivity
    [object]$defenderDaysBeforeDeletingQuarantinedMalware
    [object]$defenderScanMaxCpu
    [bool]$defenderScanArchiveFiles
    [bool]$defenderScanIncomingMail
    [bool]$defenderScanRemovableDrivesDuringFullScan
    [bool]$defenderScanMappedNetworkDrivesDuringFullScan
    [bool]$defenderScanNetworkFiles
    [bool]$defenderRequireCloudProtection
    [string]$defenderCloudBlockLevel
    [object]$defenderCloudExtendedTimeout
    [object]$defenderCloudExtendedTimeoutInSeconds
    [string]$defenderPromptForSampleSubmission
    [string]$defenderScheduledQuickScanTime
    [string]$defenderScanType
    [string]$defenderSystemScanSchedule
    [string]$defenderScheduledScanTime
    [string]$defenderPotentiallyUnwantedAppAction
    [string]$defenderPotentiallyUnwantedAppActionSetting
    [string]$defenderSubmitSamplesConsentType
    [bool]$defenderBlockOnAccessProtection
    [psobject]$defenderDetectedMalwareActions
    [object[]]$defenderFileExtensionsToExclude
    [object[]]$defenderFilesAndFoldersToExclude
    [object[]]$defenderProcessesToExclude
    [bool]$lockScreenAllowTimeoutConfiguration
    [bool]$lockScreenBlockActionCenterNotifications
    [bool]$lockScreenBlockCortana
    [bool]$lockScreenBlockToastNotifications
    [object]$lockScreenTimeoutInSeconds
    [string]$lockScreenActivateAppsWithVoice
    [bool]$passwordBlockSimple
    [object]$passwordExpirationDays
    [object]$passwordMinimumLength
    [object]$passwordMinutesOfInactivityBeforeScreenTimeout
    [object]$passwordMinimumCharacterSetCount
    [object]$passwordPreviousPasswordBlockCount
    [bool]$passwordRequired
    [bool]$passwordRequireWhenResumeFromIdleState
    [string]$passwordRequiredType
    [object]$passwordSignInFailureCountBeforeFactoryReset
    [object]$passwordMinimumAgeInDays
    [string]$privacyAdvertisingId
    [bool]$privacyAutoAcceptPairingAndConsentPrompts
    [bool]$privacyDisableLaunchExperience
    [bool]$privacyBlockInputPersonalization
    [bool]$privacyBlockPublishUserActivities
    [bool]$privacyBlockActivityFeed
    [string]$activateAppsWithVoice
    [bool]$startBlockUnpinningAppsFromTaskbar
    [string]$startMenuAppListVisibility
    [bool]$startMenuHideChangeAccountSettings
    [bool]$startMenuHideFrequentlyUsedApps
    [bool]$startMenuHideHibernate
    [bool]$startMenuHideLock
    [bool]$startMenuHidePowerButton
    [bool]$startMenuHideRecentJumpLists
    [bool]$startMenuHideRecentlyAddedApps
    [bool]$startMenuHideRestartOptions
    [bool]$startMenuHideShutDown
    [bool]$startMenuHideSignOut
    [bool]$startMenuHideSleep
    [bool]$startMenuHideSwitchAccount
    [bool]$startMenuHideUserTile
    [string]$startMenuLayoutEdgeAssetsXml
    [string]$startMenuLayoutXml
    [string]$startMenuMode
    [string]$startMenuPinnedFolderDocuments
    [string]$startMenuPinnedFolderDownloads
    [string]$startMenuPinnedFolderFileExplorer
    [string]$startMenuPinnedFolderHomeGroup
    [string]$startMenuPinnedFolderMusic
    [string]$startMenuPinnedFolderNetwork
    [string]$startMenuPinnedFolderPersonalFolder
    [string]$startMenuPinnedFolderPictures
    [string]$startMenuPinnedFolderSettings
    [string]$startMenuPinnedFolderVideos
    [bool]$settingsBlockSettingsApp
    [bool]$settingsBlockSystemPage
    [bool]$settingsBlockDevicesPage
    [bool]$settingsBlockNetworkInternetPage
    [bool]$settingsBlockPersonalizationPage
    [bool]$settingsBlockAccountsPage
    [bool]$settingsBlockTimeLanguagePage
    [bool]$settingsBlockEaseOfAccessPage
    [bool]$settingsBlockPrivacyPage
    [bool]$settingsBlockUpdateSecurityPage
    [bool]$settingsBlockAppsPage
    [bool]$settingsBlockGamingPage
    [bool]$windowsSpotlightBlockConsumerSpecificFeatures
    [bool]$windowsSpotlightBlocked
    [bool]$windowsSpotlightBlockOnActionCenter
    [bool]$windowsSpotlightBlockTailoredExperiences
    [bool]$windowsSpotlightBlockThirdPartyNotifications
    [bool]$windowsSpotlightBlockWelcomeExperience
    [bool]$windowsSpotlightBlockWindowsTips
    [string]$windowsSpotlightConfigureOnLockScreen
    [bool]$networkProxyApplySettingsDeviceWide
    [bool]$networkProxyDisableAutoDetect
    [string]$networkProxyAutomaticConfigurationUrl
    [psobject]$networkProxyServer
    [bool]$accountsBlockAddingNonMicrosoftAccountEmail
    [bool]$antiTheftModeBlocked
    [bool]$bluetoothBlocked
    [bool]$cameraBlocked
    [bool]$connectedDevicesServiceBlocked
    [bool]$certificatesBlockManualRootCertificateInstallation
    [bool]$copyPasteBlocked
    [bool]$cortanaBlocked
    [bool]$deviceManagementBlockFactoryResetOnMobile
    [bool]$deviceManagementBlockManualUnenroll
    [string]$safeSearchFilter
    [bool]$edgeBlockPopups
    [bool]$edgeBlockSearchSuggestions
    [bool]$edgeBlockSearchEngineCustomization
    [bool]$edgeBlockSendingIntranetTrafficToInternetExplorer
    [bool]$edgeSendIntranetTrafficToInternetExplorer
    [bool]$edgeRequireSmartScreen
    [string]$edgeEnterpriseModeSiteListLocation
    [string]$edgeFirstRunUrl
    [psobject]$edgeSearchEngine
    [object[]]$edgeHomepageUrls
    [bool]$edgeBlockAccessToAboutFlags
    [bool]$smartScreenBlockPromptOverride
    [bool]$smartScreenBlockPromptOverrideForFiles
    [bool]$webRtcBlockLocalhostIpAddress
    [bool]$internetSharingBlocked
    [bool]$settingsBlockAddProvisioningPackage
    [bool]$settingsBlockRemoveProvisioningPackage
    [bool]$settingsBlockChangeSystemTime
    [bool]$settingsBlockEditDeviceName
    [bool]$settingsBlockChangeRegion
    [bool]$settingsBlockChangeLanguage
    [bool]$settingsBlockChangePowerSleep
    [bool]$locationServicesBlocked
    [bool]$microsoftAccountBlocked
    [bool]$microsoftAccountBlockSettingsSync
    [bool]$nfcBlocked
    [bool]$resetProtectionModeBlocked
    [bool]$screenCaptureBlocked
    [bool]$storageBlockRemovableStorage
    [bool]$storageRequireMobileDeviceEncryption
    [bool]$usbBlocked
    [bool]$voiceRecordingBlocked
    [bool]$wiFiBlockAutomaticConnectHotspots
    [bool]$wiFiBlocked
    [bool]$wiFiBlockManualConfiguration
    [object]$wiFiScanInterval
    [bool]$wirelessDisplayBlockProjectionToThisDevice
    [bool]$wirelessDisplayBlockUserInputFromReceiver
    [bool]$wirelessDisplayRequirePinForPairing
    [bool]$windowsStoreBlocked
    [string]$appsAllowTrustedAppsSideloading
    [bool]$windowsStoreBlockAutoUpdate
    [string]$developerUnlockSetting
    [bool]$sharedUserAppDataAllowed
    [bool]$appsBlockWindowsStoreOriginatedApps
    [bool]$windowsStoreEnablePrivateStoreOnly
    [bool]$storageRestrictAppDataToSystemVolume
    [bool]$storageRestrictAppInstallToSystemVolume
    [bool]$gameDvrBlocked
    [bool]$experienceBlockDeviceDiscovery
    [bool]$experienceBlockErrorDialogWhenNoSIM
    [bool]$experienceBlockTaskSwitcher
    [bool]$logonBlockFastUserSwitching
    [bool]$tenantLockdownRequireNetworkDuringOutOfBoxExperience
    [bool]$appManagementMSIAllowUserControlOverInstall
    [bool]$appManagementMSIAlwaysInstallWithElevatedPrivileges
    [bool]$dataProtectionBlockDirectMemoryAccess
    [object[]]$appManagementPackageFamilyNamesToLaunchAfterLogOn
    [bool]$uninstallBuiltInApps
    [string]$configureTimeZone

  # Default constructor
  GetEmWindows10GeneralConfiguration() {
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
        $this.taskManagerBlockEndTask = $false
        $this.energySaverOnBatteryThresholdPercentage = $null
        $this.energySaverPluggedInThresholdPercentage = $null
        $this.powerLidCloseActionOnBattery = ''
        $this.powerLidCloseActionPluggedIn = ''
        $this.powerButtonActionOnBattery = ''
        $this.powerButtonActionPluggedIn = ''
        $this.powerSleepButtonActionOnBattery = ''
        $this.powerSleepButtonActionPluggedIn = ''
        $this.powerHybridSleepOnBattery = ''
        $this.powerHybridSleepPluggedIn = ''
        $this.windows10AppsForceUpdateSchedule = $null
        $this.enableAutomaticRedeployment = $false
        $this.microsoftAccountSignInAssistantSettings = ''
        $this.authenticationAllowSecondaryDevice = $false
        $this.authenticationWebSignIn = ''
        $this.authenticationPreferredAzureADTenantDomainName = ''
        $this.cryptographyAllowFipsAlgorithmPolicy = $false
        $this.displayAppListWithGdiDPIScalingTurnedOn = @()
        $this.displayAppListWithGdiDPIScalingTurnedOff = @()
        $this.enterpriseCloudPrintDiscoveryEndPoint = ''
        $this.enterpriseCloudPrintOAuthAuthority = ''
        $this.enterpriseCloudPrintOAuthClientIdentifier = ''
        $this.enterpriseCloudPrintResourceIdentifier = ''
        $this.enterpriseCloudPrintDiscoveryMaxLimit = $null
        $this.enterpriseCloudPrintMopriaDiscoveryResourceIdentifier = ''
        $this.experienceDoNotSyncBrowserSettings = ''
        $this.messagingBlockSync = $false
        $this.messagingBlockMMS = $false
        $this.messagingBlockRichCommunicationServices = $false
        $this.printerNames = @()
        $this.printerDefaultName = ''
        $this.printerBlockAddition = $false
        $this.searchBlockDiacritics = $false
        $this.searchDisableAutoLanguageDetection = $false
        $this.searchDisableIndexingEncryptedItems = $false
        $this.searchEnableRemoteQueries = $false
        $this.searchDisableUseLocation = $false
        $this.searchDisableLocation = $false
        $this.searchDisableIndexerBackoff = $false
        $this.searchDisableIndexingRemovableDrive = $false
        $this.searchEnableAutomaticIndexSizeManangement = $false
        $this.searchBlockWebResults = $false
        $this.findMyFiles = ''
        $this.securityBlockAzureADJoinedDevicesAutoEncryption = $false
        $this.diagnosticsDataSubmissionMode = ''
        $this.oneDriveDisableFileSync = $false
        $this.systemTelemetryProxyServer = ''
        $this.edgeTelemetryForMicrosoft365Analytics = ''
        $this.inkWorkspaceAccess = ''
        $this.inkWorkspaceAccessState = ''
        $this.inkWorkspaceBlockSuggestedApps = $false
        $this.smartScreenEnableAppInstallControl = $false
        $this.smartScreenAppInstallControl = ''
        $this.personalizationDesktopImageUrl = ''
        $this.personalizationLockScreenImageUrl = ''
        $this.bluetoothAllowedServices = @()
        $this.bluetoothBlockAdvertising = $false
        $this.bluetoothBlockPromptedProximalConnections = $false
        $this.bluetoothBlockDiscoverableMode = $false
        $this.bluetoothBlockPrePairing = $false
        $this.edgeBlockAutofill = $false
        $this.edgeBlocked = $false
        $this.edgeCookiePolicy = ''
        $this.edgeBlockDeveloperTools = $false
        $this.edgeBlockSendingDoNotTrackHeader = $false
        $this.edgeBlockExtensions = $false
        $this.edgeBlockInPrivateBrowsing = $false
        $this.edgeBlockJavaScript = $false
        $this.edgeBlockPasswordManager = $false
        $this.edgeBlockAddressBarDropdown = $false
        $this.edgeBlockCompatibilityList = $false
        $this.edgeClearBrowsingDataOnExit = $false
        $this.edgeAllowStartPagesModification = $false
        $this.edgeDisableFirstRunPage = $false
        $this.edgeBlockLiveTileDataCollection = $false
        $this.edgeSyncFavoritesWithInternetExplorer = $false
        $this.edgeFavoritesListLocation = ''
        $this.edgeBlockEditFavorites = $false
        $this.edgeNewTabPageURL = ''
        $this.edgeHomeButtonConfiguration = $null
        $this.edgeHomeButtonConfigurationEnabled = $false
        $this.edgeOpensWith = ''
        $this.edgeBlockSideloadingExtensions = $false
        $this.edgeRequiredExtensionPackageFamilyNames = @()
        $this.edgeBlockPrinting = $false
        $this.edgeFavoritesBarVisibility = ''
        $this.edgeBlockSavingHistory = $false
        $this.edgeBlockFullScreenMode = $false
        $this.edgeBlockWebContentOnNewTabPage = $false
        $this.edgeBlockTabPreloading = $false
        $this.edgeBlockPrelaunch = $false
        $this.edgeShowMessageWhenOpeningInternetExplorerSites = ''
        $this.edgePreventCertificateErrorOverride = $false
        $this.edgeKioskModeRestriction = ''
        $this.edgeKioskResetAfterIdleTimeInMinutes = $null
        $this.cellularBlockDataWhenRoaming = $false
        $this.cellularBlockVpn = $false
        $this.cellularBlockVpnWhenRoaming = $false
        $this.cellularData = ''
        $this.defenderRequireRealTimeMonitoring = $false
        $this.defenderRequireBehaviorMonitoring = $false
        $this.defenderRequireNetworkInspectionSystem = $false
        $this.defenderScanDownloads = $false
        $this.defenderScheduleScanEnableLowCpuPriority = $false
        $this.defenderDisableCatchupQuickScan = $false
        $this.defenderDisableCatchupFullScan = $false
        $this.defenderScanScriptsLoadedInInternetExplorer = $false
        $this.defenderBlockEndUserAccess = $false
        $this.defenderSignatureUpdateIntervalInHours = $null
        $this.defenderMonitorFileActivity = ''
        $this.defenderDaysBeforeDeletingQuarantinedMalware = $null
        $this.defenderScanMaxCpu = $null
        $this.defenderScanArchiveFiles = $false
        $this.defenderScanIncomingMail = $false
        $this.defenderScanRemovableDrivesDuringFullScan = $false
        $this.defenderScanMappedNetworkDrivesDuringFullScan = $false
        $this.defenderScanNetworkFiles = $false
        $this.defenderRequireCloudProtection = $false
        $this.defenderCloudBlockLevel = ''
        $this.defenderCloudExtendedTimeout = $null
        $this.defenderCloudExtendedTimeoutInSeconds = $null
        $this.defenderPromptForSampleSubmission = ''
        $this.defenderScheduledQuickScanTime = ''
        $this.defenderScanType = ''
        $this.defenderSystemScanSchedule = ''
        $this.defenderScheduledScanTime = ''
        $this.defenderPotentiallyUnwantedAppAction = ''
        $this.defenderPotentiallyUnwantedAppActionSetting = ''
        $this.defenderSubmitSamplesConsentType = ''
        $this.defenderBlockOnAccessProtection = $false
        $this.defenderDetectedMalwareActions = $null
        $this.defenderFileExtensionsToExclude = @()
        $this.defenderFilesAndFoldersToExclude = @()
        $this.defenderProcessesToExclude = @()
        $this.lockScreenAllowTimeoutConfiguration = $false
        $this.lockScreenBlockActionCenterNotifications = $false
        $this.lockScreenBlockCortana = $false
        $this.lockScreenBlockToastNotifications = $false
        $this.lockScreenTimeoutInSeconds = $null
        $this.lockScreenActivateAppsWithVoice = ''
        $this.passwordBlockSimple = $false
        $this.passwordExpirationDays = $null
        $this.passwordMinimumLength = $null
        $this.passwordMinutesOfInactivityBeforeScreenTimeout = $null
        $this.passwordMinimumCharacterSetCount = $null
        $this.passwordPreviousPasswordBlockCount = $null
        $this.passwordRequired = $false
        $this.passwordRequireWhenResumeFromIdleState = $false
        $this.passwordRequiredType = ''
        $this.passwordSignInFailureCountBeforeFactoryReset = $null
        $this.passwordMinimumAgeInDays = $null
        $this.privacyAdvertisingId = ''
        $this.privacyAutoAcceptPairingAndConsentPrompts = $false
        $this.privacyDisableLaunchExperience = $false
        $this.privacyBlockInputPersonalization = $false
        $this.privacyBlockPublishUserActivities = $false
        $this.privacyBlockActivityFeed = $false
        $this.activateAppsWithVoice = ''
        $this.startBlockUnpinningAppsFromTaskbar = $false
        $this.startMenuAppListVisibility = ''
        $this.startMenuHideChangeAccountSettings = $false
        $this.startMenuHideFrequentlyUsedApps = $false
        $this.startMenuHideHibernate = $false
        $this.startMenuHideLock = $false
        $this.startMenuHidePowerButton = $false
        $this.startMenuHideRecentJumpLists = $false
        $this.startMenuHideRecentlyAddedApps = $false
        $this.startMenuHideRestartOptions = $false
        $this.startMenuHideShutDown = $false
        $this.startMenuHideSignOut = $false
        $this.startMenuHideSleep = $false
        $this.startMenuHideSwitchAccount = $false
        $this.startMenuHideUserTile = $false
        $this.startMenuLayoutEdgeAssetsXml = ''
        $this.startMenuLayoutXml = ''
        $this.startMenuMode = ''
        $this.startMenuPinnedFolderDocuments = ''
        $this.startMenuPinnedFolderDownloads = ''
        $this.startMenuPinnedFolderFileExplorer = ''
        $this.startMenuPinnedFolderHomeGroup = ''
        $this.startMenuPinnedFolderMusic = ''
        $this.startMenuPinnedFolderNetwork = ''
        $this.startMenuPinnedFolderPersonalFolder = ''
        $this.startMenuPinnedFolderPictures = ''
        $this.startMenuPinnedFolderSettings = ''
        $this.startMenuPinnedFolderVideos = ''
        $this.settingsBlockSettingsApp = $false
        $this.settingsBlockSystemPage = $false
        $this.settingsBlockDevicesPage = $false
        $this.settingsBlockNetworkInternetPage = $false
        $this.settingsBlockPersonalizationPage = $false
        $this.settingsBlockAccountsPage = $false
        $this.settingsBlockTimeLanguagePage = $false
        $this.settingsBlockEaseOfAccessPage = $false
        $this.settingsBlockPrivacyPage = $false
        $this.settingsBlockUpdateSecurityPage = $false
        $this.settingsBlockAppsPage = $false
        $this.settingsBlockGamingPage = $false
        $this.windowsSpotlightBlockConsumerSpecificFeatures = $false
        $this.windowsSpotlightBlocked = $false
        $this.windowsSpotlightBlockOnActionCenter = $false
        $this.windowsSpotlightBlockTailoredExperiences = $false
        $this.windowsSpotlightBlockThirdPartyNotifications = $false
        $this.windowsSpotlightBlockWelcomeExperience = $false
        $this.windowsSpotlightBlockWindowsTips = $false
        $this.windowsSpotlightConfigureOnLockScreen = ''
        $this.networkProxyApplySettingsDeviceWide = $false
        $this.networkProxyDisableAutoDetect = $false
        $this.networkProxyAutomaticConfigurationUrl = ''
        $this.networkProxyServer = $null
        $this.accountsBlockAddingNonMicrosoftAccountEmail = $false
        $this.antiTheftModeBlocked = $false
        $this.bluetoothBlocked = $false
        $this.cameraBlocked = $false
        $this.connectedDevicesServiceBlocked = $false
        $this.certificatesBlockManualRootCertificateInstallation = $false
        $this.copyPasteBlocked = $false
        $this.cortanaBlocked = $false
        $this.deviceManagementBlockFactoryResetOnMobile = $false
        $this.deviceManagementBlockManualUnenroll = $false
        $this.safeSearchFilter = ''
        $this.edgeBlockPopups = $false
        $this.edgeBlockSearchSuggestions = $false
        $this.edgeBlockSearchEngineCustomization = $false
        $this.edgeBlockSendingIntranetTrafficToInternetExplorer = $false
        $this.edgeSendIntranetTrafficToInternetExplorer = $false
        $this.edgeRequireSmartScreen = $false
        $this.edgeEnterpriseModeSiteListLocation = ''
        $this.edgeFirstRunUrl = ''
        $this.edgeSearchEngine = $null
        $this.edgeHomepageUrls = @()
        $this.edgeBlockAccessToAboutFlags = $false
        $this.smartScreenBlockPromptOverride = $false
        $this.smartScreenBlockPromptOverrideForFiles = $false
        $this.webRtcBlockLocalhostIpAddress = $false
        $this.internetSharingBlocked = $false
        $this.settingsBlockAddProvisioningPackage = $false
        $this.settingsBlockRemoveProvisioningPackage = $false
        $this.settingsBlockChangeSystemTime = $false
        $this.settingsBlockEditDeviceName = $false
        $this.settingsBlockChangeRegion = $false
        $this.settingsBlockChangeLanguage = $false
        $this.settingsBlockChangePowerSleep = $false
        $this.locationServicesBlocked = $false
        $this.microsoftAccountBlocked = $false
        $this.microsoftAccountBlockSettingsSync = $false
        $this.nfcBlocked = $false
        $this.resetProtectionModeBlocked = $false
        $this.screenCaptureBlocked = $false
        $this.storageBlockRemovableStorage = $false
        $this.storageRequireMobileDeviceEncryption = $false
        $this.usbBlocked = $false
        $this.voiceRecordingBlocked = $false
        $this.wiFiBlockAutomaticConnectHotspots = $false
        $this.wiFiBlocked = $false
        $this.wiFiBlockManualConfiguration = $false
        $this.wiFiScanInterval = $null
        $this.wirelessDisplayBlockProjectionToThisDevice = $false
        $this.wirelessDisplayBlockUserInputFromReceiver = $false
        $this.wirelessDisplayRequirePinForPairing = $false
        $this.windowsStoreBlocked = $false
        $this.appsAllowTrustedAppsSideloading = ''
        $this.windowsStoreBlockAutoUpdate = $false
        $this.developerUnlockSetting = ''
        $this.sharedUserAppDataAllowed = $false
        $this.appsBlockWindowsStoreOriginatedApps = $false
        $this.windowsStoreEnablePrivateStoreOnly = $false
        $this.storageRestrictAppDataToSystemVolume = $false
        $this.storageRestrictAppInstallToSystemVolume = $false
        $this.gameDvrBlocked = $false
        $this.experienceBlockDeviceDiscovery = $false
        $this.experienceBlockErrorDialogWhenNoSIM = $false
        $this.experienceBlockTaskSwitcher = $false
        $this.logonBlockFastUserSwitching = $false
        $this.tenantLockdownRequireNetworkDuringOutOfBoxExperience = $false
        $this.appManagementMSIAllowUserControlOverInstall = $false
        $this.appManagementMSIAlwaysInstallWithElevatedPrivileges = $false
        $this.dataProtectionBlockDirectMemoryAccess = $false
        $this.appManagementPackageFamilyNamesToLaunchAfterLogOn = @()
        $this.uninstallBuiltInApps = $false
        $this.configureTimeZone = ''
  }

  # Parameterized constructor
  GetEmWindows10GeneralConfiguration ($policy) {
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
        $this.taskManagerBlockEndTask = $policy.taskManagerBlockEndTask
        $this.energySaverOnBatteryThresholdPercentage = $policy.energySaverOnBatteryThresholdPercentage
        $this.energySaverPluggedInThresholdPercentage = $policy.energySaverPluggedInThresholdPercentage
        $this.powerLidCloseActionOnBattery = $policy.powerLidCloseActionOnBattery
        $this.powerLidCloseActionPluggedIn = $policy.powerLidCloseActionPluggedIn
        $this.powerButtonActionOnBattery = $policy.powerButtonActionOnBattery
        $this.powerButtonActionPluggedIn = $policy.powerButtonActionPluggedIn
        $this.powerSleepButtonActionOnBattery = $policy.powerSleepButtonActionOnBattery
        $this.powerSleepButtonActionPluggedIn = $policy.powerSleepButtonActionPluggedIn
        $this.powerHybridSleepOnBattery = $policy.powerHybridSleepOnBattery
        $this.powerHybridSleepPluggedIn = $policy.powerHybridSleepPluggedIn
        $this.windows10AppsForceUpdateSchedule = $policy.windows10AppsForceUpdateSchedule
        $this.enableAutomaticRedeployment = $policy.enableAutomaticRedeployment
        $this.microsoftAccountSignInAssistantSettings = $policy.microsoftAccountSignInAssistantSettings
        $this.authenticationAllowSecondaryDevice = $policy.authenticationAllowSecondaryDevice
        $this.authenticationWebSignIn = $policy.authenticationWebSignIn
        $this.authenticationPreferredAzureADTenantDomainName = $policy.authenticationPreferredAzureADTenantDomainName
        $this.cryptographyAllowFipsAlgorithmPolicy = $policy.cryptographyAllowFipsAlgorithmPolicy
        $this.displayAppListWithGdiDPIScalingTurnedOn = $policy.displayAppListWithGdiDPIScalingTurnedOn
        $this.displayAppListWithGdiDPIScalingTurnedOff = $policy.displayAppListWithGdiDPIScalingTurnedOff
        $this.enterpriseCloudPrintDiscoveryEndPoint = $policy.enterpriseCloudPrintDiscoveryEndPoint
        $this.enterpriseCloudPrintOAuthAuthority = $policy.enterpriseCloudPrintOAuthAuthority
        $this.enterpriseCloudPrintOAuthClientIdentifier = $policy.enterpriseCloudPrintOAuthClientIdentifier
        $this.enterpriseCloudPrintResourceIdentifier = $policy.enterpriseCloudPrintResourceIdentifier
        $this.enterpriseCloudPrintDiscoveryMaxLimit = $policy.enterpriseCloudPrintDiscoveryMaxLimit
        $this.enterpriseCloudPrintMopriaDiscoveryResourceIdentifier = $policy.enterpriseCloudPrintMopriaDiscoveryResourceIdentifier
        $this.experienceDoNotSyncBrowserSettings = $policy.experienceDoNotSyncBrowserSettings
        $this.messagingBlockSync = $policy.messagingBlockSync
        $this.messagingBlockMMS = $policy.messagingBlockMMS
        $this.messagingBlockRichCommunicationServices = $policy.messagingBlockRichCommunicationServices
        $this.printerNames = $policy.printerNames
        $this.printerDefaultName = $policy.printerDefaultName
        $this.printerBlockAddition = $policy.printerBlockAddition
        $this.searchBlockDiacritics = $policy.searchBlockDiacritics
        $this.searchDisableAutoLanguageDetection = $policy.searchDisableAutoLanguageDetection
        $this.searchDisableIndexingEncryptedItems = $policy.searchDisableIndexingEncryptedItems
        $this.searchEnableRemoteQueries = $policy.searchEnableRemoteQueries
        $this.searchDisableUseLocation = $policy.searchDisableUseLocation
        $this.searchDisableLocation = $policy.searchDisableLocation
        $this.searchDisableIndexerBackoff = $policy.searchDisableIndexerBackoff
        $this.searchDisableIndexingRemovableDrive = $policy.searchDisableIndexingRemovableDrive
        $this.searchEnableAutomaticIndexSizeManangement = $policy.searchEnableAutomaticIndexSizeManangement
        $this.searchBlockWebResults = $policy.searchBlockWebResults
        $this.findMyFiles = $policy.findMyFiles
        $this.securityBlockAzureADJoinedDevicesAutoEncryption = $policy.securityBlockAzureADJoinedDevicesAutoEncryption
        $this.diagnosticsDataSubmissionMode = $policy.diagnosticsDataSubmissionMode
        $this.oneDriveDisableFileSync = $policy.oneDriveDisableFileSync
        $this.systemTelemetryProxyServer = $policy.systemTelemetryProxyServer
        $this.edgeTelemetryForMicrosoft365Analytics = $policy.edgeTelemetryForMicrosoft365Analytics
        $this.inkWorkspaceAccess = $policy.inkWorkspaceAccess
        $this.inkWorkspaceAccessState = $policy.inkWorkspaceAccessState
        $this.inkWorkspaceBlockSuggestedApps = $policy.inkWorkspaceBlockSuggestedApps
        $this.smartScreenEnableAppInstallControl = $policy.smartScreenEnableAppInstallControl
        $this.smartScreenAppInstallControl = $policy.smartScreenAppInstallControl
        $this.personalizationDesktopImageUrl = $policy.personalizationDesktopImageUrl
        $this.personalizationLockScreenImageUrl = $policy.personalizationLockScreenImageUrl
        $this.bluetoothAllowedServices = $policy.bluetoothAllowedServices
        $this.bluetoothBlockAdvertising = $policy.bluetoothBlockAdvertising
        $this.bluetoothBlockPromptedProximalConnections = $policy.bluetoothBlockPromptedProximalConnections
        $this.bluetoothBlockDiscoverableMode = $policy.bluetoothBlockDiscoverableMode
        $this.bluetoothBlockPrePairing = $policy.bluetoothBlockPrePairing
        $this.edgeBlockAutofill = $policy.edgeBlockAutofill
        $this.edgeBlocked = $policy.edgeBlocked
        $this.edgeCookiePolicy = $policy.edgeCookiePolicy
        $this.edgeBlockDeveloperTools = $policy.edgeBlockDeveloperTools
        $this.edgeBlockSendingDoNotTrackHeader = $policy.edgeBlockSendingDoNotTrackHeader
        $this.edgeBlockExtensions = $policy.edgeBlockExtensions
        $this.edgeBlockInPrivateBrowsing = $policy.edgeBlockInPrivateBrowsing
        $this.edgeBlockJavaScript = $policy.edgeBlockJavaScript
        $this.edgeBlockPasswordManager = $policy.edgeBlockPasswordManager
        $this.edgeBlockAddressBarDropdown = $policy.edgeBlockAddressBarDropdown
        $this.edgeBlockCompatibilityList = $policy.edgeBlockCompatibilityList
        $this.edgeClearBrowsingDataOnExit = $policy.edgeClearBrowsingDataOnExit
        $this.edgeAllowStartPagesModification = $policy.edgeAllowStartPagesModification
        $this.edgeDisableFirstRunPage = $policy.edgeDisableFirstRunPage
        $this.edgeBlockLiveTileDataCollection = $policy.edgeBlockLiveTileDataCollection
        $this.edgeSyncFavoritesWithInternetExplorer = $policy.edgeSyncFavoritesWithInternetExplorer
        $this.edgeFavoritesListLocation = $policy.edgeFavoritesListLocation
        $this.edgeBlockEditFavorites = $policy.edgeBlockEditFavorites
        $this.edgeNewTabPageURL = $policy.edgeNewTabPageURL
        $this.edgeHomeButtonConfiguration = $policy.edgeHomeButtonConfiguration
        $this.edgeHomeButtonConfigurationEnabled = $policy.edgeHomeButtonConfigurationEnabled
        $this.edgeOpensWith = $policy.edgeOpensWith
        $this.edgeBlockSideloadingExtensions = $policy.edgeBlockSideloadingExtensions
        $this.edgeRequiredExtensionPackageFamilyNames = $policy.edgeRequiredExtensionPackageFamilyNames
        $this.edgeBlockPrinting = $policy.edgeBlockPrinting
        $this.edgeFavoritesBarVisibility = $policy.edgeFavoritesBarVisibility
        $this.edgeBlockSavingHistory = $policy.edgeBlockSavingHistory
        $this.edgeBlockFullScreenMode = $policy.edgeBlockFullScreenMode
        $this.edgeBlockWebContentOnNewTabPage = $policy.edgeBlockWebContentOnNewTabPage
        $this.edgeBlockTabPreloading = $policy.edgeBlockTabPreloading
        $this.edgeBlockPrelaunch = $policy.edgeBlockPrelaunch
        $this.edgeShowMessageWhenOpeningInternetExplorerSites = $policy.edgeShowMessageWhenOpeningInternetExplorerSites
        $this.edgePreventCertificateErrorOverride = $policy.edgePreventCertificateErrorOverride
        $this.edgeKioskModeRestriction = $policy.edgeKioskModeRestriction
        $this.edgeKioskResetAfterIdleTimeInMinutes = $policy.edgeKioskResetAfterIdleTimeInMinutes
        $this.cellularBlockDataWhenRoaming = $policy.cellularBlockDataWhenRoaming
        $this.cellularBlockVpn = $policy.cellularBlockVpn
        $this.cellularBlockVpnWhenRoaming = $policy.cellularBlockVpnWhenRoaming
        $this.cellularData = $policy.cellularData
        $this.defenderRequireRealTimeMonitoring = $policy.defenderRequireRealTimeMonitoring
        $this.defenderRequireBehaviorMonitoring = $policy.defenderRequireBehaviorMonitoring
        $this.defenderRequireNetworkInspectionSystem = $policy.defenderRequireNetworkInspectionSystem
        $this.defenderScanDownloads = $policy.defenderScanDownloads
        $this.defenderScheduleScanEnableLowCpuPriority = $policy.defenderScheduleScanEnableLowCpuPriority
        $this.defenderDisableCatchupQuickScan = $policy.defenderDisableCatchupQuickScan
        $this.defenderDisableCatchupFullScan = $policy.defenderDisableCatchupFullScan
        $this.defenderScanScriptsLoadedInInternetExplorer = $policy.defenderScanScriptsLoadedInInternetExplorer
        $this.defenderBlockEndUserAccess = $policy.defenderBlockEndUserAccess
        $this.defenderSignatureUpdateIntervalInHours = $policy.defenderSignatureUpdateIntervalInHours
        $this.defenderMonitorFileActivity = $policy.defenderMonitorFileActivity
        $this.defenderDaysBeforeDeletingQuarantinedMalware = $policy.defenderDaysBeforeDeletingQuarantinedMalware
        $this.defenderScanMaxCpu = $policy.defenderScanMaxCpu
        $this.defenderScanArchiveFiles = $policy.defenderScanArchiveFiles
        $this.defenderScanIncomingMail = $policy.defenderScanIncomingMail
        $this.defenderScanRemovableDrivesDuringFullScan = $policy.defenderScanRemovableDrivesDuringFullScan
        $this.defenderScanMappedNetworkDrivesDuringFullScan = $policy.defenderScanMappedNetworkDrivesDuringFullScan
        $this.defenderScanNetworkFiles = $policy.defenderScanNetworkFiles
        $this.defenderRequireCloudProtection = $policy.defenderRequireCloudProtection
        $this.defenderCloudBlockLevel = $policy.defenderCloudBlockLevel
        $this.defenderCloudExtendedTimeout = $policy.defenderCloudExtendedTimeout
        $this.defenderCloudExtendedTimeoutInSeconds = $policy.defenderCloudExtendedTimeoutInSeconds
        $this.defenderPromptForSampleSubmission = $policy.defenderPromptForSampleSubmission
        $this.defenderScheduledQuickScanTime = $policy.defenderScheduledQuickScanTime
        $this.defenderScanType = $policy.defenderScanType
        $this.defenderSystemScanSchedule = $policy.defenderSystemScanSchedule
        $this.defenderScheduledScanTime = $policy.defenderScheduledScanTime
        $this.defenderPotentiallyUnwantedAppAction = $policy.defenderPotentiallyUnwantedAppAction
        $this.defenderPotentiallyUnwantedAppActionSetting = $policy.defenderPotentiallyUnwantedAppActionSetting
        $this.defenderSubmitSamplesConsentType = $policy.defenderSubmitSamplesConsentType
        $this.defenderBlockOnAccessProtection = $policy.defenderBlockOnAccessProtection
        $this.defenderDetectedMalwareActions = $policy.defenderDetectedMalwareActions
        $this.defenderFileExtensionsToExclude = $policy.defenderFileExtensionsToExclude
        $this.defenderFilesAndFoldersToExclude = $policy.defenderFilesAndFoldersToExclude
        $this.defenderProcessesToExclude = $policy.defenderProcessesToExclude
        $this.lockScreenAllowTimeoutConfiguration = $policy.lockScreenAllowTimeoutConfiguration
        $this.lockScreenBlockActionCenterNotifications = $policy.lockScreenBlockActionCenterNotifications
        $this.lockScreenBlockCortana = $policy.lockScreenBlockCortana
        $this.lockScreenBlockToastNotifications = $policy.lockScreenBlockToastNotifications
        $this.lockScreenTimeoutInSeconds = $policy.lockScreenTimeoutInSeconds
        $this.lockScreenActivateAppsWithVoice = $policy.lockScreenActivateAppsWithVoice
        $this.passwordBlockSimple = $policy.passwordBlockSimple
        $this.passwordExpirationDays = $policy.passwordExpirationDays
        $this.passwordMinimumLength = $policy.passwordMinimumLength
        $this.passwordMinutesOfInactivityBeforeScreenTimeout = $policy.passwordMinutesOfInactivityBeforeScreenTimeout
        $this.passwordMinimumCharacterSetCount = $policy.passwordMinimumCharacterSetCount
        $this.passwordPreviousPasswordBlockCount = $policy.passwordPreviousPasswordBlockCount
        $this.passwordRequired = $policy.passwordRequired
        $this.passwordRequireWhenResumeFromIdleState = $policy.passwordRequireWhenResumeFromIdleState
        $this.passwordRequiredType = $policy.passwordRequiredType
        $this.passwordSignInFailureCountBeforeFactoryReset = $policy.passwordSignInFailureCountBeforeFactoryReset
        $this.passwordMinimumAgeInDays = $policy.passwordMinimumAgeInDays
        $this.privacyAdvertisingId = $policy.privacyAdvertisingId
        $this.privacyAutoAcceptPairingAndConsentPrompts = $policy.privacyAutoAcceptPairingAndConsentPrompts
        $this.privacyDisableLaunchExperience = $policy.privacyDisableLaunchExperience
        $this.privacyBlockInputPersonalization = $policy.privacyBlockInputPersonalization
        $this.privacyBlockPublishUserActivities = $policy.privacyBlockPublishUserActivities
        $this.privacyBlockActivityFeed = $policy.privacyBlockActivityFeed
        $this.activateAppsWithVoice = $policy.activateAppsWithVoice
        $this.startBlockUnpinningAppsFromTaskbar = $policy.startBlockUnpinningAppsFromTaskbar
        $this.startMenuAppListVisibility = $policy.startMenuAppListVisibility
        $this.startMenuHideChangeAccountSettings = $policy.startMenuHideChangeAccountSettings
        $this.startMenuHideFrequentlyUsedApps = $policy.startMenuHideFrequentlyUsedApps
        $this.startMenuHideHibernate = $policy.startMenuHideHibernate
        $this.startMenuHideLock = $policy.startMenuHideLock
        $this.startMenuHidePowerButton = $policy.startMenuHidePowerButton
        $this.startMenuHideRecentJumpLists = $policy.startMenuHideRecentJumpLists
        $this.startMenuHideRecentlyAddedApps = $policy.startMenuHideRecentlyAddedApps
        $this.startMenuHideRestartOptions = $policy.startMenuHideRestartOptions
        $this.startMenuHideShutDown = $policy.startMenuHideShutDown
        $this.startMenuHideSignOut = $policy.startMenuHideSignOut
        $this.startMenuHideSleep = $policy.startMenuHideSleep
        $this.startMenuHideSwitchAccount = $policy.startMenuHideSwitchAccount
        $this.startMenuHideUserTile = $policy.startMenuHideUserTile
        $this.startMenuLayoutEdgeAssetsXml = $policy.startMenuLayoutEdgeAssetsXml
        $this.startMenuLayoutXml = $policy.startMenuLayoutXml
        $this.startMenuMode = $policy.startMenuMode
        $this.startMenuPinnedFolderDocuments = $policy.startMenuPinnedFolderDocuments
        $this.startMenuPinnedFolderDownloads = $policy.startMenuPinnedFolderDownloads
        $this.startMenuPinnedFolderFileExplorer = $policy.startMenuPinnedFolderFileExplorer
        $this.startMenuPinnedFolderHomeGroup = $policy.startMenuPinnedFolderHomeGroup
        $this.startMenuPinnedFolderMusic = $policy.startMenuPinnedFolderMusic
        $this.startMenuPinnedFolderNetwork = $policy.startMenuPinnedFolderNetwork
        $this.startMenuPinnedFolderPersonalFolder = $policy.startMenuPinnedFolderPersonalFolder
        $this.startMenuPinnedFolderPictures = $policy.startMenuPinnedFolderPictures
        $this.startMenuPinnedFolderSettings = $policy.startMenuPinnedFolderSettings
        $this.startMenuPinnedFolderVideos = $policy.startMenuPinnedFolderVideos
        $this.settingsBlockSettingsApp = $policy.settingsBlockSettingsApp
        $this.settingsBlockSystemPage = $policy.settingsBlockSystemPage
        $this.settingsBlockDevicesPage = $policy.settingsBlockDevicesPage
        $this.settingsBlockNetworkInternetPage = $policy.settingsBlockNetworkInternetPage
        $this.settingsBlockPersonalizationPage = $policy.settingsBlockPersonalizationPage
        $this.settingsBlockAccountsPage = $policy.settingsBlockAccountsPage
        $this.settingsBlockTimeLanguagePage = $policy.settingsBlockTimeLanguagePage
        $this.settingsBlockEaseOfAccessPage = $policy.settingsBlockEaseOfAccessPage
        $this.settingsBlockPrivacyPage = $policy.settingsBlockPrivacyPage
        $this.settingsBlockUpdateSecurityPage = $policy.settingsBlockUpdateSecurityPage
        $this.settingsBlockAppsPage = $policy.settingsBlockAppsPage
        $this.settingsBlockGamingPage = $policy.settingsBlockGamingPage
        $this.windowsSpotlightBlockConsumerSpecificFeatures = $policy.windowsSpotlightBlockConsumerSpecificFeatures
        $this.windowsSpotlightBlocked = $policy.windowsSpotlightBlocked
        $this.windowsSpotlightBlockOnActionCenter = $policy.windowsSpotlightBlockOnActionCenter
        $this.windowsSpotlightBlockTailoredExperiences = $policy.windowsSpotlightBlockTailoredExperiences
        $this.windowsSpotlightBlockThirdPartyNotifications = $policy.windowsSpotlightBlockThirdPartyNotifications
        $this.windowsSpotlightBlockWelcomeExperience = $policy.windowsSpotlightBlockWelcomeExperience
        $this.windowsSpotlightBlockWindowsTips = $policy.windowsSpotlightBlockWindowsTips
        $this.windowsSpotlightConfigureOnLockScreen = $policy.windowsSpotlightConfigureOnLockScreen
        $this.networkProxyApplySettingsDeviceWide = $policy.networkProxyApplySettingsDeviceWide
        $this.networkProxyDisableAutoDetect = $policy.networkProxyDisableAutoDetect
        $this.networkProxyAutomaticConfigurationUrl = $policy.networkProxyAutomaticConfigurationUrl
        $this.networkProxyServer = $policy.networkProxyServer
        $this.accountsBlockAddingNonMicrosoftAccountEmail = $policy.accountsBlockAddingNonMicrosoftAccountEmail
        $this.antiTheftModeBlocked = $policy.antiTheftModeBlocked
        $this.bluetoothBlocked = $policy.bluetoothBlocked
        $this.cameraBlocked = $policy.cameraBlocked
        $this.connectedDevicesServiceBlocked = $policy.connectedDevicesServiceBlocked
        $this.certificatesBlockManualRootCertificateInstallation = $policy.certificatesBlockManualRootCertificateInstallation
        $this.copyPasteBlocked = $policy.copyPasteBlocked
        $this.cortanaBlocked = $policy.cortanaBlocked
        $this.deviceManagementBlockFactoryResetOnMobile = $policy.deviceManagementBlockFactoryResetOnMobile
        $this.deviceManagementBlockManualUnenroll = $policy.deviceManagementBlockManualUnenroll
        $this.safeSearchFilter = $policy.safeSearchFilter
        $this.edgeBlockPopups = $policy.edgeBlockPopups
        $this.edgeBlockSearchSuggestions = $policy.edgeBlockSearchSuggestions
        $this.edgeBlockSearchEngineCustomization = $policy.edgeBlockSearchEngineCustomization
        $this.edgeBlockSendingIntranetTrafficToInternetExplorer = $policy.edgeBlockSendingIntranetTrafficToInternetExplorer
        $this.edgeSendIntranetTrafficToInternetExplorer = $policy.edgeSendIntranetTrafficToInternetExplorer
        $this.edgeRequireSmartScreen = $policy.edgeRequireSmartScreen
        $this.edgeEnterpriseModeSiteListLocation = $policy.edgeEnterpriseModeSiteListLocation
        $this.edgeFirstRunUrl = $policy.edgeFirstRunUrl
        $this.edgeSearchEngine = $policy.edgeSearchEngine
        $this.edgeHomepageUrls = $policy.edgeHomepageUrls
        $this.edgeBlockAccessToAboutFlags = $policy.edgeBlockAccessToAboutFlags
        $this.smartScreenBlockPromptOverride = $policy.smartScreenBlockPromptOverride
        $this.smartScreenBlockPromptOverrideForFiles = $policy.smartScreenBlockPromptOverrideForFiles
        $this.webRtcBlockLocalhostIpAddress = $policy.webRtcBlockLocalhostIpAddress
        $this.internetSharingBlocked = $policy.internetSharingBlocked
        $this.settingsBlockAddProvisioningPackage = $policy.settingsBlockAddProvisioningPackage
        $this.settingsBlockRemoveProvisioningPackage = $policy.settingsBlockRemoveProvisioningPackage
        $this.settingsBlockChangeSystemTime = $policy.settingsBlockChangeSystemTime
        $this.settingsBlockEditDeviceName = $policy.settingsBlockEditDeviceName
        $this.settingsBlockChangeRegion = $policy.settingsBlockChangeRegion
        $this.settingsBlockChangeLanguage = $policy.settingsBlockChangeLanguage
        $this.settingsBlockChangePowerSleep = $policy.settingsBlockChangePowerSleep
        $this.locationServicesBlocked = $policy.locationServicesBlocked
        $this.microsoftAccountBlocked = $policy.microsoftAccountBlocked
        $this.microsoftAccountBlockSettingsSync = $policy.microsoftAccountBlockSettingsSync
        $this.nfcBlocked = $policy.nfcBlocked
        $this.resetProtectionModeBlocked = $policy.resetProtectionModeBlocked
        $this.screenCaptureBlocked = $policy.screenCaptureBlocked
        $this.storageBlockRemovableStorage = $policy.storageBlockRemovableStorage
        $this.storageRequireMobileDeviceEncryption = $policy.storageRequireMobileDeviceEncryption
        $this.usbBlocked = $policy.usbBlocked
        $this.voiceRecordingBlocked = $policy.voiceRecordingBlocked
        $this.wiFiBlockAutomaticConnectHotspots = $policy.wiFiBlockAutomaticConnectHotspots
        $this.wiFiBlocked = $policy.wiFiBlocked
        $this.wiFiBlockManualConfiguration = $policy.wiFiBlockManualConfiguration
        $this.wiFiScanInterval = $policy.wiFiScanInterval
        $this.wirelessDisplayBlockProjectionToThisDevice = $policy.wirelessDisplayBlockProjectionToThisDevice
        $this.wirelessDisplayBlockUserInputFromReceiver = $policy.wirelessDisplayBlockUserInputFromReceiver
        $this.wirelessDisplayRequirePinForPairing = $policy.wirelessDisplayRequirePinForPairing
        $this.windowsStoreBlocked = $policy.windowsStoreBlocked
        $this.appsAllowTrustedAppsSideloading = $policy.appsAllowTrustedAppsSideloading
        $this.windowsStoreBlockAutoUpdate = $policy.windowsStoreBlockAutoUpdate
        $this.developerUnlockSetting = $policy.developerUnlockSetting
        $this.sharedUserAppDataAllowed = $policy.sharedUserAppDataAllowed
        $this.appsBlockWindowsStoreOriginatedApps = $policy.appsBlockWindowsStoreOriginatedApps
        $this.windowsStoreEnablePrivateStoreOnly = $policy.windowsStoreEnablePrivateStoreOnly
        $this.storageRestrictAppDataToSystemVolume = $policy.storageRestrictAppDataToSystemVolume
        $this.storageRestrictAppInstallToSystemVolume = $policy.storageRestrictAppInstallToSystemVolume
        $this.gameDvrBlocked = $policy.gameDvrBlocked
        $this.experienceBlockDeviceDiscovery = $policy.experienceBlockDeviceDiscovery
        $this.experienceBlockErrorDialogWhenNoSIM = $policy.experienceBlockErrorDialogWhenNoSIM
        $this.experienceBlockTaskSwitcher = $policy.experienceBlockTaskSwitcher
        $this.logonBlockFastUserSwitching = $policy.logonBlockFastUserSwitching
        $this.tenantLockdownRequireNetworkDuringOutOfBoxExperience = $policy.tenantLockdownRequireNetworkDuringOutOfBoxExperience
        $this.appManagementMSIAllowUserControlOverInstall = $policy.appManagementMSIAllowUserControlOverInstall
        $this.appManagementMSIAlwaysInstallWithElevatedPrivileges = $policy.appManagementMSIAlwaysInstallWithElevatedPrivileges
        $this.dataProtectionBlockDirectMemoryAccess = $policy.dataProtectionBlockDirectMemoryAccess
        $this.appManagementPackageFamilyNamesToLaunchAfterLogOn = $policy.appManagementPackageFamilyNamesToLaunchAfterLogOn
        $this.uninstallBuiltInApps = $policy.uninstallBuiltInApps
        $this.configureTimeZone = $policy.configureTimeZone
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmWindows10GeneralConfiguration"
  }
}
