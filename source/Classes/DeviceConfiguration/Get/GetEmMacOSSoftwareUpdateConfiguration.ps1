class GetEmMacOSSoftwareUpdateConfiguration {
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
    [string]$criticalUpdateBehavior
    [string]$configDataUpdateBehavior
    [string]$firmwareUpdateBehavior
    [string]$allOtherUpdateBehavior
    [string]$updateScheduleType
    [object[]]$customUpdateTimeWindows
    [object]$updateTimeWindowUtcOffsetInMinutes
    [object]$maxUserDeferralsCount
    [string]$priority

  # Default constructor
  GetEmMacOSSoftwareUpdateConfiguration() {
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
        $this.criticalUpdateBehavior = ''
        $this.configDataUpdateBehavior = ''
        $this.firmwareUpdateBehavior = ''
        $this.allOtherUpdateBehavior = ''
        $this.updateScheduleType = ''
        $this.customUpdateTimeWindows = @()
        $this.updateTimeWindowUtcOffsetInMinutes = $null
        $this.maxUserDeferralsCount = $null
        $this.priority = ''
  }

  # Parameterized constructor
  GetEmMacOSSoftwareUpdateConfiguration ($policy) {
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
        $this.criticalUpdateBehavior = $policy.criticalUpdateBehavior
        $this.configDataUpdateBehavior = $policy.configDataUpdateBehavior
        $this.firmwareUpdateBehavior = $policy.firmwareUpdateBehavior
        $this.allOtherUpdateBehavior = $policy.allOtherUpdateBehavior
        $this.updateScheduleType = $policy.updateScheduleType
        $this.customUpdateTimeWindows = $policy.customUpdateTimeWindows
        $this.updateTimeWindowUtcOffsetInMinutes = $policy.updateTimeWindowUtcOffsetInMinutes
        $this.maxUserDeferralsCount = $policy.maxUserDeferralsCount
        $this.priority = $policy.priority
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMacOSSoftwareUpdateConfiguration"
  }
}
