<#
        # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfig-windows10compliancepolicy?view=graph-rest-beta#json-representation
        {
            "@odata.type": "#microsoft.graph.windows10CompliancePolicy",
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
            "memoryIntegrityEnabled": true,
            "kernelDmaProtectionEnabled": true,
            "virtualizationBasedSecurityEnabled": true,
            "firmwareProtectionEnabled": true,
            "storageRequireEncryption": true,
            "activeFirewallRequired": true,
            "defenderEnabled": true,
            "defenderVersion": "String",
            "signatureOutOfDate": true,
            "rtpEnabled": true,
            "antivirusRequired": true,
            "antiSpywareRequired": true,
            "validOperatingSystemBuildRanges": [
                {
                "@odata.type": "microsoft.graph.operatingSystemVersionRange",
                "description": "String",
                "lowestVersion": "String",
                "highestVersion": "String"
                }
            ],
            "deviceThreatProtectionEnabled": true,
            "deviceThreatProtectionRequiredSecurityLevel": "String",
            "configurationManagerComplianceRequired": true,
            "tpmRequired": true,
            "deviceCompliancePolicyScript": {
                "@odata.type": "microsoft.graph.deviceCompliancePolicyScript",
                "deviceComplianceScriptId": "String",
                "rulesContent": "binary"
            }
        }
    #>
class GetEmMdmCompliancePolicyWindows10Beta {
    [string]${@odata.type}
    [string[]]$roleScopeTagIds
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
    [bool]$memoryIntegrityEnabled
    [bool]$kernelDmaProtectionEnabled
    [bool]$virtualizationBasedSecurityEnabled
    [bool]$firmwareProtectionEnabled
    [bool]$activeFirewallRequired
    [bool]$defenderEnabled
    [string]$defenderVersion
    [bool]$signatureOutOfDate
    [bool]$rtpEnabled
    [bool]$antivirusRequired
    [bool]$antiSpywareRequired
    [object[]]$validOperatingSystemBuildRanges
    [bool]$deviceThreatProtectionEnabled
    [string]$deviceThreatProtectionRequiredSecurityLevel
    [bool]$configurationManagerComplianceRequired
    [bool]$tpmRequired
    [psobject]$deviceCompliancePolicyScript

    GetEmMdmCompliancePolicyWindows10Beta ($policy) {
        $this."@odata.type" = $policy."@odata.type"
        $this.roleScopeTagIds = $policy.roleScopeTagIds
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
        $this.memoryIntegrityEnabled = $policy.memoryIntegrityEnabled
        $this.kernelDmaProtectionEnabled = $policy.kernelDmaProtectionEnabled
        $this.virtualizationBasedSecurityEnabled = $policy.virtualizationBasedSecurityEnabled
        $this.firmwareProtectionEnabled = $policy.firmwareProtectionEnabled
        $this.activeFirewallRequired = $policy.activeFirewallRequired
        $this.defenderEnabled = $policy.defenderEnabled
        $this.defenderVersion = $policy.defenderVersion
        $this.signatureOutOfDate = $policy.signatureOutOfDate
        $this.rtpEnabled = $policy.rtpEnabled
        $this.antivirusRequired = $policy.antivirusRequired
        $this.antiSpywareRequired = $policy.antiSpywareRequired
        $this.validOperatingSystemBuildRanges = $policy.validOperatingSystemBuildRanges
        $this.deviceThreatProtectionEnabled = $policy.deviceThreatProtectionEnabled
        $this.deviceThreatProtectionRequiredSecurityLevel = $policy.deviceThreatProtectionRequiredSecurityLevel
        $this.configurationManagerComplianceRequired = $policy.configurationManagerComplianceRequired
        $this.tpmRequired = $policy.tpmRequired
        $this.deviceCompliancePolicyScript = $policy.deviceCompliancePolicyScript
    }
}
