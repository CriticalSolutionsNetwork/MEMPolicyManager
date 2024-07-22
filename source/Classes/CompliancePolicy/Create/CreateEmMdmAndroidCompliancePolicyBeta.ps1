class CreateEmMdmAndroidCompliancePolicyBeta {
  [string]${@odata.type}
    [string]$description
    [string]$displayName
    [object]$version
    [bool]$passwordRequired
    [object]$passwordMinimumLength
    [string]$passwordRequiredType
    [string]$requiredPasswordComplexity
    [object]$passwordMinutesOfInactivityBeforeLock
    [object]$passwordExpirationDays
    [object]$passwordPreviousPasswordBlockCount
    [object]$passwordSignInFailureCountBeforeFactoryReset
    [bool]$securityPreventInstallAppsFromUnknownSources
    [bool]$securityDisableUsbDebugging
    [bool]$securityRequireVerifyApps
    [bool]$deviceThreatProtectionEnabled
    [string]$deviceThreatProtectionRequiredSecurityLevel
    [string]$advancedThreatProtectionRequiredSecurityLevel
    [bool]$securityBlockJailbrokenDevices
    [bool]$securityBlockDeviceAdministratorManagedDevices
    [string]$osMinimumVersion
    [string]$osMaximumVersion
    [string]$minAndroidSecurityPatchLevel
    [bool]$storageRequireEncryption
    [bool]$securityRequireSafetyNetAttestationBasicIntegrity
    [bool]$securityRequireSafetyNetAttestationCertifiedDevice
    [bool]$securityRequireGooglePlayServices
    [bool]$securityRequireUpToDateSecurityProviders
    [bool]$securityRequireCompanyPortalAppIntegrity
    [string]$conditionStatementId
    [object[]]$restrictedApps

  # Default constructor
  CreateEmMdmAndroidCompliancePolicyBeta() {
      $this."@odata.type" = ''
        $this.description = ''
        $this.displayName = ''
        $this.version = $null
        $this.passwordRequired = $false
        $this.passwordMinimumLength = $null
        $this.passwordRequiredType = ''
        $this.requiredPasswordComplexity = ''
        $this.passwordMinutesOfInactivityBeforeLock = $null
        $this.passwordExpirationDays = $null
        $this.passwordPreviousPasswordBlockCount = $null
        $this.passwordSignInFailureCountBeforeFactoryReset = $null
        $this.securityPreventInstallAppsFromUnknownSources = $false
        $this.securityDisableUsbDebugging = $false
        $this.securityRequireVerifyApps = $false
        $this.deviceThreatProtectionEnabled = $false
        $this.deviceThreatProtectionRequiredSecurityLevel = ''
        $this.advancedThreatProtectionRequiredSecurityLevel = ''
        $this.securityBlockJailbrokenDevices = $false
        $this.securityBlockDeviceAdministratorManagedDevices = $false
        $this.osMinimumVersion = ''
        $this.osMaximumVersion = ''
        $this.minAndroidSecurityPatchLevel = ''
        $this.storageRequireEncryption = $false
        $this.securityRequireSafetyNetAttestationBasicIntegrity = $false
        $this.securityRequireSafetyNetAttestationCertifiedDevice = $false
        $this.securityRequireGooglePlayServices = $false
        $this.securityRequireUpToDateSecurityProviders = $false
        $this.securityRequireCompanyPortalAppIntegrity = $false
        $this.conditionStatementId = ''
        $this.restrictedApps = @()
  }

  # Parameterized constructor
  CreateEmMdmAndroidCompliancePolicyBeta ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.description = $policy.description
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.passwordRequired = $policy.passwordRequired
        $this.passwordMinimumLength = $policy.passwordMinimumLength
        $this.passwordRequiredType = $policy.passwordRequiredType
        $this.requiredPasswordComplexity = $policy.requiredPasswordComplexity
        $this.passwordMinutesOfInactivityBeforeLock = $policy.passwordMinutesOfInactivityBeforeLock
        $this.passwordExpirationDays = $policy.passwordExpirationDays
        $this.passwordPreviousPasswordBlockCount = $policy.passwordPreviousPasswordBlockCount
        $this.passwordSignInFailureCountBeforeFactoryReset = $policy.passwordSignInFailureCountBeforeFactoryReset
        $this.securityPreventInstallAppsFromUnknownSources = $policy.securityPreventInstallAppsFromUnknownSources
        $this.securityDisableUsbDebugging = $policy.securityDisableUsbDebugging
        $this.securityRequireVerifyApps = $policy.securityRequireVerifyApps
        $this.deviceThreatProtectionEnabled = $policy.deviceThreatProtectionEnabled
        $this.deviceThreatProtectionRequiredSecurityLevel = $policy.deviceThreatProtectionRequiredSecurityLevel
        $this.advancedThreatProtectionRequiredSecurityLevel = $policy.advancedThreatProtectionRequiredSecurityLevel
        $this.securityBlockJailbrokenDevices = $policy.securityBlockJailbrokenDevices
        $this.securityBlockDeviceAdministratorManagedDevices = $policy.securityBlockDeviceAdministratorManagedDevices
        $this.osMinimumVersion = $policy.osMinimumVersion
        $this.osMaximumVersion = $policy.osMaximumVersion
        $this.minAndroidSecurityPatchLevel = $policy.minAndroidSecurityPatchLevel
        $this.storageRequireEncryption = $policy.storageRequireEncryption
        $this.securityRequireSafetyNetAttestationBasicIntegrity = $policy.securityRequireSafetyNetAttestationBasicIntegrity
        $this.securityRequireSafetyNetAttestationCertifiedDevice = $policy.securityRequireSafetyNetAttestationCertifiedDevice
        $this.securityRequireGooglePlayServices = $policy.securityRequireGooglePlayServices
        $this.securityRequireUpToDateSecurityProviders = $policy.securityRequireUpToDateSecurityProviders
        $this.securityRequireCompanyPortalAppIntegrity = $policy.securityRequireCompanyPortalAppIntegrity
        $this.conditionStatementId = $policy.conditionStatementId
        $this.restrictedApps = $policy.restrictedApps
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: CreateEmMdmAndroidCompliancePolicyBeta"
  }
}
