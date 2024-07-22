class CreateEmMacOSExtensionsConfiguration {
  [string]${@odata.type}
    [string]$description
    [string]$displayName
    [object]$version
    [bool]$kernelExtensionOverridesAllowed
    [object[]]$kernelExtensionAllowedTeamIdentifiers
    [object[]]$kernelExtensionsAllowed
    [bool]$systemExtensionsBlockOverride
    [object[]]$systemExtensionsAllowedTeamIdentifiers
    [object[]]$systemExtensionsAllowed
    [object[]]$systemExtensionsAllowedTypes

  # Default constructor
  CreateEmMacOSExtensionsConfiguration() {
      $this."@odata.type" = ''
        $this.description = ''
        $this.displayName = ''
        $this.version = $null
        $this.kernelExtensionOverridesAllowed = $false
        $this.kernelExtensionAllowedTeamIdentifiers = @()
        $this.kernelExtensionsAllowed = @()
        $this.systemExtensionsBlockOverride = $false
        $this.systemExtensionsAllowedTeamIdentifiers = @()
        $this.systemExtensionsAllowed = @()
        $this.systemExtensionsAllowedTypes = @()
  }

  # Parameterized constructor
  CreateEmMacOSExtensionsConfiguration ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.description = $policy.description
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.kernelExtensionOverridesAllowed = $policy.kernelExtensionOverridesAllowed
        $this.kernelExtensionAllowedTeamIdentifiers = $policy.kernelExtensionAllowedTeamIdentifiers
        $this.kernelExtensionsAllowed = $policy.kernelExtensionsAllowed
        $this.systemExtensionsBlockOverride = $policy.systemExtensionsBlockOverride
        $this.systemExtensionsAllowedTeamIdentifiers = $policy.systemExtensionsAllowedTeamIdentifiers
        $this.systemExtensionsAllowed = $policy.systemExtensionsAllowed
        $this.systemExtensionsAllowedTypes = $policy.systemExtensionsAllowedTypes
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: CreateEmMacOSExtensionsConfiguration"
  }
}
