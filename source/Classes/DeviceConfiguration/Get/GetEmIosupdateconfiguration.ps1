class GetEmIosUpdateConfiguration {
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
    [bool]$isEnabled
    [string]$activeHoursStart
    [string]$activeHoursEnd
    [string]$desiredOsVersion
    [object[]]$scheduledInstallDays
    [object]$utcTimeOffsetInMinutes
    [object]$enforcedSoftwareUpdateDelayInDays
    [string]$updateScheduleType
    [object[]]$customUpdateTimeWindows

    # Default constructor
    GetEmIosUpdateConfiguration() {
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
        $this.isEnabled = $false
        $this.activeHoursStart = ''
        $this.activeHoursEnd = ''
        $this.desiredOsVersion = ''
        $this.scheduledInstallDays = @()
        $this.utcTimeOffsetInMinutes = $null
        $this.enforcedSoftwareUpdateDelayInDays = $null
        $this.updateScheduleType = ''
        $this.customUpdateTimeWindows = @()
    }

    # Parameterized constructor
    GetEmIosUpdateConfiguration ($policy) {
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
        $this.isEnabled = $policy.isEnabled
        $this.activeHoursStart = $policy.activeHoursStart
        $this.activeHoursEnd = $policy.activeHoursEnd
        $this.desiredOsVersion = $policy.desiredOsVersion
        $this.scheduledInstallDays = $policy.scheduledInstallDays
        $this.utcTimeOffsetInMinutes = $policy.utcTimeOffsetInMinutes
        $this.enforcedSoftwareUpdateDelayInDays = $policy.enforcedSoftwareUpdateDelayInDays
        $this.updateScheduleType = $policy.updateScheduleType
        $this.customUpdateTimeWindows = $policy.customUpdateTimeWindows
    }

    # Overriding the ToString method
    [string] ToString() {
        return "Class: GetEmIosUpdateConfiguration"
    }
}