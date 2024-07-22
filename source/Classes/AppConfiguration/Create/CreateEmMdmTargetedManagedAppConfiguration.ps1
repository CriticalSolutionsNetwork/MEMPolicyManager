class CreateEmMdmTargetedManagedAppConfiguration {
    [string]${@odata.type}
    [string]$displayName
    [string]$description
    [string]$version
    [object[]]$customSettings
    [object]$deployedAppCount
    [bool]$isAssigned
    [string]$targetedAppManagementLevels
    [string]$appGroupType

    # Default constructor
    CreateEmMdmTargetedManagedAppConfiguration() {
        $this."@odata.type" = ''
        $this.displayName = ''
        $this.description = ''
        $this.version = ''
        $this.customSettings = @()
        $this.deployedAppCount = $null
        $this.isAssigned = $false
        $this.targetedAppManagementLevels = ''
        $this.appGroupType = ''
    }

    # Parameterized constructor
    CreateEmMdmTargetedManagedAppConfiguration ($policy) {
        $this."@odata.type" = $policy."@odata.type"
        $this.displayName = $policy.displayName
        $this.description = $policy.description
        $this.version = $policy.version
        $this.customSettings = $policy.customSettings
        $this.deployedAppCount = $policy.deployedAppCount
        $this.isAssigned = $policy.isAssigned
        $this.targetedAppManagementLevels = $policy.targetedAppManagementLevels
        $this.appGroupType = $policy.appGroupType
    }

    # Overriding the ToString method
    [string] ToString() {
        return "Class: CreateEmMdmTargetedManagedAppConfiguration"
    }
}