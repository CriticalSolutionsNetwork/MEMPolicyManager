class CreateEmWindows81SCEPCertificateProfile {
  [string]${@odata.type}
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
  CreateEmWindows81SCEPCertificateProfile() {
      $this."@odata.type" = ''
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
  CreateEmWindows81SCEPCertificateProfile ($policy) {
      $this."@odata.type" = $policy."@odata.type"
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
      return "Class: CreateEmWindows81SCEPCertificateProfile"
  }
}
