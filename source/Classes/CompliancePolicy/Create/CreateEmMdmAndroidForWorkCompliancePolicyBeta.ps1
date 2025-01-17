class CreateEmMdmAndroidForWorkCompliancePolicyBeta {
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
    [object]$workProfilePasswordExpirationInDays
    [object]$workProfilePasswordMinimumLength
    [object]$workProfileInactiveBeforeScreenLockInMinutes
    [object]$workProfilePreviousPasswordBlockCount
    [string]$workProfilePasswordRequiredType
    [string]$workProfileRequiredPasswordComplexity
    [bool]$workProfileRequirePassword
    [bool]$securityPreventInstallAppsFromUnknownSources
    [bool]$securityDisableUsbDebugging
    [bool]$securityRequireVerifyApps
    [bool]$deviceThreatProtectionEnabled
    [string]$deviceThreatProtectionRequiredSecurityLevel
    [bool]$securityBlockJailbrokenDevices
    [string]$osMinimumVersion
    [string]$osMaximumVersion
    [string]$minAndroidSecurityPatchLevel
    [bool]$storageRequireEncryption
    [bool]$securityRequireSafetyNetAttestationBasicIntegrity
    [bool]$securityRequireSafetyNetAttestationCertifiedDevice
    [bool]$securityRequireGooglePlayServices
    [bool]$securityRequireUpToDateSecurityProviders
    [bool]$securityRequireCompanyPortalAppIntegrity
    [string]$securityRequiredAndroidSafetyNetEvaluationType

  # Default constructor
  CreateEmMdmAndroidForWorkCompliancePolicyBeta() {
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
        $this.workProfilePasswordExpirationInDays = $null
        $this.workProfilePasswordMinimumLength = $null
        $this.workProfileInactiveBeforeScreenLockInMinutes = $null
        $this.workProfilePreviousPasswordBlockCount = $null
        $this.workProfilePasswordRequiredType = ''
        $this.workProfileRequiredPasswordComplexity = ''
        $this.workProfileRequirePassword = $false
        $this.securityPreventInstallAppsFromUnknownSources = $false
        $this.securityDisableUsbDebugging = $false
        $this.securityRequireVerifyApps = $false
        $this.deviceThreatProtectionEnabled = $false
        $this.deviceThreatProtectionRequiredSecurityLevel = ''
        $this.securityBlockJailbrokenDevices = $false
        $this.osMinimumVersion = ''
        $this.osMaximumVersion = ''
        $this.minAndroidSecurityPatchLevel = ''
        $this.storageRequireEncryption = $false
        $this.securityRequireSafetyNetAttestationBasicIntegrity = $false
        $this.securityRequireSafetyNetAttestationCertifiedDevice = $false
        $this.securityRequireGooglePlayServices = $false
        $this.securityRequireUpToDateSecurityProviders = $false
        $this.securityRequireCompanyPortalAppIntegrity = $false
        $this.securityRequiredAndroidSafetyNetEvaluationType = ''
  }

  # Parameterized constructor
  CreateEmMdmAndroidForWorkCompliancePolicyBeta ($policy) {
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
        $this.workProfilePasswordExpirationInDays = $policy.workProfilePasswordExpirationInDays
        $this.workProfilePasswordMinimumLength = $policy.workProfilePasswordMinimumLength
        $this.workProfileInactiveBeforeScreenLockInMinutes = $policy.workProfileInactiveBeforeScreenLockInMinutes
        $this.workProfilePreviousPasswordBlockCount = $policy.workProfilePreviousPasswordBlockCount
        $this.workProfilePasswordRequiredType = $policy.workProfilePasswordRequiredType
        $this.workProfileRequiredPasswordComplexity = $policy.workProfileRequiredPasswordComplexity
        $this.workProfileRequirePassword = $policy.workProfileRequirePassword
        $this.securityPreventInstallAppsFromUnknownSources = $policy.securityPreventInstallAppsFromUnknownSources
        $this.securityDisableUsbDebugging = $policy.securityDisableUsbDebugging
        $this.securityRequireVerifyApps = $policy.securityRequireVerifyApps
        $this.deviceThreatProtectionEnabled = $policy.deviceThreatProtectionEnabled
        $this.deviceThreatProtectionRequiredSecurityLevel = $policy.deviceThreatProtectionRequiredSecurityLevel
        $this.securityBlockJailbrokenDevices = $policy.securityBlockJailbrokenDevices
        $this.osMinimumVersion = $policy.osMinimumVersion
        $this.osMaximumVersion = $policy.osMaximumVersion
        $this.minAndroidSecurityPatchLevel = $policy.minAndroidSecurityPatchLevel
        $this.storageRequireEncryption = $policy.storageRequireEncryption
        $this.securityRequireSafetyNetAttestationBasicIntegrity = $policy.securityRequireSafetyNetAttestationBasicIntegrity
        $this.securityRequireSafetyNetAttestationCertifiedDevice = $policy.securityRequireSafetyNetAttestationCertifiedDevice
        $this.securityRequireGooglePlayServices = $policy.securityRequireGooglePlayServices
        $this.securityRequireUpToDateSecurityProviders = $policy.securityRequireUpToDateSecurityProviders
        $this.securityRequireCompanyPortalAppIntegrity = $policy.securityRequireCompanyPortalAppIntegrity
        $this.securityRequiredAndroidSafetyNetEvaluationType = $policy.securityRequiredAndroidSafetyNetEvaluationType
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: CreateEmMdmAndroidForWorkCompliancePolicyBeta"
  }
}
