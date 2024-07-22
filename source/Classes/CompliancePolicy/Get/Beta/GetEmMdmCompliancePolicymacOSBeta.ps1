<#
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfig-macoscompliancepolicy?view=graph-rest-beta#json-representation
    {
        "@odata.type": "#microsoft.graph.macOSCompliancePolicy",
        "roleScopeTagIds": [
            "String"
        ],
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
        "osMinimumBuildVersion": "String",
        "osMaximumBuildVersion": "String",
        "systemIntegrityProtectionEnabled": true,
        "deviceThreatProtectionEnabled": true,
        "deviceThreatProtectionRequiredSecurityLevel": "String",
        "advancedThreatProtectionRequiredSecurityLevel": "String",
        "storageRequireEncryption": true,
        "gatekeeperAllowedAppSource": "String",
        "firewallEnabled": true,
        "firewallBlockAllIncoming": true,
        "firewallEnableStealthMode": true
    }
#>
class GetEmMdmCompliancePolicymacOSBeta {
    [string]${@odata.type}
    [object[]]$roleScopeTagIds
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
    [string]$osMinimumBuildVersion
    [string]$osMaximumBuildVersion
    [bool]$systemIntegrityProtectionEnabled
    [bool]$deviceThreatProtectionEnabled
    [string]$deviceThreatProtectionRequiredSecurityLevel
    [string]$advancedThreatProtectionRequiredSecurityLevel
    [bool]$storageRequireEncryption
    [string]$gatekeeperAllowedAppSource
    [bool]$firewallEnabled
    [bool]$firewallBlockAllIncoming
    [bool]$firewallEnableStealthMode

    GetEmMdmCompliancePolicymacOSBeta($policy) {
        $this."@odata.type" = "#microsoft.graph.macOSCompliancePolicy"
        $this.roleScopeTagIds = $policy.roleScopeTagIds
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
        $this.osMinimumBuildVersion = $policy.osMinimumBuildVersion
        $this.osMaximumBuildVersion = $policy.osMaximumBuildVersion
        $this.systemIntegrityProtectionEnabled = $policy.systemIntegrityProtectionEnabled
        $this.deviceThreatProtectionEnabled = $policy.deviceThreatProtectionEnabled
        $this.deviceThreatProtectionRequiredSecurityLevel = $policy.deviceThreatProtectionRequiredSecurityLevel
        $this.advancedThreatProtectionRequiredSecurityLevel = $policy.advancedThreatProtectionRequiredSecurityLevel
        $this.storageRequireEncryption = $policy.storageRequireEncryption
        $this.gatekeeperAllowedAppSource = $policy.gatekeeperAllowedAppSource
        $this.firewallEnabled = $policy.firewallEnabled
        $this.firewallBlockAllIncoming = $policy.firewallBlockAllIncoming
        $this.firewallEnableStealthMode = $policy.firewallEnableStealthMode
    }
}
