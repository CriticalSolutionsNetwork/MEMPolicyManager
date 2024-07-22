<#
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfig-windows10compliancepolicy?view=graph-rest-1.0
    {
        "@odata.type": "#microsoft.graph.windows10CompliancePolicy",
        "id": "String (identifier)",
        "createdDateTime": "String (timestamp)",
        "description": "String",
        "lastModifiedDateTime": "String (timestamp)",
        "displayName": "String",
        "version": 1024,
        "passwordRequired": true,
        "passwordBlockSimple": true,
        "passwordRequiredToUnlockFromIdle": true,
        "passwordMinutesOfInactivityBeforeLock": 1024,
        "passwordExpirationDays": 1024,
        "passwordMinimumLength": 1024,
        "passwordMinimumCharacterSetCount": 1024,
        "passwordRequiredType": "String",
        "passwordPreviousPasswordBlockCount": 1024,
        "requireHealthyDeviceReport": true,
        "osMinimumVersion": "String",
        "osMaximumVersion": "String",
        "mobileOsMinimumVersion": "String",
        "mobileOsMaximumVersion": "String",
        "earlyLaunchAntiMalwareDriverEnabled": true,
        "bitLockerEnabled": true,
        "secureBootEnabled": true,
        "codeIntegrityEnabled": true,
        "storageRequireEncryption": true
    }
#>
class GetEmMdmCompliancePolicyWindows10v1 {
    [string]${@odata.type}
    [string]$id
    [datetime]$createdDateTime
    [string]$description
    [datetime]$lastModifiedDateTime
    [string]$displayName
    [int]$version
    [bool]$passwordRequired
    [bool]$passwordBlockSimple
    [bool]$passwordRequiredToUnlockFromIdle
    [int]$passwordMinutesOfInactivityBeforeLock
    [int]$passwordExpirationDays
    [int]$passwordMinimumLength
    [int]$passwordMinimumCharacterSetCount
    [string]$passwordRequiredType
    [int]$passwordPreviousPasswordBlockCount
    [bool]$requireHealthyDeviceReport
    [string]$osMinimumVersion
    [string]$osMaximumVersion
    [string]$mobileOsMinimumVersion
    [string]$mobileOsMaximumVersion
    [bool]$earlyLaunchAntiMalwareDriverEnabled
    [bool]$bitLockerEnabled
    [bool]$secureBootEnabled
    [bool]$codeIntegrityEnabled
    [bool]$storageRequireEncryption

    GetEmMdmCompliancePolicyWindows10v1 ($policy) {
        $this."@odata.type" = "#microsoft.graph.windows10CompliancePolicy"
        $this.id = $policy.id
        $this.createdDateTime = $policy.createdDateTime
        $this.description = $policy.description
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.passwordRequired = $policy.passwordRequired
        $this.passwordBlockSimple = $policy.passwordBlockSimple
        $this.passwordRequiredToUnlockFromIdle = $policy.passwordRequiredToUnlockFromIdle
        $this.passwordMinutesOfInactivityBeforeLock = $policy.passwordMinutesOfInactivityBeforeLock
        $this.passwordExpirationDays = $policy.passwordExpirationDays
        $this.passwordMinimumLength = $policy.passwordMinimumLength
        $this.passwordMinimumCharacterSetCount = $policy.passwordMinimumCharacterSetCount
        $this.passwordRequiredType = $policy.passwordRequiredType
        $this.passwordPreviousPasswordBlockCount = $policy.passwordPreviousPasswordBlockCount
        $this.requireHealthyDeviceReport = $policy.requireHealthyDeviceReport
        $this.osMinimumVersion = $policy.osMinimumVersion
        $this.osMaximumVersion = $policy.osMaximumVersion
        $this.mobileOsMinimumVersion = $policy.mobileOsMinimumVersion
        $this.mobileOsMaximumVersion = $policy.mobileOsMaximumVersion
        $this.earlyLaunchAntiMalwareDriverEnabled = $policy.earlyLaunchAntiMalwareDriverEnabled
        $this.bitLockerEnabled = $policy.bitLockerEnabled
        $this.secureBootEnabled = $policy.secureBootEnabled
        $this.codeIntegrityEnabled = $policy.codeIntegrityEnabled
        $this.storageRequireEncryption = $policy.storageRequireEncryption
    }
}
