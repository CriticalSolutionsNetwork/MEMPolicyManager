class CreateEmMacOSEndpointProtectionConfiguration {
  [string]${@odata.type}
    [string]$description
    [string]$displayName
    [object]$version
    [string]$gatekeeperAllowedAppSource
    [bool]$gatekeeperBlockOverride
    [bool]$firewallEnabled
    [bool]$firewallBlockAllIncoming
    [bool]$firewallEnableStealthMode
    [object[]]$firewallApplications
    [bool]$fileVaultEnabled
    [string]$fileVaultSelectedRecoveryKeyTypes
    [string]$fileVaultInstitutionalRecoveryKeyCertificate
    [string]$fileVaultInstitutionalRecoveryKeyCertificateFileName
    [string]$fileVaultPersonalRecoveryKeyHelpMessage
    [bool]$fileVaultAllowDeferralUntilSignOut
    [object]$fileVaultNumberOfTimesUserCanIgnore
    [bool]$fileVaultDisablePromptAtSignOut
    [object]$fileVaultPersonalRecoveryKeyRotationInMonths
    [bool]$fileVaultHidePersonalRecoveryKey
    [string]$advancedThreatProtectionRealTime
    [string]$advancedThreatProtectionCloudDelivered
    [string]$advancedThreatProtectionAutomaticSampleSubmission
    [string]$advancedThreatProtectionDiagnosticDataCollection
    [object[]]$advancedThreatProtectionExcludedFolders
    [object[]]$advancedThreatProtectionExcludedFiles
    [object[]]$advancedThreatProtectionExcludedExtensions
    [object[]]$advancedThreatProtectionExcludedProcesses

  # Default constructor
  CreateEmMacOSEndpointProtectionConfiguration() {
      $this."@odata.type" = ''
        $this.description = ''
        $this.displayName = ''
        $this.version = $null
        $this.gatekeeperAllowedAppSource = ''
        $this.gatekeeperBlockOverride = $false
        $this.firewallEnabled = $false
        $this.firewallBlockAllIncoming = $false
        $this.firewallEnableStealthMode = $false
        $this.firewallApplications = @()
        $this.fileVaultEnabled = $false
        $this.fileVaultSelectedRecoveryKeyTypes = ''
        $this.fileVaultInstitutionalRecoveryKeyCertificate = ''
        $this.fileVaultInstitutionalRecoveryKeyCertificateFileName = ''
        $this.fileVaultPersonalRecoveryKeyHelpMessage = ''
        $this.fileVaultAllowDeferralUntilSignOut = $false
        $this.fileVaultNumberOfTimesUserCanIgnore = $null
        $this.fileVaultDisablePromptAtSignOut = $false
        $this.fileVaultPersonalRecoveryKeyRotationInMonths = $null
        $this.fileVaultHidePersonalRecoveryKey = $false
        $this.advancedThreatProtectionRealTime = ''
        $this.advancedThreatProtectionCloudDelivered = ''
        $this.advancedThreatProtectionAutomaticSampleSubmission = ''
        $this.advancedThreatProtectionDiagnosticDataCollection = ''
        $this.advancedThreatProtectionExcludedFolders = @()
        $this.advancedThreatProtectionExcludedFiles = @()
        $this.advancedThreatProtectionExcludedExtensions = @()
        $this.advancedThreatProtectionExcludedProcesses = @()
  }

  # Parameterized constructor
  CreateEmMacOSEndpointProtectionConfiguration ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.description = $policy.description
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.gatekeeperAllowedAppSource = $policy.gatekeeperAllowedAppSource
        $this.gatekeeperBlockOverride = $policy.gatekeeperBlockOverride
        $this.firewallEnabled = $policy.firewallEnabled
        $this.firewallBlockAllIncoming = $policy.firewallBlockAllIncoming
        $this.firewallEnableStealthMode = $policy.firewallEnableStealthMode
        $this.firewallApplications = $policy.firewallApplications
        $this.fileVaultEnabled = $policy.fileVaultEnabled
        $this.fileVaultSelectedRecoveryKeyTypes = $policy.fileVaultSelectedRecoveryKeyTypes
        $this.fileVaultInstitutionalRecoveryKeyCertificate = $policy.fileVaultInstitutionalRecoveryKeyCertificate
        $this.fileVaultInstitutionalRecoveryKeyCertificateFileName = $policy.fileVaultInstitutionalRecoveryKeyCertificateFileName
        $this.fileVaultPersonalRecoveryKeyHelpMessage = $policy.fileVaultPersonalRecoveryKeyHelpMessage
        $this.fileVaultAllowDeferralUntilSignOut = $policy.fileVaultAllowDeferralUntilSignOut
        $this.fileVaultNumberOfTimesUserCanIgnore = $policy.fileVaultNumberOfTimesUserCanIgnore
        $this.fileVaultDisablePromptAtSignOut = $policy.fileVaultDisablePromptAtSignOut
        $this.fileVaultPersonalRecoveryKeyRotationInMonths = $policy.fileVaultPersonalRecoveryKeyRotationInMonths
        $this.fileVaultHidePersonalRecoveryKey = $policy.fileVaultHidePersonalRecoveryKey
        $this.advancedThreatProtectionRealTime = $policy.advancedThreatProtectionRealTime
        $this.advancedThreatProtectionCloudDelivered = $policy.advancedThreatProtectionCloudDelivered
        $this.advancedThreatProtectionAutomaticSampleSubmission = $policy.advancedThreatProtectionAutomaticSampleSubmission
        $this.advancedThreatProtectionDiagnosticDataCollection = $policy.advancedThreatProtectionDiagnosticDataCollection
        $this.advancedThreatProtectionExcludedFolders = $policy.advancedThreatProtectionExcludedFolders
        $this.advancedThreatProtectionExcludedFiles = $policy.advancedThreatProtectionExcludedFiles
        $this.advancedThreatProtectionExcludedExtensions = $policy.advancedThreatProtectionExcludedExtensions
        $this.advancedThreatProtectionExcludedProcesses = $policy.advancedThreatProtectionExcludedProcesses
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: CreateEmMacOSEndpointProtectionConfiguration"
  }
}
