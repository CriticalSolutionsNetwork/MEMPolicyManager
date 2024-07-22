class CreateEmWindows10CustomConfiguration {
  [string]${@odata.type}
    [string]$description
    [string]$displayName
    [object]$version
    [object[]]$omaSettings

  # Default constructor
  CreateEmWindows10CustomConfiguration() {
      $this."@odata.type" = ''
        $this.description = ''
        $this.displayName = ''
        $this.version = $null
        $this.omaSettings = @()
  }

  # Parameterized constructor
  CreateEmWindows10CustomConfiguration ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.description = $policy.description
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.omaSettings = $policy.omaSettings
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: CreateEmWindows10CustomConfiguration"
  }
}
