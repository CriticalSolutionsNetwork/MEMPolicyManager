class CreateEmMacOSCustomConfiguration {
  [string]${@odata.type}
    [string]$description
    [string]$displayName
    [object]$version
    [string]$payloadName
    [string]$payloadFileName
    [string]$payload
    [string]$deploymentChannel

  # Default constructor
  CreateEmMacOSCustomConfiguration() {
      $this."@odata.type" = ''
        $this.description = ''
        $this.displayName = ''
        $this.version = $null
        $this.payloadName = ''
        $this.payloadFileName = ''
        $this.payload = ''
        $this.deploymentChannel = ''
  }

  # Parameterized constructor
  CreateEmMacOSCustomConfiguration ($policy) {
      $this."@odata.type" = $policy."@odata.type"
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
      return "Class: CreateEmMacOSCustomConfiguration"
  }
}
