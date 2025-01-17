class GetEmMdmTargetedManagedAppConfiguration {
  [string]${@odata.type}
    [string]$displayName
    [string]$description
    [datetime]$createdDateTime
    [datetime]$lastModifiedDateTime
    [object[]]$roleScopeTagIds
    [string]$id
    [string]$version
    [object[]]$customSettings
    [object]$deployedAppCount
    [bool]$isAssigned
    [string]$targetedAppManagementLevels
    [string]$appGroupType

  # Default constructor
  GetEmMdmTargetedManagedAppConfiguration() {
      $this."@odata.type" = ''
        $this.displayName = ''
        $this.description = ''
        $this.createdDateTime = [datetime]::MinValue
        $this.lastModifiedDateTime = [datetime]::MinValue
        $this.roleScopeTagIds = @()
        $this.id = ''
        $this.version = ''
        $this.customSettings = @()
        $this.deployedAppCount = $null
        $this.isAssigned = $false
        $this.targetedAppManagementLevels = ''
        $this.appGroupType = ''
  }

  # Parameterized constructor
  GetEmMdmTargetedManagedAppConfiguration ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.displayName = $policy.displayName
        $this.description = $policy.description
        $this.createdDateTime = $policy.createdDateTime
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.id = $policy.id
        $this.version = $policy.version
        $this.customSettings = $policy.customSettings
        $this.deployedAppCount = $policy.deployedAppCount
        $this.isAssigned = $policy.isAssigned
        $this.targetedAppManagementLevels = $policy.targetedAppManagementLevels
        $this.appGroupType = $policy.appGroupType
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: GetEmMdmTargetedManagedAppConfiguration"
  }
}
