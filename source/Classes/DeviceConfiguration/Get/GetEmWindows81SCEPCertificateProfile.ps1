class GetEmWindows81SCEPCertificateProfile {
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
    [object]$renewalThresholdPercentage
    [string]$keyStorageProvider
    [string]$subjectNameFormat
    [string]$subjectAlternativeNameType
    [object]$certificateValidityPeriodValue
    [string]$certificateValidityPeriodScale
    [object[]]$extendedKeyUsages
    [object[]]$customSubjectAlternativeNames
    [object[]]$scepServerUrls
    [string]$subjectNameFormatString
    [string]$keyUsage
    [string]$keySize
    [string]$hashAlgorithm
    [string]$subjectAlternativeNameFormatString
    [string]$certificateStore

  # Default constructor
  GetEmWindows81SCEPCertificateProfile() {
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
        $this.renewalThresholdPercentage = $null
        $this.keyStorageProvider = ''
        $this.subjectNameFormat = ''
        $this.subjectAlternativeNameType = ''
        $this.certificateValidityPeriodValue = $null
        $this.certificateValidityPeriodScale = ''
        $this.extendedKeyUsages = @()
        $this.customSubjectAlternativeNames = @()
        $this.scepServerUrls = @()
        $this.subjectNameFormatString = ''
        $this.keyUsage = ''
        $this.keySize = ''
        $this.hashAlgorithm = ''
        $this.subjectAlternativeNameFormatString = ''
        $this.certificateStore = ''
  }

  # Parameterized constructor
  GetEmWindows81SCEPCertificateProfile ($policy) {
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
        $this.renewalThresholdPercentage = $policy.renewalThresholdPercentage
        $this.keyStorageProvider = $policy.keyStorageProvider
        $this.subjectNameFormat = $policy.subjectNameFormat
        $this.subjectAlternativeNameType = $policy.subjectAlternativeNameType
        $this.certificateValidityPeriodValue = $policy.certificateValidityPeriodValue
        $this.certificateValidityPeriodScale = $policy.certificateValidityPeriodScale
        $this.extendedKeyUsages = $policy.extendedKeyUsages
        $this.customSubjectAlternativeNames = $policy.customSubjectAlternativeNames
        $this.scepServerUrls = $policy.scepServerUrls
        $this.subjectNameFormatString = $policy.subjectNameFormatString
        $this.keyUsage = $policy.keyUsage
        $this.keySize = $policy.keySize
        $this.hashAlgorithm = $policy.hashAlgorithm
        $this.subjectAlternativeNameFormatString = $policy.subjectAlternativeNameFormatString
        $this.certificateStore = $policy.certificateStore
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmWindows81SCEPCertificateProfile"
  }
}
