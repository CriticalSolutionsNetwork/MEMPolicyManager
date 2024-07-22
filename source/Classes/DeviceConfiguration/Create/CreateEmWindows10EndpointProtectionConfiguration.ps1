class CreateEmWindows10EndpointProtectionConfiguration {
  [string]${@odata.type}
    [string]$description
    [string]$displayName
    [object]$version
    [string]$dmaGuardDeviceEnumerationPolicy
    [object[]]$firewallRules
    [psobject]$userRightsAccessCredentialManagerAsTrustedCaller
    [psobject]$userRightsAllowAccessFromNetwork
    [psobject]$userRightsBlockAccessFromNetwork
    [psobject]$userRightsActAsPartOfTheOperatingSystem
    [psobject]$userRightsLocalLogOn
    [psobject]$userRightsDenyLocalLogOn
    [psobject]$userRightsBackupData
    [psobject]$userRightsChangeSystemTime
    [psobject]$userRightsCreateGlobalObjects
    [psobject]$userRightsCreatePageFile
    [psobject]$userRightsCreatePermanentSharedObjects
    [psobject]$userRightsCreateSymbolicLinks
    [psobject]$userRightsCreateToken
    [psobject]$userRightsDebugPrograms
    [psobject]$userRightsRemoteDesktopServicesLogOn
    [psobject]$userRightsDelegation
    [psobject]$userRightsGenerateSecurityAudits
    [psobject]$userRightsImpersonateClient
    [psobject]$userRightsIncreaseSchedulingPriority
    [psobject]$userRightsLoadUnloadDrivers
    [psobject]$userRightsLockMemory
    [psobject]$userRightsManageAuditingAndSecurityLogs
    [psobject]$userRightsManageVolumes
    [psobject]$userRightsModifyFirmwareEnvironment
    [psobject]$userRightsModifyObjectLabels
    [psobject]$userRightsProfileSingleProcess
    [psobject]$userRightsRemoteShutdown
    [psobject]$userRightsRestoreData
    [psobject]$userRightsTakeOwnership
    [bool]$xboxServicesEnableXboxGameSaveTask
    [string]$xboxServicesAccessoryManagementServiceStartupMode
    [string]$xboxServicesLiveAuthManagerServiceStartupMode
    [string]$xboxServicesLiveGameSaveServiceStartupMode
    [string]$xboxServicesLiveNetworkingServiceStartupMode
    [bool]$localSecurityOptionsBlockMicrosoftAccounts
    [bool]$localSecurityOptionsBlockRemoteLogonWithBlankPassword
    [bool]$localSecurityOptionsDisableAdministratorAccount
    [string]$localSecurityOptionsAdministratorAccountName
    [bool]$localSecurityOptionsDisableGuestAccount
    [string]$localSecurityOptionsGuestAccountName
    [bool]$localSecurityOptionsAllowUndockWithoutHavingToLogon
    [bool]$localSecurityOptionsBlockUsersInstallingPrinterDrivers
    [bool]$localSecurityOptionsBlockRemoteOpticalDriveAccess
    [string]$localSecurityOptionsFormatAndEjectOfRemovableMediaAllowedUser
    [object]$localSecurityOptionsMachineInactivityLimit
    [object]$localSecurityOptionsMachineInactivityLimitInMinutes
    [bool]$localSecurityOptionsDoNotRequireCtrlAltDel
    [bool]$localSecurityOptionsHideLastSignedInUser
    [bool]$localSecurityOptionsHideUsernameAtSignIn
    [string]$localSecurityOptionsLogOnMessageTitle
    [string]$localSecurityOptionsLogOnMessageText
    [bool]$localSecurityOptionsAllowPKU2UAuthenticationRequests
    [bool]$localSecurityOptionsAllowRemoteCallsToSecurityAccountsManagerHelperBool
    [string]$localSecurityOptionsAllowRemoteCallsToSecurityAccountsManager
    [string]$localSecurityOptionsMinimumSessionSecurityForNtlmSspBasedClients
    [string]$localSecurityOptionsMinimumSessionSecurityForNtlmSspBasedServers
    [string]$lanManagerAuthenticationLevel
    [bool]$lanManagerWorkstationDisableInsecureGuestLogons
    [bool]$localSecurityOptionsClearVirtualMemoryPageFile
    [bool]$localSecurityOptionsAllowSystemToBeShutDownWithoutHavingToLogOn
    [bool]$localSecurityOptionsAllowUIAccessApplicationElevation
    [bool]$localSecurityOptionsVirtualizeFileAndRegistryWriteFailuresToPerUserLocations
    [bool]$localSecurityOptionsOnlyElevateSignedExecutables
    [string]$localSecurityOptionsAdministratorElevationPromptBehavior
    [string]$localSecurityOptionsStandardUserElevationPromptBehavior
    [bool]$localSecurityOptionsSwitchToSecureDesktopWhenPromptingForElevation
    [bool]$localSecurityOptionsDetectApplicationInstallationsAndPromptForElevation
    [bool]$localSecurityOptionsAllowUIAccessApplicationsForSecureLocations
    [bool]$localSecurityOptionsUseAdminApprovalMode
    [bool]$localSecurityOptionsUseAdminApprovalModeForAdministrators
    [string]$localSecurityOptionsInformationShownOnLockScreen
    [string]$localSecurityOptionsInformationDisplayedOnLockScreen
    [bool]$localSecurityOptionsDisableClientDigitallySignCommunicationsIfServerAgrees
    [bool]$localSecurityOptionsClientDigitallySignCommunicationsAlways
    [bool]$localSecurityOptionsClientSendUnencryptedPasswordToThirdPartySMBServers
    [bool]$localSecurityOptionsDisableServerDigitallySignCommunicationsAlways
    [bool]$localSecurityOptionsDisableServerDigitallySignCommunicationsIfClientAgrees
    [bool]$localSecurityOptionsRestrictAnonymousAccessToNamedPipesAndShares
    [bool]$localSecurityOptionsDoNotAllowAnonymousEnumerationOfSAMAccounts
    [bool]$localSecurityOptionsAllowAnonymousEnumerationOfSAMAccountsAndShares
    [bool]$localSecurityOptionsDoNotStoreLANManagerHashValueOnNextPasswordChange
    [string]$localSecurityOptionsSmartCardRemovalBehavior
    [bool]$defenderSecurityCenterDisableAppBrowserUI
    [bool]$defenderSecurityCenterDisableFamilyUI
    [bool]$defenderSecurityCenterDisableHealthUI
    [bool]$defenderSecurityCenterDisableNetworkUI
    [bool]$defenderSecurityCenterDisableVirusUI
    [bool]$defenderSecurityCenterDisableAccountUI
    [bool]$defenderSecurityCenterDisableClearTpmUI
    [bool]$defenderSecurityCenterDisableHardwareUI
    [bool]$defenderSecurityCenterDisableNotificationAreaUI
    [bool]$defenderSecurityCenterDisableRansomwareUI
    [bool]$defenderSecurityCenterDisableSecureBootUI
    [bool]$defenderSecurityCenterDisableTroubleshootingUI
    [bool]$defenderSecurityCenterDisableVulnerableTpmFirmwareUpdateUI
    [string]$defenderSecurityCenterOrganizationDisplayName
    [string]$defenderSecurityCenterHelpEmail
    [string]$defenderSecurityCenterHelpPhone
    [string]$defenderSecurityCenterHelpURL
    [string]$defenderSecurityCenterNotificationsFromApp
    [string]$defenderSecurityCenterITContactDisplay
    [string]$windowsDefenderTamperProtection
    [bool]$firewallBlockStatefulFTP
    [object]$firewallIdleTimeoutForSecurityAssociationInSeconds
    [string]$firewallPreSharedKeyEncodingMethod
    [bool]$firewallIPSecExemptionsNone
    [bool]$firewallIPSecExemptionsAllowNeighborDiscovery
    [bool]$firewallIPSecExemptionsAllowICMP
    [bool]$firewallIPSecExemptionsAllowRouterDiscovery
    [bool]$firewallIPSecExemptionsAllowDHCP
    [string]$firewallCertificateRevocationListCheckMethod
    [bool]$firewallMergeKeyingModuleSettings
    [string]$firewallPacketQueueingMethod
    [psobject]$firewallProfileDomain
    [psobject]$firewallProfilePublic
    [psobject]$firewallProfilePrivate
    [string]$defenderAdobeReaderLaunchChildProcess
    [object[]]$defenderAttackSurfaceReductionExcludedPaths
    [string]$defenderOfficeAppsOtherProcessInjectionType
    [string]$defenderOfficeAppsOtherProcessInjection
    [string]$defenderOfficeCommunicationAppsLaunchChildProcess
    [string]$defenderOfficeAppsExecutableContentCreationOrLaunchType
    [string]$defenderOfficeAppsExecutableContentCreationOrLaunch
    [string]$defenderOfficeAppsLaunchChildProcessType
    [string]$defenderOfficeAppsLaunchChildProcess
    [string]$defenderOfficeMacroCodeAllowWin32ImportsType
    [string]$defenderOfficeMacroCodeAllowWin32Imports
    [string]$defenderScriptObfuscatedMacroCodeType
    [string]$defenderScriptObfuscatedMacroCode
    [string]$defenderScriptDownloadedPayloadExecutionType
    [string]$defenderScriptDownloadedPayloadExecution
    [string]$defenderPreventCredentialStealingType
    [string]$defenderProcessCreationType
    [string]$defenderProcessCreation
    [string]$defenderUntrustedUSBProcessType
    [string]$defenderUntrustedUSBProcess
    [string]$defenderUntrustedExecutableType
    [string]$defenderUntrustedExecutable
    [string]$defenderEmailContentExecutionType
    [string]$defenderEmailContentExecution
    [string]$defenderAdvancedRansomewareProtectionType
    [string]$defenderGuardMyFoldersType
    [object[]]$defenderGuardedFoldersAllowedAppPaths
    [object[]]$defenderAdditionalGuardedFolders
    [string]$defenderNetworkProtectionType
    [string]$defenderExploitProtectionXml
    [string]$defenderExploitProtectionXmlFileName
    [bool]$defenderSecurityCenterBlockExploitProtectionOverride
    [string]$defenderBlockPersistenceThroughWmiType
    [string]$appLockerApplicationControl
    [string]$deviceGuardLocalSystemAuthorityCredentialGuardSettings
    [bool]$deviceGuardEnableVirtualizationBasedSecurity
    [bool]$deviceGuardEnableSecureBootWithDMA
    [string]$deviceGuardSecureBootWithDMA
    [string]$deviceGuardLaunchSystemGuard
    [bool]$smartScreenEnableInShell
    [bool]$smartScreenBlockOverrideForFiles
    [bool]$applicationGuardEnabled
    [string]$applicationGuardEnabledOptions
    [string]$applicationGuardBlockFileTransfer
    [bool]$applicationGuardBlockNonEnterpriseContent
    [bool]$applicationGuardAllowPersistence
    [bool]$applicationGuardForceAuditing
    [string]$applicationGuardBlockClipboardSharing
    [bool]$applicationGuardAllowPrintToPDF
    [bool]$applicationGuardAllowPrintToXPS
    [bool]$applicationGuardAllowPrintToLocalPrinters
    [bool]$applicationGuardAllowPrintToNetworkPrinters
    [bool]$applicationGuardAllowVirtualGPU
    [bool]$applicationGuardAllowFileSaveOnHost
    [bool]$applicationGuardAllowCameraMicrophoneRedirection
    [object[]]$applicationGuardCertificateThumbprints
    [bool]$bitLockerAllowStandardUserEncryption
    [bool]$bitLockerDisableWarningForOtherDiskEncryption
    [bool]$bitLockerEnableStorageCardEncryptionOnMobile
    [bool]$bitLockerEncryptDevice
    [psobject]$bitLockerSystemDrivePolicy
    [psobject]$bitLockerFixedDrivePolicy
    [psobject]$bitLockerRemovableDrivePolicy
    [string]$bitLockerRecoveryPasswordRotation
    [bool]$defenderDisableScanArchiveFiles
    [bool]$defenderAllowScanArchiveFiles
    [bool]$defenderDisableBehaviorMonitoring
    [bool]$defenderAllowBehaviorMonitoring
    [bool]$defenderDisableCloudProtection
    [bool]$defenderAllowCloudProtection
    [bool]$defenderEnableScanIncomingMail
    [bool]$defenderEnableScanMappedNetworkDrivesDuringFullScan
    [bool]$defenderDisableScanRemovableDrivesDuringFullScan
    [bool]$defenderAllowScanRemovableDrivesDuringFullScan
    [bool]$defenderDisableScanDownloads
    [bool]$defenderAllowScanDownloads
    [bool]$defenderDisableIntrusionPreventionSystem
    [bool]$defenderAllowIntrusionPreventionSystem
    [bool]$defenderDisableOnAccessProtection
    [bool]$defenderAllowOnAccessProtection
    [bool]$defenderDisableRealTimeMonitoring
    [bool]$defenderAllowRealTimeMonitoring
    [bool]$defenderDisableScanNetworkFiles
    [bool]$defenderAllowScanNetworkFiles
    [bool]$defenderDisableScanScriptsLoadedInInternetExplorer
    [bool]$defenderAllowScanScriptsLoadedInInternetExplorer
    [bool]$defenderBlockEndUserAccess
    [bool]$defenderAllowEndUserAccess
    [object]$defenderScanMaxCpuPercentage
    [bool]$defenderCheckForSignaturesBeforeRunningScan
    [string]$defenderCloudBlockLevel
    [object]$defenderCloudExtendedTimeoutInSeconds
    [object]$defenderDaysBeforeDeletingQuarantinedMalware
    [bool]$defenderDisableCatchupFullScan
    [bool]$defenderDisableCatchupQuickScan
    [bool]$defenderEnableLowCpuPriority
    [object[]]$defenderFileExtensionsToExclude
    [object[]]$defenderFilesAndFoldersToExclude
    [object[]]$defenderProcessesToExclude
    [string]$defenderPotentiallyUnwantedAppAction
    [string]$defenderScanDirection
    [string]$defenderScanType
    [string]$defenderScheduledQuickScanTime
    [string]$defenderScheduledScanDay
    [string]$defenderScheduledScanTime
    [object]$defenderSignatureUpdateIntervalInHours
    [string]$defenderSubmitSamplesConsentType
    [psobject]$defenderDetectedMalwareActions

  # Default constructor
  CreateEmWindows10EndpointProtectionConfiguration() {
      $this."@odata.type" = ''
        $this.description = ''
        $this.displayName = ''
        $this.version = $null
        $this.dmaGuardDeviceEnumerationPolicy = ''
        $this.firewallRules = @()
        $this.userRightsAccessCredentialManagerAsTrustedCaller = $null
        $this.userRightsAllowAccessFromNetwork = $null
        $this.userRightsBlockAccessFromNetwork = $null
        $this.userRightsActAsPartOfTheOperatingSystem = $null
        $this.userRightsLocalLogOn = $null
        $this.userRightsDenyLocalLogOn = $null
        $this.userRightsBackupData = $null
        $this.userRightsChangeSystemTime = $null
        $this.userRightsCreateGlobalObjects = $null
        $this.userRightsCreatePageFile = $null
        $this.userRightsCreatePermanentSharedObjects = $null
        $this.userRightsCreateSymbolicLinks = $null
        $this.userRightsCreateToken = $null
        $this.userRightsDebugPrograms = $null
        $this.userRightsRemoteDesktopServicesLogOn = $null
        $this.userRightsDelegation = $null
        $this.userRightsGenerateSecurityAudits = $null
        $this.userRightsImpersonateClient = $null
        $this.userRightsIncreaseSchedulingPriority = $null
        $this.userRightsLoadUnloadDrivers = $null
        $this.userRightsLockMemory = $null
        $this.userRightsManageAuditingAndSecurityLogs = $null
        $this.userRightsManageVolumes = $null
        $this.userRightsModifyFirmwareEnvironment = $null
        $this.userRightsModifyObjectLabels = $null
        $this.userRightsProfileSingleProcess = $null
        $this.userRightsRemoteShutdown = $null
        $this.userRightsRestoreData = $null
        $this.userRightsTakeOwnership = $null
        $this.xboxServicesEnableXboxGameSaveTask = $false
        $this.xboxServicesAccessoryManagementServiceStartupMode = ''
        $this.xboxServicesLiveAuthManagerServiceStartupMode = ''
        $this.xboxServicesLiveGameSaveServiceStartupMode = ''
        $this.xboxServicesLiveNetworkingServiceStartupMode = ''
        $this.localSecurityOptionsBlockMicrosoftAccounts = $false
        $this.localSecurityOptionsBlockRemoteLogonWithBlankPassword = $false
        $this.localSecurityOptionsDisableAdministratorAccount = $false
        $this.localSecurityOptionsAdministratorAccountName = ''
        $this.localSecurityOptionsDisableGuestAccount = $false
        $this.localSecurityOptionsGuestAccountName = ''
        $this.localSecurityOptionsAllowUndockWithoutHavingToLogon = $false
        $this.localSecurityOptionsBlockUsersInstallingPrinterDrivers = $false
        $this.localSecurityOptionsBlockRemoteOpticalDriveAccess = $false
        $this.localSecurityOptionsFormatAndEjectOfRemovableMediaAllowedUser = ''
        $this.localSecurityOptionsMachineInactivityLimit = $null
        $this.localSecurityOptionsMachineInactivityLimitInMinutes = $null
        $this.localSecurityOptionsDoNotRequireCtrlAltDel = $false
        $this.localSecurityOptionsHideLastSignedInUser = $false
        $this.localSecurityOptionsHideUsernameAtSignIn = $false
        $this.localSecurityOptionsLogOnMessageTitle = ''
        $this.localSecurityOptionsLogOnMessageText = ''
        $this.localSecurityOptionsAllowPKU2UAuthenticationRequests = $false
        $this.localSecurityOptionsAllowRemoteCallsToSecurityAccountsManagerHelperBool = $false
        $this.localSecurityOptionsAllowRemoteCallsToSecurityAccountsManager = ''
        $this.localSecurityOptionsMinimumSessionSecurityForNtlmSspBasedClients = ''
        $this.localSecurityOptionsMinimumSessionSecurityForNtlmSspBasedServers = ''
        $this.lanManagerAuthenticationLevel = ''
        $this.lanManagerWorkstationDisableInsecureGuestLogons = $false
        $this.localSecurityOptionsClearVirtualMemoryPageFile = $false
        $this.localSecurityOptionsAllowSystemToBeShutDownWithoutHavingToLogOn = $false
        $this.localSecurityOptionsAllowUIAccessApplicationElevation = $false
        $this.localSecurityOptionsVirtualizeFileAndRegistryWriteFailuresToPerUserLocations = $false
        $this.localSecurityOptionsOnlyElevateSignedExecutables = $false
        $this.localSecurityOptionsAdministratorElevationPromptBehavior = ''
        $this.localSecurityOptionsStandardUserElevationPromptBehavior = ''
        $this.localSecurityOptionsSwitchToSecureDesktopWhenPromptingForElevation = $false
        $this.localSecurityOptionsDetectApplicationInstallationsAndPromptForElevation = $false
        $this.localSecurityOptionsAllowUIAccessApplicationsForSecureLocations = $false
        $this.localSecurityOptionsUseAdminApprovalMode = $false
        $this.localSecurityOptionsUseAdminApprovalModeForAdministrators = $false
        $this.localSecurityOptionsInformationShownOnLockScreen = ''
        $this.localSecurityOptionsInformationDisplayedOnLockScreen = ''
        $this.localSecurityOptionsDisableClientDigitallySignCommunicationsIfServerAgrees = $false
        $this.localSecurityOptionsClientDigitallySignCommunicationsAlways = $false
        $this.localSecurityOptionsClientSendUnencryptedPasswordToThirdPartySMBServers = $false
        $this.localSecurityOptionsDisableServerDigitallySignCommunicationsAlways = $false
        $this.localSecurityOptionsDisableServerDigitallySignCommunicationsIfClientAgrees = $false
        $this.localSecurityOptionsRestrictAnonymousAccessToNamedPipesAndShares = $false
        $this.localSecurityOptionsDoNotAllowAnonymousEnumerationOfSAMAccounts = $false
        $this.localSecurityOptionsAllowAnonymousEnumerationOfSAMAccountsAndShares = $false
        $this.localSecurityOptionsDoNotStoreLANManagerHashValueOnNextPasswordChange = $false
        $this.localSecurityOptionsSmartCardRemovalBehavior = ''
        $this.defenderSecurityCenterDisableAppBrowserUI = $false
        $this.defenderSecurityCenterDisableFamilyUI = $false
        $this.defenderSecurityCenterDisableHealthUI = $false
        $this.defenderSecurityCenterDisableNetworkUI = $false
        $this.defenderSecurityCenterDisableVirusUI = $false
        $this.defenderSecurityCenterDisableAccountUI = $false
        $this.defenderSecurityCenterDisableClearTpmUI = $false
        $this.defenderSecurityCenterDisableHardwareUI = $false
        $this.defenderSecurityCenterDisableNotificationAreaUI = $false
        $this.defenderSecurityCenterDisableRansomwareUI = $false
        $this.defenderSecurityCenterDisableSecureBootUI = $false
        $this.defenderSecurityCenterDisableTroubleshootingUI = $false
        $this.defenderSecurityCenterDisableVulnerableTpmFirmwareUpdateUI = $false
        $this.defenderSecurityCenterOrganizationDisplayName = ''
        $this.defenderSecurityCenterHelpEmail = ''
        $this.defenderSecurityCenterHelpPhone = ''
        $this.defenderSecurityCenterHelpURL = ''
        $this.defenderSecurityCenterNotificationsFromApp = ''
        $this.defenderSecurityCenterITContactDisplay = ''
        $this.windowsDefenderTamperProtection = ''
        $this.firewallBlockStatefulFTP = $false
        $this.firewallIdleTimeoutForSecurityAssociationInSeconds = $null
        $this.firewallPreSharedKeyEncodingMethod = ''
        $this.firewallIPSecExemptionsNone = $false
        $this.firewallIPSecExemptionsAllowNeighborDiscovery = $false
        $this.firewallIPSecExemptionsAllowICMP = $false
        $this.firewallIPSecExemptionsAllowRouterDiscovery = $false
        $this.firewallIPSecExemptionsAllowDHCP = $false
        $this.firewallCertificateRevocationListCheckMethod = ''
        $this.firewallMergeKeyingModuleSettings = $false
        $this.firewallPacketQueueingMethod = ''
        $this.firewallProfileDomain = $null
        $this.firewallProfilePublic = $null
        $this.firewallProfilePrivate = $null
        $this.defenderAdobeReaderLaunchChildProcess = ''
        $this.defenderAttackSurfaceReductionExcludedPaths = @()
        $this.defenderOfficeAppsOtherProcessInjectionType = ''
        $this.defenderOfficeAppsOtherProcessInjection = ''
        $this.defenderOfficeCommunicationAppsLaunchChildProcess = ''
        $this.defenderOfficeAppsExecutableContentCreationOrLaunchType = ''
        $this.defenderOfficeAppsExecutableContentCreationOrLaunch = ''
        $this.defenderOfficeAppsLaunchChildProcessType = ''
        $this.defenderOfficeAppsLaunchChildProcess = ''
        $this.defenderOfficeMacroCodeAllowWin32ImportsType = ''
        $this.defenderOfficeMacroCodeAllowWin32Imports = ''
        $this.defenderScriptObfuscatedMacroCodeType = ''
        $this.defenderScriptObfuscatedMacroCode = ''
        $this.defenderScriptDownloadedPayloadExecutionType = ''
        $this.defenderScriptDownloadedPayloadExecution = ''
        $this.defenderPreventCredentialStealingType = ''
        $this.defenderProcessCreationType = ''
        $this.defenderProcessCreation = ''
        $this.defenderUntrustedUSBProcessType = ''
        $this.defenderUntrustedUSBProcess = ''
        $this.defenderUntrustedExecutableType = ''
        $this.defenderUntrustedExecutable = ''
        $this.defenderEmailContentExecutionType = ''
        $this.defenderEmailContentExecution = ''
        $this.defenderAdvancedRansomewareProtectionType = ''
        $this.defenderGuardMyFoldersType = ''
        $this.defenderGuardedFoldersAllowedAppPaths = @()
        $this.defenderAdditionalGuardedFolders = @()
        $this.defenderNetworkProtectionType = ''
        $this.defenderExploitProtectionXml = ''
        $this.defenderExploitProtectionXmlFileName = ''
        $this.defenderSecurityCenterBlockExploitProtectionOverride = $false
        $this.defenderBlockPersistenceThroughWmiType = ''
        $this.appLockerApplicationControl = ''
        $this.deviceGuardLocalSystemAuthorityCredentialGuardSettings = ''
        $this.deviceGuardEnableVirtualizationBasedSecurity = $false
        $this.deviceGuardEnableSecureBootWithDMA = $false
        $this.deviceGuardSecureBootWithDMA = ''
        $this.deviceGuardLaunchSystemGuard = ''
        $this.smartScreenEnableInShell = $false
        $this.smartScreenBlockOverrideForFiles = $false
        $this.applicationGuardEnabled = $false
        $this.applicationGuardEnabledOptions = ''
        $this.applicationGuardBlockFileTransfer = ''
        $this.applicationGuardBlockNonEnterpriseContent = $false
        $this.applicationGuardAllowPersistence = $false
        $this.applicationGuardForceAuditing = $false
        $this.applicationGuardBlockClipboardSharing = ''
        $this.applicationGuardAllowPrintToPDF = $false
        $this.applicationGuardAllowPrintToXPS = $false
        $this.applicationGuardAllowPrintToLocalPrinters = $false
        $this.applicationGuardAllowPrintToNetworkPrinters = $false
        $this.applicationGuardAllowVirtualGPU = $false
        $this.applicationGuardAllowFileSaveOnHost = $false
        $this.applicationGuardAllowCameraMicrophoneRedirection = $false
        $this.applicationGuardCertificateThumbprints = @()
        $this.bitLockerAllowStandardUserEncryption = $false
        $this.bitLockerDisableWarningForOtherDiskEncryption = $false
        $this.bitLockerEnableStorageCardEncryptionOnMobile = $false
        $this.bitLockerEncryptDevice = $false
        $this.bitLockerSystemDrivePolicy = $null
        $this.bitLockerFixedDrivePolicy = $null
        $this.bitLockerRemovableDrivePolicy = $null
        $this.bitLockerRecoveryPasswordRotation = ''
        $this.defenderDisableScanArchiveFiles = $false
        $this.defenderAllowScanArchiveFiles = $false
        $this.defenderDisableBehaviorMonitoring = $false
        $this.defenderAllowBehaviorMonitoring = $false
        $this.defenderDisableCloudProtection = $false
        $this.defenderAllowCloudProtection = $false
        $this.defenderEnableScanIncomingMail = $false
        $this.defenderEnableScanMappedNetworkDrivesDuringFullScan = $false
        $this.defenderDisableScanRemovableDrivesDuringFullScan = $false
        $this.defenderAllowScanRemovableDrivesDuringFullScan = $false
        $this.defenderDisableScanDownloads = $false
        $this.defenderAllowScanDownloads = $false
        $this.defenderDisableIntrusionPreventionSystem = $false
        $this.defenderAllowIntrusionPreventionSystem = $false
        $this.defenderDisableOnAccessProtection = $false
        $this.defenderAllowOnAccessProtection = $false
        $this.defenderDisableRealTimeMonitoring = $false
        $this.defenderAllowRealTimeMonitoring = $false
        $this.defenderDisableScanNetworkFiles = $false
        $this.defenderAllowScanNetworkFiles = $false
        $this.defenderDisableScanScriptsLoadedInInternetExplorer = $false
        $this.defenderAllowScanScriptsLoadedInInternetExplorer = $false
        $this.defenderBlockEndUserAccess = $false
        $this.defenderAllowEndUserAccess = $false
        $this.defenderScanMaxCpuPercentage = $null
        $this.defenderCheckForSignaturesBeforeRunningScan = $false
        $this.defenderCloudBlockLevel = ''
        $this.defenderCloudExtendedTimeoutInSeconds = $null
        $this.defenderDaysBeforeDeletingQuarantinedMalware = $null
        $this.defenderDisableCatchupFullScan = $false
        $this.defenderDisableCatchupQuickScan = $false
        $this.defenderEnableLowCpuPriority = $false
        $this.defenderFileExtensionsToExclude = @()
        $this.defenderFilesAndFoldersToExclude = @()
        $this.defenderProcessesToExclude = @()
        $this.defenderPotentiallyUnwantedAppAction = ''
        $this.defenderScanDirection = ''
        $this.defenderScanType = ''
        $this.defenderScheduledQuickScanTime = ''
        $this.defenderScheduledScanDay = ''
        $this.defenderScheduledScanTime = ''
        $this.defenderSignatureUpdateIntervalInHours = $null
        $this.defenderSubmitSamplesConsentType = ''
        $this.defenderDetectedMalwareActions = $null
  }

  # Parameterized constructor
  CreateEmWindows10EndpointProtectionConfiguration ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.description = $policy.description
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.dmaGuardDeviceEnumerationPolicy = $policy.dmaGuardDeviceEnumerationPolicy
        $this.firewallRules = $policy.firewallRules
        $this.userRightsAccessCredentialManagerAsTrustedCaller = $policy.userRightsAccessCredentialManagerAsTrustedCaller
        $this.userRightsAllowAccessFromNetwork = $policy.userRightsAllowAccessFromNetwork
        $this.userRightsBlockAccessFromNetwork = $policy.userRightsBlockAccessFromNetwork
        $this.userRightsActAsPartOfTheOperatingSystem = $policy.userRightsActAsPartOfTheOperatingSystem
        $this.userRightsLocalLogOn = $policy.userRightsLocalLogOn
        $this.userRightsDenyLocalLogOn = $policy.userRightsDenyLocalLogOn
        $this.userRightsBackupData = $policy.userRightsBackupData
        $this.userRightsChangeSystemTime = $policy.userRightsChangeSystemTime
        $this.userRightsCreateGlobalObjects = $policy.userRightsCreateGlobalObjects
        $this.userRightsCreatePageFile = $policy.userRightsCreatePageFile
        $this.userRightsCreatePermanentSharedObjects = $policy.userRightsCreatePermanentSharedObjects
        $this.userRightsCreateSymbolicLinks = $policy.userRightsCreateSymbolicLinks
        $this.userRightsCreateToken = $policy.userRightsCreateToken
        $this.userRightsDebugPrograms = $policy.userRightsDebugPrograms
        $this.userRightsRemoteDesktopServicesLogOn = $policy.userRightsRemoteDesktopServicesLogOn
        $this.userRightsDelegation = $policy.userRightsDelegation
        $this.userRightsGenerateSecurityAudits = $policy.userRightsGenerateSecurityAudits
        $this.userRightsImpersonateClient = $policy.userRightsImpersonateClient
        $this.userRightsIncreaseSchedulingPriority = $policy.userRightsIncreaseSchedulingPriority
        $this.userRightsLoadUnloadDrivers = $policy.userRightsLoadUnloadDrivers
        $this.userRightsLockMemory = $policy.userRightsLockMemory
        $this.userRightsManageAuditingAndSecurityLogs = $policy.userRightsManageAuditingAndSecurityLogs
        $this.userRightsManageVolumes = $policy.userRightsManageVolumes
        $this.userRightsModifyFirmwareEnvironment = $policy.userRightsModifyFirmwareEnvironment
        $this.userRightsModifyObjectLabels = $policy.userRightsModifyObjectLabels
        $this.userRightsProfileSingleProcess = $policy.userRightsProfileSingleProcess
        $this.userRightsRemoteShutdown = $policy.userRightsRemoteShutdown
        $this.userRightsRestoreData = $policy.userRightsRestoreData
        $this.userRightsTakeOwnership = $policy.userRightsTakeOwnership
        $this.xboxServicesEnableXboxGameSaveTask = $policy.xboxServicesEnableXboxGameSaveTask
        $this.xboxServicesAccessoryManagementServiceStartupMode = $policy.xboxServicesAccessoryManagementServiceStartupMode
        $this.xboxServicesLiveAuthManagerServiceStartupMode = $policy.xboxServicesLiveAuthManagerServiceStartupMode
        $this.xboxServicesLiveGameSaveServiceStartupMode = $policy.xboxServicesLiveGameSaveServiceStartupMode
        $this.xboxServicesLiveNetworkingServiceStartupMode = $policy.xboxServicesLiveNetworkingServiceStartupMode
        $this.localSecurityOptionsBlockMicrosoftAccounts = $policy.localSecurityOptionsBlockMicrosoftAccounts
        $this.localSecurityOptionsBlockRemoteLogonWithBlankPassword = $policy.localSecurityOptionsBlockRemoteLogonWithBlankPassword
        $this.localSecurityOptionsDisableAdministratorAccount = $policy.localSecurityOptionsDisableAdministratorAccount
        $this.localSecurityOptionsAdministratorAccountName = $policy.localSecurityOptionsAdministratorAccountName
        $this.localSecurityOptionsDisableGuestAccount = $policy.localSecurityOptionsDisableGuestAccount
        $this.localSecurityOptionsGuestAccountName = $policy.localSecurityOptionsGuestAccountName
        $this.localSecurityOptionsAllowUndockWithoutHavingToLogon = $policy.localSecurityOptionsAllowUndockWithoutHavingToLogon
        $this.localSecurityOptionsBlockUsersInstallingPrinterDrivers = $policy.localSecurityOptionsBlockUsersInstallingPrinterDrivers
        $this.localSecurityOptionsBlockRemoteOpticalDriveAccess = $policy.localSecurityOptionsBlockRemoteOpticalDriveAccess
        $this.localSecurityOptionsFormatAndEjectOfRemovableMediaAllowedUser = $policy.localSecurityOptionsFormatAndEjectOfRemovableMediaAllowedUser
        $this.localSecurityOptionsMachineInactivityLimit = $policy.localSecurityOptionsMachineInactivityLimit
        $this.localSecurityOptionsMachineInactivityLimitInMinutes = $policy.localSecurityOptionsMachineInactivityLimitInMinutes
        $this.localSecurityOptionsDoNotRequireCtrlAltDel = $policy.localSecurityOptionsDoNotRequireCtrlAltDel
        $this.localSecurityOptionsHideLastSignedInUser = $policy.localSecurityOptionsHideLastSignedInUser
        $this.localSecurityOptionsHideUsernameAtSignIn = $policy.localSecurityOptionsHideUsernameAtSignIn
        $this.localSecurityOptionsLogOnMessageTitle = $policy.localSecurityOptionsLogOnMessageTitle
        $this.localSecurityOptionsLogOnMessageText = $policy.localSecurityOptionsLogOnMessageText
        $this.localSecurityOptionsAllowPKU2UAuthenticationRequests = $policy.localSecurityOptionsAllowPKU2UAuthenticationRequests
        $this.localSecurityOptionsAllowRemoteCallsToSecurityAccountsManagerHelperBool = $policy.localSecurityOptionsAllowRemoteCallsToSecurityAccountsManagerHelperBool
        $this.localSecurityOptionsAllowRemoteCallsToSecurityAccountsManager = $policy.localSecurityOptionsAllowRemoteCallsToSecurityAccountsManager
        $this.localSecurityOptionsMinimumSessionSecurityForNtlmSspBasedClients = $policy.localSecurityOptionsMinimumSessionSecurityForNtlmSspBasedClients
        $this.localSecurityOptionsMinimumSessionSecurityForNtlmSspBasedServers = $policy.localSecurityOptionsMinimumSessionSecurityForNtlmSspBasedServers
        $this.lanManagerAuthenticationLevel = $policy.lanManagerAuthenticationLevel
        $this.lanManagerWorkstationDisableInsecureGuestLogons = $policy.lanManagerWorkstationDisableInsecureGuestLogons
        $this.localSecurityOptionsClearVirtualMemoryPageFile = $policy.localSecurityOptionsClearVirtualMemoryPageFile
        $this.localSecurityOptionsAllowSystemToBeShutDownWithoutHavingToLogOn = $policy.localSecurityOptionsAllowSystemToBeShutDownWithoutHavingToLogOn
        $this.localSecurityOptionsAllowUIAccessApplicationElevation = $policy.localSecurityOptionsAllowUIAccessApplicationElevation
        $this.localSecurityOptionsVirtualizeFileAndRegistryWriteFailuresToPerUserLocations = $policy.localSecurityOptionsVirtualizeFileAndRegistryWriteFailuresToPerUserLocations
        $this.localSecurityOptionsOnlyElevateSignedExecutables = $policy.localSecurityOptionsOnlyElevateSignedExecutables
        $this.localSecurityOptionsAdministratorElevationPromptBehavior = $policy.localSecurityOptionsAdministratorElevationPromptBehavior
        $this.localSecurityOptionsStandardUserElevationPromptBehavior = $policy.localSecurityOptionsStandardUserElevationPromptBehavior
        $this.localSecurityOptionsSwitchToSecureDesktopWhenPromptingForElevation = $policy.localSecurityOptionsSwitchToSecureDesktopWhenPromptingForElevation
        $this.localSecurityOptionsDetectApplicationInstallationsAndPromptForElevation = $policy.localSecurityOptionsDetectApplicationInstallationsAndPromptForElevation
        $this.localSecurityOptionsAllowUIAccessApplicationsForSecureLocations = $policy.localSecurityOptionsAllowUIAccessApplicationsForSecureLocations
        $this.localSecurityOptionsUseAdminApprovalMode = $policy.localSecurityOptionsUseAdminApprovalMode
        $this.localSecurityOptionsUseAdminApprovalModeForAdministrators = $policy.localSecurityOptionsUseAdminApprovalModeForAdministrators
        $this.localSecurityOptionsInformationShownOnLockScreen = $policy.localSecurityOptionsInformationShownOnLockScreen
        $this.localSecurityOptionsInformationDisplayedOnLockScreen = $policy.localSecurityOptionsInformationDisplayedOnLockScreen
        $this.localSecurityOptionsDisableClientDigitallySignCommunicationsIfServerAgrees = $policy.localSecurityOptionsDisableClientDigitallySignCommunicationsIfServerAgrees
        $this.localSecurityOptionsClientDigitallySignCommunicationsAlways = $policy.localSecurityOptionsClientDigitallySignCommunicationsAlways
        $this.localSecurityOptionsClientSendUnencryptedPasswordToThirdPartySMBServers = $policy.localSecurityOptionsClientSendUnencryptedPasswordToThirdPartySMBServers
        $this.localSecurityOptionsDisableServerDigitallySignCommunicationsAlways = $policy.localSecurityOptionsDisableServerDigitallySignCommunicationsAlways
        $this.localSecurityOptionsDisableServerDigitallySignCommunicationsIfClientAgrees = $policy.localSecurityOptionsDisableServerDigitallySignCommunicationsIfClientAgrees
        $this.localSecurityOptionsRestrictAnonymousAccessToNamedPipesAndShares = $policy.localSecurityOptionsRestrictAnonymousAccessToNamedPipesAndShares
        $this.localSecurityOptionsDoNotAllowAnonymousEnumerationOfSAMAccounts = $policy.localSecurityOptionsDoNotAllowAnonymousEnumerationOfSAMAccounts
        $this.localSecurityOptionsAllowAnonymousEnumerationOfSAMAccountsAndShares = $policy.localSecurityOptionsAllowAnonymousEnumerationOfSAMAccountsAndShares
        $this.localSecurityOptionsDoNotStoreLANManagerHashValueOnNextPasswordChange = $policy.localSecurityOptionsDoNotStoreLANManagerHashValueOnNextPasswordChange
        $this.localSecurityOptionsSmartCardRemovalBehavior = $policy.localSecurityOptionsSmartCardRemovalBehavior
        $this.defenderSecurityCenterDisableAppBrowserUI = $policy.defenderSecurityCenterDisableAppBrowserUI
        $this.defenderSecurityCenterDisableFamilyUI = $policy.defenderSecurityCenterDisableFamilyUI
        $this.defenderSecurityCenterDisableHealthUI = $policy.defenderSecurityCenterDisableHealthUI
        $this.defenderSecurityCenterDisableNetworkUI = $policy.defenderSecurityCenterDisableNetworkUI
        $this.defenderSecurityCenterDisableVirusUI = $policy.defenderSecurityCenterDisableVirusUI
        $this.defenderSecurityCenterDisableAccountUI = $policy.defenderSecurityCenterDisableAccountUI
        $this.defenderSecurityCenterDisableClearTpmUI = $policy.defenderSecurityCenterDisableClearTpmUI
        $this.defenderSecurityCenterDisableHardwareUI = $policy.defenderSecurityCenterDisableHardwareUI
        $this.defenderSecurityCenterDisableNotificationAreaUI = $policy.defenderSecurityCenterDisableNotificationAreaUI
        $this.defenderSecurityCenterDisableRansomwareUI = $policy.defenderSecurityCenterDisableRansomwareUI
        $this.defenderSecurityCenterDisableSecureBootUI = $policy.defenderSecurityCenterDisableSecureBootUI
        $this.defenderSecurityCenterDisableTroubleshootingUI = $policy.defenderSecurityCenterDisableTroubleshootingUI
        $this.defenderSecurityCenterDisableVulnerableTpmFirmwareUpdateUI = $policy.defenderSecurityCenterDisableVulnerableTpmFirmwareUpdateUI
        $this.defenderSecurityCenterOrganizationDisplayName = $policy.defenderSecurityCenterOrganizationDisplayName
        $this.defenderSecurityCenterHelpEmail = $policy.defenderSecurityCenterHelpEmail
        $this.defenderSecurityCenterHelpPhone = $policy.defenderSecurityCenterHelpPhone
        $this.defenderSecurityCenterHelpURL = $policy.defenderSecurityCenterHelpURL
        $this.defenderSecurityCenterNotificationsFromApp = $policy.defenderSecurityCenterNotificationsFromApp
        $this.defenderSecurityCenterITContactDisplay = $policy.defenderSecurityCenterITContactDisplay
        $this.windowsDefenderTamperProtection = $policy.windowsDefenderTamperProtection
        $this.firewallBlockStatefulFTP = $policy.firewallBlockStatefulFTP
        $this.firewallIdleTimeoutForSecurityAssociationInSeconds = $policy.firewallIdleTimeoutForSecurityAssociationInSeconds
        $this.firewallPreSharedKeyEncodingMethod = $policy.firewallPreSharedKeyEncodingMethod
        $this.firewallIPSecExemptionsNone = $policy.firewallIPSecExemptionsNone
        $this.firewallIPSecExemptionsAllowNeighborDiscovery = $policy.firewallIPSecExemptionsAllowNeighborDiscovery
        $this.firewallIPSecExemptionsAllowICMP = $policy.firewallIPSecExemptionsAllowICMP
        $this.firewallIPSecExemptionsAllowRouterDiscovery = $policy.firewallIPSecExemptionsAllowRouterDiscovery
        $this.firewallIPSecExemptionsAllowDHCP = $policy.firewallIPSecExemptionsAllowDHCP
        $this.firewallCertificateRevocationListCheckMethod = $policy.firewallCertificateRevocationListCheckMethod
        $this.firewallMergeKeyingModuleSettings = $policy.firewallMergeKeyingModuleSettings
        $this.firewallPacketQueueingMethod = $policy.firewallPacketQueueingMethod
        $this.firewallProfileDomain = $policy.firewallProfileDomain
        $this.firewallProfilePublic = $policy.firewallProfilePublic
        $this.firewallProfilePrivate = $policy.firewallProfilePrivate
        $this.defenderAdobeReaderLaunchChildProcess = $policy.defenderAdobeReaderLaunchChildProcess
        $this.defenderAttackSurfaceReductionExcludedPaths = $policy.defenderAttackSurfaceReductionExcludedPaths
        $this.defenderOfficeAppsOtherProcessInjectionType = $policy.defenderOfficeAppsOtherProcessInjectionType
        $this.defenderOfficeAppsOtherProcessInjection = $policy.defenderOfficeAppsOtherProcessInjection
        $this.defenderOfficeCommunicationAppsLaunchChildProcess = $policy.defenderOfficeCommunicationAppsLaunchChildProcess
        $this.defenderOfficeAppsExecutableContentCreationOrLaunchType = $policy.defenderOfficeAppsExecutableContentCreationOrLaunchType
        $this.defenderOfficeAppsExecutableContentCreationOrLaunch = $policy.defenderOfficeAppsExecutableContentCreationOrLaunch
        $this.defenderOfficeAppsLaunchChildProcessType = $policy.defenderOfficeAppsLaunchChildProcessType
        $this.defenderOfficeAppsLaunchChildProcess = $policy.defenderOfficeAppsLaunchChildProcess
        $this.defenderOfficeMacroCodeAllowWin32ImportsType = $policy.defenderOfficeMacroCodeAllowWin32ImportsType
        $this.defenderOfficeMacroCodeAllowWin32Imports = $policy.defenderOfficeMacroCodeAllowWin32Imports
        $this.defenderScriptObfuscatedMacroCodeType = $policy.defenderScriptObfuscatedMacroCodeType
        $this.defenderScriptObfuscatedMacroCode = $policy.defenderScriptObfuscatedMacroCode
        $this.defenderScriptDownloadedPayloadExecutionType = $policy.defenderScriptDownloadedPayloadExecutionType
        $this.defenderScriptDownloadedPayloadExecution = $policy.defenderScriptDownloadedPayloadExecution
        $this.defenderPreventCredentialStealingType = $policy.defenderPreventCredentialStealingType
        $this.defenderProcessCreationType = $policy.defenderProcessCreationType
        $this.defenderProcessCreation = $policy.defenderProcessCreation
        $this.defenderUntrustedUSBProcessType = $policy.defenderUntrustedUSBProcessType
        $this.defenderUntrustedUSBProcess = $policy.defenderUntrustedUSBProcess
        $this.defenderUntrustedExecutableType = $policy.defenderUntrustedExecutableType
        $this.defenderUntrustedExecutable = $policy.defenderUntrustedExecutable
        $this.defenderEmailContentExecutionType = $policy.defenderEmailContentExecutionType
        $this.defenderEmailContentExecution = $policy.defenderEmailContentExecution
        $this.defenderAdvancedRansomewareProtectionType = $policy.defenderAdvancedRansomewareProtectionType
        $this.defenderGuardMyFoldersType = $policy.defenderGuardMyFoldersType
        $this.defenderGuardedFoldersAllowedAppPaths = $policy.defenderGuardedFoldersAllowedAppPaths
        $this.defenderAdditionalGuardedFolders = $policy.defenderAdditionalGuardedFolders
        $this.defenderNetworkProtectionType = $policy.defenderNetworkProtectionType
        $this.defenderExploitProtectionXml = $policy.defenderExploitProtectionXml
        $this.defenderExploitProtectionXmlFileName = $policy.defenderExploitProtectionXmlFileName
        $this.defenderSecurityCenterBlockExploitProtectionOverride = $policy.defenderSecurityCenterBlockExploitProtectionOverride
        $this.defenderBlockPersistenceThroughWmiType = $policy.defenderBlockPersistenceThroughWmiType
        $this.appLockerApplicationControl = $policy.appLockerApplicationControl
        $this.deviceGuardLocalSystemAuthorityCredentialGuardSettings = $policy.deviceGuardLocalSystemAuthorityCredentialGuardSettings
        $this.deviceGuardEnableVirtualizationBasedSecurity = $policy.deviceGuardEnableVirtualizationBasedSecurity
        $this.deviceGuardEnableSecureBootWithDMA = $policy.deviceGuardEnableSecureBootWithDMA
        $this.deviceGuardSecureBootWithDMA = $policy.deviceGuardSecureBootWithDMA
        $this.deviceGuardLaunchSystemGuard = $policy.deviceGuardLaunchSystemGuard
        $this.smartScreenEnableInShell = $policy.smartScreenEnableInShell
        $this.smartScreenBlockOverrideForFiles = $policy.smartScreenBlockOverrideForFiles
        $this.applicationGuardEnabled = $policy.applicationGuardEnabled
        $this.applicationGuardEnabledOptions = $policy.applicationGuardEnabledOptions
        $this.applicationGuardBlockFileTransfer = $policy.applicationGuardBlockFileTransfer
        $this.applicationGuardBlockNonEnterpriseContent = $policy.applicationGuardBlockNonEnterpriseContent
        $this.applicationGuardAllowPersistence = $policy.applicationGuardAllowPersistence
        $this.applicationGuardForceAuditing = $policy.applicationGuardForceAuditing
        $this.applicationGuardBlockClipboardSharing = $policy.applicationGuardBlockClipboardSharing
        $this.applicationGuardAllowPrintToPDF = $policy.applicationGuardAllowPrintToPDF
        $this.applicationGuardAllowPrintToXPS = $policy.applicationGuardAllowPrintToXPS
        $this.applicationGuardAllowPrintToLocalPrinters = $policy.applicationGuardAllowPrintToLocalPrinters
        $this.applicationGuardAllowPrintToNetworkPrinters = $policy.applicationGuardAllowPrintToNetworkPrinters
        $this.applicationGuardAllowVirtualGPU = $policy.applicationGuardAllowVirtualGPU
        $this.applicationGuardAllowFileSaveOnHost = $policy.applicationGuardAllowFileSaveOnHost
        $this.applicationGuardAllowCameraMicrophoneRedirection = $policy.applicationGuardAllowCameraMicrophoneRedirection
        $this.applicationGuardCertificateThumbprints = $policy.applicationGuardCertificateThumbprints
        $this.bitLockerAllowStandardUserEncryption = $policy.bitLockerAllowStandardUserEncryption
        $this.bitLockerDisableWarningForOtherDiskEncryption = $policy.bitLockerDisableWarningForOtherDiskEncryption
        $this.bitLockerEnableStorageCardEncryptionOnMobile = $policy.bitLockerEnableStorageCardEncryptionOnMobile
        $this.bitLockerEncryptDevice = $policy.bitLockerEncryptDevice
        $this.bitLockerSystemDrivePolicy = $policy.bitLockerSystemDrivePolicy
        $this.bitLockerFixedDrivePolicy = $policy.bitLockerFixedDrivePolicy
        $this.bitLockerRemovableDrivePolicy = $policy.bitLockerRemovableDrivePolicy
        $this.bitLockerRecoveryPasswordRotation = $policy.bitLockerRecoveryPasswordRotation
        $this.defenderDisableScanArchiveFiles = $policy.defenderDisableScanArchiveFiles
        $this.defenderAllowScanArchiveFiles = $policy.defenderAllowScanArchiveFiles
        $this.defenderDisableBehaviorMonitoring = $policy.defenderDisableBehaviorMonitoring
        $this.defenderAllowBehaviorMonitoring = $policy.defenderAllowBehaviorMonitoring
        $this.defenderDisableCloudProtection = $policy.defenderDisableCloudProtection
        $this.defenderAllowCloudProtection = $policy.defenderAllowCloudProtection
        $this.defenderEnableScanIncomingMail = $policy.defenderEnableScanIncomingMail
        $this.defenderEnableScanMappedNetworkDrivesDuringFullScan = $policy.defenderEnableScanMappedNetworkDrivesDuringFullScan
        $this.defenderDisableScanRemovableDrivesDuringFullScan = $policy.defenderDisableScanRemovableDrivesDuringFullScan
        $this.defenderAllowScanRemovableDrivesDuringFullScan = $policy.defenderAllowScanRemovableDrivesDuringFullScan
        $this.defenderDisableScanDownloads = $policy.defenderDisableScanDownloads
        $this.defenderAllowScanDownloads = $policy.defenderAllowScanDownloads
        $this.defenderDisableIntrusionPreventionSystem = $policy.defenderDisableIntrusionPreventionSystem
        $this.defenderAllowIntrusionPreventionSystem = $policy.defenderAllowIntrusionPreventionSystem
        $this.defenderDisableOnAccessProtection = $policy.defenderDisableOnAccessProtection
        $this.defenderAllowOnAccessProtection = $policy.defenderAllowOnAccessProtection
        $this.defenderDisableRealTimeMonitoring = $policy.defenderDisableRealTimeMonitoring
        $this.defenderAllowRealTimeMonitoring = $policy.defenderAllowRealTimeMonitoring
        $this.defenderDisableScanNetworkFiles = $policy.defenderDisableScanNetworkFiles
        $this.defenderAllowScanNetworkFiles = $policy.defenderAllowScanNetworkFiles
        $this.defenderDisableScanScriptsLoadedInInternetExplorer = $policy.defenderDisableScanScriptsLoadedInInternetExplorer
        $this.defenderAllowScanScriptsLoadedInInternetExplorer = $policy.defenderAllowScanScriptsLoadedInInternetExplorer
        $this.defenderBlockEndUserAccess = $policy.defenderBlockEndUserAccess
        $this.defenderAllowEndUserAccess = $policy.defenderAllowEndUserAccess
        $this.defenderScanMaxCpuPercentage = $policy.defenderScanMaxCpuPercentage
        $this.defenderCheckForSignaturesBeforeRunningScan = $policy.defenderCheckForSignaturesBeforeRunningScan
        $this.defenderCloudBlockLevel = $policy.defenderCloudBlockLevel
        $this.defenderCloudExtendedTimeoutInSeconds = $policy.defenderCloudExtendedTimeoutInSeconds
        $this.defenderDaysBeforeDeletingQuarantinedMalware = $policy.defenderDaysBeforeDeletingQuarantinedMalware
        $this.defenderDisableCatchupFullScan = $policy.defenderDisableCatchupFullScan
        $this.defenderDisableCatchupQuickScan = $policy.defenderDisableCatchupQuickScan
        $this.defenderEnableLowCpuPriority = $policy.defenderEnableLowCpuPriority
        $this.defenderFileExtensionsToExclude = $policy.defenderFileExtensionsToExclude
        $this.defenderFilesAndFoldersToExclude = $policy.defenderFilesAndFoldersToExclude
        $this.defenderProcessesToExclude = $policy.defenderProcessesToExclude
        $this.defenderPotentiallyUnwantedAppAction = $policy.defenderPotentiallyUnwantedAppAction
        $this.defenderScanDirection = $policy.defenderScanDirection
        $this.defenderScanType = $policy.defenderScanType
        $this.defenderScheduledQuickScanTime = $policy.defenderScheduledQuickScanTime
        $this.defenderScheduledScanDay = $policy.defenderScheduledScanDay
        $this.defenderScheduledScanTime = $policy.defenderScheduledScanTime
        $this.defenderSignatureUpdateIntervalInHours = $policy.defenderSignatureUpdateIntervalInHours
        $this.defenderSubmitSamplesConsentType = $policy.defenderSubmitSamplesConsentType
        $this.defenderDetectedMalwareActions = $policy.defenderDetectedMalwareActions
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: CreateEmWindows10EndpointProtectionConfiguration"
  }
}
