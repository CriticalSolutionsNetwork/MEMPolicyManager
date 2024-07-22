class GetEmMdmAospDeviceOwnerCompliancePolicy {
    [string]${@odata.type}
    [object[]]$roleScopeTagIds
    [string]$id
    [datetime]$createdDateTime
    [string]$description
    [datetime]$lastModifiedDateTime
    [string]$displayName
    [object]$version
    [string]$osMinimumVersion
    [string]$osMaximumVersion
    [string]$minAndroidSecurityPatchLevel
    [bool]$securityBlockJailbrokenDevices
    [bool]$passwordRequired
    [string]$passwordRequiredType
    [object]$passwordMinutesOfInactivityBeforeLock
    [object]$passwordMinimumLength
    [bool]$storageRequireEncryption

    # Default constructor
    GetEmMdmAospDeviceOwnerCompliancePolicy() {
        $this."@odata.type" = ''
        $this.roleScopeTagIds = @()
        $this.id = ''
        $this.createdDateTime = [datetime]::MinValue
        $this.description = ''
        $this.lastModifiedDateTime = [datetime]::MinValue
        $this.displayName = ''
        $this.version = $null
        $this.osMinimumVersion = ''
        $this.osMaximumVersion = ''
        $this.minAndroidSecurityPatchLevel = ''
        $this.securityBlockJailbrokenDevices = $false
        $this.passwordRequired = $false
        $this.passwordRequiredType = ''
        $this.passwordMinutesOfInactivityBeforeLock = $null
        $this.passwordMinimumLength = $null
        $this.storageRequireEncryption = $false
    }

    # Parameterized constructor
    GetEmMdmAospDeviceOwnerCompliancePolicy ($policy) {
        $this."@odata.type" = $policy."@odata.type"
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.id = $policy.id
        $this.createdDateTime = $policy.createdDateTime
        $this.description = $policy.description
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.osMinimumVersion = $policy.osMinimumVersion
        $this.osMaximumVersion = $policy.osMaximumVersion
        $this.minAndroidSecurityPatchLevel = $policy.minAndroidSecurityPatchLevel
        $this.securityBlockJailbrokenDevices = $policy.securityBlockJailbrokenDevices
        $this.passwordRequired = $policy.passwordRequired
        $this.passwordRequiredType = $policy.passwordRequiredType
        $this.passwordMinutesOfInactivityBeforeLock = $policy.passwordMinutesOfInactivityBeforeLock
        $this.passwordMinimumLength = $policy.passwordMinimumLength
        $this.storageRequireEncryption = $policy.storageRequireEncryption
    }

    # Overriding the ToString method
    [string] ToString() {
        return "Class: GetEmMdmAospDeviceOwnerCompliancePolicy"
    }
}