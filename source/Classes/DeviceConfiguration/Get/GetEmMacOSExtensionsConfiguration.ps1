class GetEmMacOSExtensionsConfiguration {
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
    [bool]$kernelExtensionOverridesAllowed
    [object[]]$kernelExtensionAllowedTeamIdentifiers
    [object[]]$kernelExtensionsAllowed
    [bool]$systemExtensionsBlockOverride
    [object[]]$systemExtensionsAllowedTeamIdentifiers
    [object[]]$systemExtensionsAllowed
    [object[]]$systemExtensionsAllowedTypes

  # Default constructor
  GetEmMacOSExtensionsConfiguration() {
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
        $this.kernelExtensionOverridesAllowed = $false
        $this.kernelExtensionAllowedTeamIdentifiers = @()
        $this.kernelExtensionsAllowed = @()
        $this.systemExtensionsBlockOverride = $false
        $this.systemExtensionsAllowedTeamIdentifiers = @()
        $this.systemExtensionsAllowed = @()
        $this.systemExtensionsAllowedTypes = @()
  }

  # Parameterized constructor
  GetEmMacOSExtensionsConfiguration ($policy) {
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
      return "Class: GetEmMacOSExtensionsConfiguration"
  }
}
