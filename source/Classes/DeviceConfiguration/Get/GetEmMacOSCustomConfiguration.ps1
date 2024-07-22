class GetEmMacOSCustomConfiguration {
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
    [string]$payloadName
    [string]$payloadFileName
    [string]$payload
    [string]$deploymentChannel

  # Default constructor
  GetEmMacOSCustomConfiguration() {
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
        $this.payloadName = ''
        $this.payloadFileName = ''
        $this.payload = ''
        $this.deploymentChannel = ''
  }

  # Parameterized constructor
  GetEmMacOSCustomConfiguration ($policy) {
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
        $this.payloadName = $policy.payloadName
        $this.payloadFileName = $policy.payloadFileName
        $this.payload = $policy.payload
        $this.deploymentChannel = $policy.deploymentChannel
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMacOSCustomConfiguration"
  }
}
