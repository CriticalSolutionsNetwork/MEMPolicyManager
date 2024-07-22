class CreateEmIosUpdateConfiguration {
    [string]${@odata.type}
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
    CreateEmIosUpdateConfiguration() {
        $this."@odata.type" = ''
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
    CreateEmIosUpdateConfiguration ($policy) {
        $this."@odata.type" = $policy."@odata.type"
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
        return "Class: CreateEmIosUpdateConfiguration"
    }
}