    <#
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfig-androidcompliancepolicy?view=graph-rest-1.0#json-representation
        {
            "@odata.type": "#microsoft.graph.androidCompliancePolicy",
            "id": "String (identifier)",
            "createdDateTime": "String (timestamp)",
            "description": "String",
            "lastModifiedDateTime": "String (timestamp)",
            "displayName": "String",
            "version": 1024,
            "passwordRequired": true,
            "passwordMinimumLength": 1024,
            "passwordRequiredType": "String",
            "passwordMinutesOfInactivityBeforeLock": 1024,
            "passwordExpirationDays": 1024,
            "passwordPreviousPasswordBlockCount": 1024,
            "securityPreventInstallAppsFromUnknownSources": true,
            "securityDisableUsbDebugging": true,
            "securityRequireVerifyApps": true,
            "deviceThreatProtectionEnabled": true,
            "deviceThreatProtectionRequiredSecurityLevel": "String",
            "securityBlockJailbrokenDevices": true,
            "osMinimumVersion": "String",
            "osMaximumVersion": "String",
            "minAndroidSecurityPatchLevel": "String",
            "storageRequireEncryption": true,
            "securityRequireSafetyNetAttestationBasicIntegrity": true,
            "securityRequireSafetyNetAttestationCertifiedDevice": true,
            "securityRequireGooglePlayServices": true,
            "securityRequireUpToDateSecurityProviders": true,
            "securityRequireCompanyPortalAppIntegrity": true
        }
    #>
class GetEmMdmCompliancePolicyAndroidv1 {
    [string]${@odata.type}
    [string]$id
    [datetime]$createdDateTime
    [string]$description
    [datetime]$lastModifiedDateTime
    [string]$displayName
    [int]$version
    [bool]$passwordRequired
    [int]$passwordMinimumLength
    [string]$passwordRequiredType
    [int]$passwordMinutesOfInactivityBeforeLock
    [int]$passwordExpirationDays
    [int]$passwordPreviousPasswordBlockCount
    [bool]$securityPreventInstallAppsFromUnknownSources
    [bool]$securityDisableUsbDebugging
    [bool]$securityRequireVerifyApps
    [bool]$deviceThreatProtectionEnabled
    [string]$deviceThreatProtectionRequiredSecurityLevel
    [bool]$securityBlockJailbrokenDevices
    [string]$osMinimumVersion
    [string]$osMaximumVersion
    [string]$minAndroidSecurityPatchLevel
    [bool]$storageRequireEncryption
    [bool]$securityRequireSafetyNetAttestationBasicIntegrity
    [bool]$securityRequireSafetyNetAttestationCertifiedDevice
    [bool]$securityRequireGooglePlayServices
    [bool]$securityRequireUpToDateSecurityProviders
    [bool]$securityRequireCompanyPortalAppIntegrity

    GetEmMdmCompliancePolicyAndroidv1 ($policy) {
        $this."@odata.type" = "#microsoft.graph.androidCompliancePolicy"
        $this.id = $policy.id
        $this.createdDateTime = $policy.createdDateTime
        $this.description = $policy.description
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.passwordRequired = $policy.passwordRequired
        $this.passwordMinimumLength = $policy.passwordMinimumLength
        $this.passwordRequiredType = $policy.passwordRequiredType
        $this.passwordMinutesOfInactivityBeforeLock = $policy.passwordMinutesOfInactivityBeforeLock
        $this.passwordExpirationDays = $policy.passwordExpirationDays
        $this.passwordPreviousPasswordBlockCount = $policy.passwordPreviousPasswordBlockCount
        $this.securityPreventInstallAppsFromUnknownSources = $policy.securityPreventInstallAppsFromUnknownSources
        $this.securityDisableUsbDebugging = $policy.securityDisableUsbDebugging
        $this.securityRequireVerifyApps = $policy.securityRequireVerifyApps
        $this.deviceThreatProtectionEnabled = $policy.deviceThreatProtectionEnabled
        $this.deviceThreatProtectionRequiredSecurityLevel = $policy.deviceThreatProtectionRequiredSecurityLevel
        $this.securityBlockJailbrokenDevices = $policy.securityBlockJailbrokenDevices
        $this.osMinimumVersion = $policy.osMinimumVersion
        $this.osMaximumVersion = $policy.osMaximumVersion
        $this.minAndroidSecurityPatchLevel = $policy.minAndroidSecurityPatchLevel
        $this.storageRequireEncryption = $policy.storageRequireEncryption
        $this.securityRequireSafetyNetAttestationBasicIntegrity = $policy.securityRequireSafetyNetAttestationBasicIntegrity
        $this.securityRequireSafetyNetAttestationCertifiedDevice = $policy.securityRequireSafetyNetAttestationCertifiedDevice
        $this.securityRequireGooglePlayServices = $policy.securityRequireGooglePlayServices
        $this.securityRequireUpToDateSecurityProviders = $policy.securityRequireUpToDateSecurityProviders
        $this.securityRequireCompanyPortalAppIntegrity = $policy.securityRequireCompanyPortalAppIntegrity
    }
}
