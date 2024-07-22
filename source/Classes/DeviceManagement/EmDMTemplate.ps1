<#
    # https://learn.microsoft.com/en-us/graph/api/intune-deviceintent-devicemanagementtemplate-create?view=graph-rest-beta#request
        {
            "@odata.type": "#microsoft.graph.deviceManagementTemplate",
            "id": "edd764ca-64ca-edd7-ca64-d7edca64d7ed",
            "displayName": "Display Name value",
            "description": "Description value",
            "versionInfo": "Version Info value",
            "isDeprecated": true,
            "intentCount": 11,
            "templateType": "specializedDevices",
            "platformType": "androidForWork",
            "templateSubtype": "firewall",
            "publishedDateTime": "2016-12-31T23:58:16.1180489-08:00"
        }
        # EmDeviceEndpointSecurityTemplate
        # Get-EmEndpointSecurityTemplate
#>
class EmDMTemplate {
    [string]${@odata.type}
    [string]$id
    [string]$displayName
    [string]$description
    [string]$versionInfo
    [bool]$isDeprecated
    [object]$intentCount
    [string]$templateType
    [string]$platformType
    [string]$templateSubtype
    [datetime]$publishedDateTime
    EmDMTemplate ($policy) {
        $this."@odata.type" = $policy."@odata.type"
        $this.id = $policy.id
        $this.displayName = $policy.displayName
        $this.description = $policy.description
        $this.versionInfo = $policy.versionInfo
        $this.isDeprecated = $policy.isDeprecated
        $this.intentCount = $policy.intentCount
        $this.templateType = $policy.templateType
        $this.platformType = $policy.platformType
        $this.templateSubtype = $policy.templateSubtype
        $this.publishedDateTime = $policy.publishedDateTime
    }
}
