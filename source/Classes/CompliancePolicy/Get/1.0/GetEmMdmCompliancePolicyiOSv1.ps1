    <#
        # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfig-ioscompliancepolicy?view=graph-rest-1.0#json-representation
        {
            "@odata.type": "#microsoft.graph.iosCompliancePolicy",
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
            "passcodePreviousPasscodeBlockCount": 1024,
            "passcodeMinimumCharacterSetCount": 1024,
            "passcodeRequiredType": "String",
            "passcodeRequired": true,
            "osMinimumVersion": "String",
            "osMaximumVersion": "String",
            "securityBlockJailbrokenDevices": true,
            "deviceThreatProtectionEnabled": true,
            "deviceThreatProtectionRequiredSecurityLevel": "String",
            "managedEmailProfileRequired": true
        }
    #>
class GetEmMdmCompliancePolicyiOSv1 {
    [string]${@odata.type}
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
    [int]$passcodePreviousPasscodeBlockCount
    [int]$passcodeMinimumCharacterSetCount
    [string]$passcodeRequiredType
    [bool]$passcodeRequired
    [string]$osMinimumVersion
    [string]$osMaximumVersion
    [bool]$securityBlockJailbrokenDevices
    [bool]$deviceThreatProtectionEnabled
    [string]$deviceThreatProtectionRequiredSecurityLevel
    [bool]$managedEmailProfileRequired

    GetEmMdmCompliancePolicyiOSv1 ($policy) {
        $this."@odata.type" = "#microsoft.graph.iosCompliancePolicy"
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
        $this.passcodePreviousPasscodeBlockCount = $policy.passcodePreviousPasscodeBlockCount
        $this.passcodeMinimumCharacterSetCount = $policy.passcodeMinimumCharacterSetCount
        $this.passcodeRequiredType = $policy.passcodeRequiredType
        $this.passcodeRequired = $policy.passcodeRequired
        $this.osMinimumVersion = $policy.osMinimumVersion
        $this.osMaximumVersion = $policy.osMaximumVersion
        $this.securityBlockJailbrokenDevices = $policy.securityBlockJailbrokenDevices
        $this.deviceThreatProtectionEnabled = $policy.deviceThreatProtectionEnabled
        $this.deviceThreatProtectionRequiredSecurityLevel = $policy.deviceThreatProtectionRequiredSecurityLevel
        $this.managedEmailProfileRequired = $policy.managedEmailProfileRequired
    }
}
