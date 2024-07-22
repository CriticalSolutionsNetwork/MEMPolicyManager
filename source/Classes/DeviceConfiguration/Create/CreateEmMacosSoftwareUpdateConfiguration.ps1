class CreateEmMacOSSoftwareUpdateConfiguration {
  [string]${@odata.type}
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
  CreateEmMacOSSoftwareUpdateConfiguration() {
      $this."@odata.type" = ''
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
  CreateEmMacOSSoftwareUpdateConfiguration ($policy) {
      $this."@odata.type" = $policy."@odata.type"
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
      return "Class: CreateEmMacOSSoftwareUpdateConfiguration"
  }
}
