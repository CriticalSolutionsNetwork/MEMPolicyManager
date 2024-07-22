class GetEmWindowsUpdateForBusinessConfiguration {
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
    [string]$deliveryOptimizationMode
    [string]$prereleaseFeatures
    [string]$automaticUpdateMode
    [bool]$microsoftUpdateServiceAllowed
    [bool]$driversExcluded
    [psobject]$installationSchedule
    [object]$qualityUpdatesDeferralPeriodInDays
    [object]$featureUpdatesDeferralPeriodInDays
    [bool]$qualityUpdatesPaused
    [bool]$featureUpdatesPaused
    [datetime]$qualityUpdatesPauseExpiryDateTime
    [datetime]$featureUpdatesPauseExpiryDateTime
    [string]$businessReadyUpdatesOnly
    [bool]$skipChecksBeforeRestart
    [string]$updateWeeks
    [string]$qualityUpdatesPauseStartDate
    [string]$featureUpdatesPauseStartDate
    [object]$featureUpdatesRollbackWindowInDays
    [bool]$qualityUpdatesWillBeRolledBack
    [bool]$featureUpdatesWillBeRolledBack
    [datetime]$qualityUpdatesRollbackStartDateTime
    [datetime]$featureUpdatesRollbackStartDateTime
    [object]$engagedRestartDeadlineInDays
    [object]$engagedRestartSnoozeScheduleInDays
    [object]$engagedRestartTransitionScheduleInDays
    [object]$deadlineForFeatureUpdatesInDays
    [object]$deadlineForQualityUpdatesInDays
    [object]$deadlineGracePeriodInDays
    [bool]$postponeRebootUntilAfterDeadline
    [string]$autoRestartNotificationDismissal
    [object]$scheduleRestartWarningInHours
    [object]$scheduleImminentRestartWarningInMinutes
    [string]$userPauseAccess
    [string]$userWindowsUpdateScanAccess
    [string]$updateNotificationLevel
    [bool]$allowWindows11Upgrade

    # Default constructor
    GetEmWindowsUpdateForBusinessConfiguration() {
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
        $this.deliveryOptimizationMode = ''
        $this.prereleaseFeatures = ''
        $this.automaticUpdateMode = ''
        $this.microsoftUpdateServiceAllowed = $false
        $this.driversExcluded = $false
        $this.installationSchedule = $null
        $this.qualityUpdatesDeferralPeriodInDays = $null
        $this.featureUpdatesDeferralPeriodInDays = $null
        $this.qualityUpdatesPaused = $false
        $this.featureUpdatesPaused = $false
        $this.qualityUpdatesPauseExpiryDateTime = [datetime]::MinValue
        $this.featureUpdatesPauseExpiryDateTime = [datetime]::MinValue
        $this.businessReadyUpdatesOnly = ''
        $this.skipChecksBeforeRestart = $false
        $this.updateWeeks = ''
        $this.qualityUpdatesPauseStartDate = ''
        $this.featureUpdatesPauseStartDate = ''
        $this.featureUpdatesRollbackWindowInDays = $null
        $this.qualityUpdatesWillBeRolledBack = $false
        $this.featureUpdatesWillBeRolledBack = $false
        $this.qualityUpdatesRollbackStartDateTime = [datetime]::MinValue
        $this.featureUpdatesRollbackStartDateTime = [datetime]::MinValue
        $this.engagedRestartDeadlineInDays = $null
        $this.engagedRestartSnoozeScheduleInDays = $null
        $this.engagedRestartTransitionScheduleInDays = $null
        $this.deadlineForFeatureUpdatesInDays = $null
        $this.deadlineForQualityUpdatesInDays = $null
        $this.deadlineGracePeriodInDays = $null
        $this.postponeRebootUntilAfterDeadline = $false
        $this.autoRestartNotificationDismissal = ''
        $this.scheduleRestartWarningInHours = $null
        $this.scheduleImminentRestartWarningInMinutes = $null
        $this.userPauseAccess = ''
        $this.userWindowsUpdateScanAccess = ''
        $this.updateNotificationLevel = ''
        $this.allowWindows11Upgrade = $false
    }

    # Parameterized constructor
    GetEmWindowsUpdateForBusinessConfiguration ($policy) {
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
        $this.deliveryOptimizationMode = $policy.deliveryOptimizationMode
        $this.prereleaseFeatures = $policy.prereleaseFeatures
        $this.automaticUpdateMode = $policy.automaticUpdateMode
        $this.microsoftUpdateServiceAllowed = $policy.microsoftUpdateServiceAllowed
        $this.driversExcluded = $policy.driversExcluded
        $this.installationSchedule = $policy.installationSchedule
        $this.qualityUpdatesDeferralPeriodInDays = $policy.qualityUpdatesDeferralPeriodInDays
        $this.featureUpdatesDeferralPeriodInDays = $policy.featureUpdatesDeferralPeriodInDays
        $this.qualityUpdatesPaused = $policy.qualityUpdatesPaused
        $this.featureUpdatesPaused = $policy.featureUpdatesPaused
        $this.qualityUpdatesPauseExpiryDateTime = $policy.qualityUpdatesPauseExpiryDateTime
        $this.featureUpdatesPauseExpiryDateTime = $policy.featureUpdatesPauseExpiryDateTime
        $this.businessReadyUpdatesOnly = $policy.businessReadyUpdatesOnly
        $this.skipChecksBeforeRestart = $policy.skipChecksBeforeRestart
        $this.updateWeeks = $policy.updateWeeks
        $this.qualityUpdatesPauseStartDate = $policy.qualityUpdatesPauseStartDate
        $this.featureUpdatesPauseStartDate = $policy.featureUpdatesPauseStartDate
        $this.featureUpdatesRollbackWindowInDays = $policy.featureUpdatesRollbackWindowInDays
        $this.qualityUpdatesWillBeRolledBack = $policy.qualityUpdatesWillBeRolledBack
        $this.featureUpdatesWillBeRolledBack = $policy.featureUpdatesWillBeRolledBack
        $this.qualityUpdatesRollbackStartDateTime = $policy.qualityUpdatesRollbackStartDateTime
        $this.featureUpdatesRollbackStartDateTime = $policy.featureUpdatesRollbackStartDateTime
        $this.engagedRestartDeadlineInDays = $policy.engagedRestartDeadlineInDays
        $this.engagedRestartSnoozeScheduleInDays = $policy.engagedRestartSnoozeScheduleInDays
        $this.engagedRestartTransitionScheduleInDays = $policy.engagedRestartTransitionScheduleInDays
        $this.deadlineForFeatureUpdatesInDays = $policy.deadlineForFeatureUpdatesInDays
        $this.deadlineForQualityUpdatesInDays = $policy.deadlineForQualityUpdatesInDays
        $this.deadlineGracePeriodInDays = $policy.deadlineGracePeriodInDays
        $this.postponeRebootUntilAfterDeadline = $policy.postponeRebootUntilAfterDeadline
        $this.autoRestartNotificationDismissal = $policy.autoRestartNotificationDismissal
        $this.scheduleRestartWarningInHours = $policy.scheduleRestartWarningInHours
        $this.scheduleImminentRestartWarningInMinutes = $policy.scheduleImminentRestartWarningInMinutes
        $this.userPauseAccess = $policy.userPauseAccess
        $this.userWindowsUpdateScanAccess = $policy.userWindowsUpdateScanAccess
        $this.updateNotificationLevel = $policy.updateNotificationLevel
        $this.allowWindows11Upgrade = $policy.allowWindows11Upgrade
    }

    # Overriding the ToString method
    [string] ToString() {
        return "Class: GetEmWindowsUpdateForBusinessConfiguration"
    }
}