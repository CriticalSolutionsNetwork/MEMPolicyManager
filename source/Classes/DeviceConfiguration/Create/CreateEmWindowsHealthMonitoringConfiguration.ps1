class CreateEmWindowsHealthMonitoringConfiguration {
  [string]${@odata.type}
    [string]$description
    [string]$displayName
    [object]$version
    [string]$allowDeviceHealthMonitoring
    [string]$configDeviceHealthMonitoringScope
    [string]$configDeviceHealthMonitoringCustomScope

  # Default constructor
  CreateEmWindowsHealthMonitoringConfiguration() {
      $this."@odata.type" = ''
        $this.description = ''
        $this.displayName = ''
        $this.version = $null
        $this.allowDeviceHealthMonitoring = ''
        $this.configDeviceHealthMonitoringScope = ''
        $this.configDeviceHealthMonitoringCustomScope = ''
  }

  # Parameterized constructor
  CreateEmWindowsHealthMonitoringConfiguration ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.description = $policy.description
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.allowDeviceHealthMonitoring = $policy.allowDeviceHealthMonitoring
        $this.configDeviceHealthMonitoringScope = $policy.configDeviceHealthMonitoringScope
        $this.configDeviceHealthMonitoringCustomScope = $policy.configDeviceHealthMonitoringCustomScope
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: CreateEmWindowsHealthMonitoringConfiguration"
  }
}
