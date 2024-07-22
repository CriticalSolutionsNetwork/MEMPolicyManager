    <#
        # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfig-ioscompliancepolicy?view=graph-rest-beta#json-representation
        {
            "@odata.type": "#microsoft.graph.iosCompliancePolicy",
            "roleScopeTagIds": [
                "String"
            ],
            "id": "String (identifier)",
            "createdDateTime": "String (timestamp)",
            "description": "String",
            "lastModifiedDateTime": "String (timestamp)",
            "displayName": "String",
            "version": 1024,
            "passcodeBlockSimple": true,
            "passcodeExpirationDays": 1024,
            "passcodeMinimumLength": 1024,
            "passcodeMinutesOfInactivityBeforeLock": 1024,
            "passcodeMinutesOfInactivityBeforeScreenTimeout": 1024,
            "passcodePreviousPasscodeBlockCount": 1024,
            "passcodeMinimumCharacterSetCount": 1024,
            "passcodeRequiredType": "String",
            "passcodeRequired": true,
            "osMinimumVersion": "String",
            "osMaximumVersion": "String",
            "osMinimumBuildVersion": "String",
            "osMaximumBuildVersion": "String",
            "securityBlockJailbrokenDevices": true,
            "deviceThreatProtectionEnabled": true,
            "deviceThreatProtectionRequiredSecurityLevel": "String",
            "advancedThreatProtectionRequiredSecurityLevel": "String",
            "managedEmailProfileRequired": true,
            "restrictedApps": [
                {
                "@odata.type": "microsoft.graph.appListItem",
                "name": "String",
                "publisher": "String",
                "appStoreUrl": "String",
                "appId": "String"
                }
            ]
        }
    #>
class GetEmMdmCompliancePolicyiOSBeta {
    [string]${@odata.type}
    [object[]]$roleScopeTagIds
    [string]$id
    [datetime]$createdDateTime
    [string]$description
    [datetime]$lastModifiedDateTime
    [string]$displayName
    [int]$version
    [bool]$passcodeBlockSimple
    [int]$passcodeExpirationDays
    [int]$passcodeMinimumLength
    [int]$passcodeMinutesOfInactivityBeforeLock
    [int]$passcodeMinutesOfInactivityBeforeScreenTimeout
    [int]$passcodePreviousPasscodeBlockCount
    [int]$passcodeMinimumCharacterSetCount
    [string]$passcodeRequiredType
    [bool]$passcodeRequired
    [string]$osMinimumVersion
    [string]$osMaximumVersion
    [string]$osMinimumBuildVersion
    [string]$osMaximumBuildVersion
    [bool]$securityBlockJailbrokenDevices
    [bool]$deviceThreatProtectionEnabled
    [string]$deviceThreatProtectionRequiredSecurityLevel
    [string]$advancedThreatProtectionRequiredSecurityLevel
    [bool]$managedEmailProfileRequired
    [object[]]$restrictedApps

    GetEmMdmCompliancePolicyiOSBeta($policy) {
        $this."@odata.type" = "#microsoft.graph.iosCompliancePolicy"
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.id = $policy.id
        $this.createdDateTime = $policy.createdDateTime
        $this.description = $policy.description
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.passcodeBlockSimple = $policy.passcodeBlockSimple
        $this.passcodeExpirationDays = $policy.passcodeExpirationDays
        $this.passcodeMinimumLength = $policy.passcodeMinimumLength
        $this.passcodeMinutesOfInactivityBeforeLock = $policy.passcodeMinutesOfInactivityBeforeLock
        $this.passcodeMinutesOfInactivityBeforeScreenTimeout = $policy.passcodeMinutesOfInactivityBeforeScreenTimeout
        $this.passcodePreviousPasscodeBlockCount = $policy.passcodePreviousPasscodeBlockCount
        $this.passcodeMinimumCharacterSetCount = $policy.passcodeMinimumCharacterSetCount
        $this.passcodeRequiredType = $policy.passcodeRequiredType
        $this.passcodeRequired = $policy.passcodeRequired
        $this.osMinimumVersion = $policy.osMinimumVersion
        $this.osMaximumVersion = $policy.osMaximumVersion
        $this.osMinimumBuildVersion = $policy.osMinimumBuildVersion
        $this.osMaximumBuildVersion = $policy.osMaximumBuildVersion
        $this.securityBlockJailbrokenDevices = $policy.securityBlockJailbrokenDevices
        $this.deviceThreatProtectionEnabled = $policy.deviceThreatProtectionEnabled
        $this.deviceThreatProtectionRequiredSecurityLevel = $policy.deviceThreatProtectionRequiredSecurityLevel
        $this.advancedThreatProtectionRequiredSecurityLevel = $policy.advancedThreatProtectionRequiredSecurityLevel
        $this.managedEmailProfileRequired = $policy.managedEmailProfileRequired
        $this.restrictedApps = $policy.restrictedApps
    }
}
