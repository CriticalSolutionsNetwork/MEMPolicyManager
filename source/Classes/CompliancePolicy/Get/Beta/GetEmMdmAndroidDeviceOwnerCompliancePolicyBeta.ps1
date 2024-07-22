class GetEmMdmAndroidDeviceOwnerCompliancePolicyBeta {
  [string]${@odata.type}
    [object[]]$roleScopeTagIds
    [string]$id
    [datetime]$createdDateTime
    [string]$description
    [datetime]$lastModifiedDateTime
    [string]$displayName
    [object]$version
    [bool]$deviceThreatProtectionEnabled
    [string]$deviceThreatProtectionRequiredSecurityLevel
    [string]$advancedThreatProtectionRequiredSecurityLevel
    [bool]$securityRequireSafetyNetAttestationBasicIntegrity
    [bool]$securityRequireSafetyNetAttestationCertifiedDevice
    [string]$osMinimumVersion
    [string]$osMaximumVersion
    [string]$minAndroidSecurityPatchLevel
    [bool]$passwordRequired
    [object]$passwordMinimumLength
    [object]$passwordMinimumLetterCharacters
    [object]$passwordMinimumLowerCaseCharacters
    [object]$passwordMinimumNonLetterCharacters
    [object]$passwordMinimumNumericCharacters
    [object]$passwordMinimumSymbolCharacters
    [object]$passwordMinimumUpperCaseCharacters
    [string]$passwordRequiredType
    [object]$passwordMinutesOfInactivityBeforeLock
    [object]$passwordExpirationDays
    [object]$passwordPreviousPasswordCountToBlock
    [bool]$storageRequireEncryption
    [bool]$securityRequireIntuneAppIntegrity
    [bool]$requireNoPendingSystemUpdates
    [string]$securityRequiredAndroidSafetyNetEvaluationType

  # Default constructor
  GetEmMdmAndroidDeviceOwnerCompliancePolicyBeta() {
      $this."@odata.type" = ''
        $this.roleScopeTagIds = @()
        $this.id = ''
        $this.createdDateTime = [datetime]::MinValue
        $this.description = ''
        $this.lastModifiedDateTime = [datetime]::MinValue
        $this.displayName = ''
        $this.version = $null
        $this.deviceThreatProtectionEnabled = $false
        $this.deviceThreatProtectionRequiredSecurityLevel = ''
        $this.advancedThreatProtectionRequiredSecurityLevel = ''
        $this.securityRequireSafetyNetAttestationBasicIntegrity = $false
        $this.securityRequireSafetyNetAttestationCertifiedDevice = $false
        $this.osMinimumVersion = ''
        $this.osMaximumVersion = ''
        $this.minAndroidSecurityPatchLevel = ''
        $this.passwordRequired = $false
        $this.passwordMinimumLength = $null
        $this.passwordMinimumLetterCharacters = $null
        $this.passwordMinimumLowerCaseCharacters = $null
        $this.passwordMinimumNonLetterCharacters = $null
        $this.passwordMinimumNumericCharacters = $null
        $this.passwordMinimumSymbolCharacters = $null
        $this.passwordMinimumUpperCaseCharacters = $null
        $this.passwordRequiredType = ''
        $this.passwordMinutesOfInactivityBeforeLock = $null
        $this.passwordExpirationDays = $null
        $this.passwordPreviousPasswordCountToBlock = $null
        $this.storageRequireEncryption = $false
        $this.securityRequireIntuneAppIntegrity = $false
        $this.requireNoPendingSystemUpdates = $false
        $this.securityRequiredAndroidSafetyNetEvaluationType = ''
  }

  # Parameterized constructor
  GetEmMdmAndroidDeviceOwnerCompliancePolicyBeta ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.id = $policy.id
        $this.createdDateTime = $policy.createdDateTime
        $this.description = $policy.description
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.deviceThreatProtectionEnabled = $policy.deviceThreatProtectionEnabled
        $this.deviceThreatProtectionRequiredSecurityLevel = $policy.deviceThreatProtectionRequiredSecurityLevel
        $this.advancedThreatProtectionRequiredSecurityLevel = $policy.advancedThreatProtectionRequiredSecurityLevel
        $this.securityRequireSafetyNetAttestationBasicIntegrity = $policy.securityRequireSafetyNetAttestationBasicIntegrity
        $this.securityRequireSafetyNetAttestationCertifiedDevice = $policy.securityRequireSafetyNetAttestationCertifiedDevice
        $this.osMinimumVersion = $policy.osMinimumVersion
        $this.osMaximumVersion = $policy.osMaximumVersion
        $this.minAndroidSecurityPatchLevel = $policy.minAndroidSecurityPatchLevel
        $this.passwordRequired = $policy.passwordRequired
        $this.passwordMinimumLength = $policy.passwordMinimumLength
        $this.passwordMinimumLetterCharacters = $policy.passwordMinimumLetterCharacters
        $this.passwordMinimumLowerCaseCharacters = $policy.passwordMinimumLowerCaseCharacters
        $this.passwordMinimumNonLetterCharacters = $policy.passwordMinimumNonLetterCharacters
        $this.passwordMinimumNumericCharacters = $policy.passwordMinimumNumericCharacters
        $this.passwordMinimumSymbolCharacters = $policy.passwordMinimumSymbolCharacters
        $this.passwordMinimumUpperCaseCharacters = $policy.passwordMinimumUpperCaseCharacters
        $this.passwordRequiredType = $policy.passwordRequiredType
        $this.passwordMinutesOfInactivityBeforeLock = $policy.passwordMinutesOfInactivityBeforeLock
        $this.passwordExpirationDays = $policy.passwordExpirationDays
        $this.passwordPreviousPasswordCountToBlock = $policy.passwordPreviousPasswordCountToBlock
        $this.storageRequireEncryption = $policy.storageRequireEncryption
        $this.securityRequireIntuneAppIntegrity = $policy.securityRequireIntuneAppIntegrity
        $this.requireNoPendingSystemUpdates = $policy.requireNoPendingSystemUpdates
        $this.securityRequiredAndroidSafetyNetEvaluationType = $policy.securityRequiredAndroidSafetyNetEvaluationType
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMdmAndroidDeviceOwnerCompliancePolicyBeta"
  }
}
