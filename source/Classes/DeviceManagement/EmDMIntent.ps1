<#
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceintent-devicemanagementintent?view=graph-rest-beta#json-representation
    {
        "@odata.type": "#microsoft.graph.deviceManagementIntent",
        "id": "String (identifier)",
        "displayName": "String",
        "description": "String",
        "isAssigned": true,
        "isMigratingToConfigurationPolicy": true,
        "lastModifiedDateTime": "String (timestamp)",
        "templateId": "String",
        "roleScopeTagIds": [
            "String"
        ]
    }
        # Endpoint Security Policy
        # Get-EndpointSecurityPolicy
#>
class EmDMIntent {
    [string]${@odata.type}
    [string]$id
    [string]$displayName
    [string]$description
    [bool]$isAssigned
    [bool]$isMigratingToConfigurationPolicy
    [string]$lastModifiedDateTime
    [string]$templateId
    [object[]]$roleScopeTagIds
    EmDMIntent ($policy) {
        $this."@odata.type" = $policy."@odata.type"
        $this.id = $policy.id
        $this.displayName = $policy.displayName
        $this.description = $policy.description
        $this.isAssigned = $policy.isAssigned
        $this.isMigratingToConfigurationPolicy = $policy.isMigratingToConfigurationPolicy
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.templateId = $policy.templateId
        $this.roleScopeTagIds = $policy.roleScopeTagIds
    }
}
