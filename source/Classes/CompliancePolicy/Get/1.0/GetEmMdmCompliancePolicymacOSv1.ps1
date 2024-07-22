<#
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfig-macoscompliancepolicy?view=graph-rest-1.0
    {
        "@odata.type": "#microsoft.graph.macOSCompliancePolicy",
        "id": "String (identifier)",
        "createdDateTime": "String (timestamp)",
        "description": "String",
        "lastModifiedDateTime": "String (timestamp)",
        "displayName": "String",
        "version": 1024,
        "passwordRequired": true,
        "passwordBlockSimple": true,
        "passwordExpirationDays": 1024,
        "passwordMinimumLength": 1024,
        "passwordMinutesOfInactivityBeforeLock": 1024,
        "passwordPreviousPasswordBlockCount": 1024,
        "passwordMinimumCharacterSetCount": 1024,
        "passwordRequiredType": "String",
        "osMinimumVersion": "String",
        "osMaximumVersion": "String",
        "systemIntegrityProtectionEnabled": true,
        "deviceThreatProtectionEnabled": true,
        "deviceThreatProtectionRequiredSecurityLevel": "String",
        "storageRequireEncryption": true,
        "firewallEnabled": true,
        "firewallBlockAllIncoming": true,
        "firewallEnableStealthMode": true
    }
#>
class GetEmMdmCompliancePolicymacOSv1 {
    [string]${@odata.type}
    [string]$id
    [datetime]$createdDateTime
    [string]$description
    [datetime]$lastModifiedDateTime
    [string]$displayName
    [int]$version
    [bool]$passwordRequired
    [bool]$passwordBlockSimple
    [int]$passwordExpirationDays
    [int]$passwordMinimumLength
    [int]$passwordMinutesOfInactivityBeforeLock
    [int]$passwordPreviousPasswordBlockCount
    [int]$passwordMinimumCharacterSetCount
    [string]$passwordRequiredType
    [string]$osMinimumVersion
    [string]$osMaximumVersion
    [bool]$systemIntegrityProtectionEnabled
    [bool]$deviceThreatProtectionEnabled
    [string]$deviceThreatProtectionRequiredSecurityLevel
    [bool]$storageRequireEncryption
    [bool]$firewallEnabled
    [bool]$firewallBlockAllIncoming
    [bool]$firewallEnableStealthMode

    GetEmMdmCompliancePolicymacOSv1 ($policy) {
        $this."@odata.type" = "#microsoft.graph.macOSCompliancePolicy"
        $this.id = $policy.id
        $this.createdDateTime = $policy.createdDateTime
        $this.description = $policy.description
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.passwordRequired = $policy.passwordRequired
        $this.passwordBlockSimple = $policy.passwordBlockSimple
        $this.passwordExpirationDays = $policy.passwordExpirationDays
        $this.passwordMinimumLength = $policy.passwordMinimumLength
        $this.passwordMinutesOfInactivityBeforeLock = $policy.passwordMinutesOfInactivityBeforeLock
        $this.passwordPreviousPasswordBlockCount = $policy.passwordPreviousPasswordBlockCount
        $this.passwordMinimumCharacterSetCount = $policy.passwordMinimumCharacterSetCount
        $this.passwordRequiredType = $policy.passwordRequiredType
        $this.osMinimumVersion = $policy.osMinimumVersion
        $this.osMaximumVersion = $policy.osMaximumVersion
        $this.systemIntegrityProtectionEnabled = $policy.systemIntegrityProtectionEnabled
        $this.deviceThreatProtectionEnabled = $policy.deviceThreatProtectionEnabled
        $this.deviceThreatProtectionRequiredSecurityLevel = $policy.deviceThreatProtectionRequiredSecurityLevel
        $this.storageRequireEncryption = $policy.storageRequireEncryption
        $this.firewallEnabled = $policy.firewallEnabled
        $this.firewallBlockAllIncoming = $policy.firewallBlockAllIncoming
        $this.firewallEnableStealthMode = $policy.firewallEnableStealthMode
    }
}
