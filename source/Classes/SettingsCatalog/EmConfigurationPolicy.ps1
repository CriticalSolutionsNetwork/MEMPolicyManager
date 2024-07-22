<#
    # https://learn.microsoft.com/en-us/graph/api/intune-deviceconfigv2-devicemanagementconfigurationpolicy-create?view=graph-rest-beta#response-1
    # Omitting "@odata.type"
    {
        "@odata.type": "#microsoft.graph.deviceManagementConfigurationPolicy",
        "id": "3ffd7cd0-7cd0-3ffd-d07c-fd3fd07cfd3f",
        "name": "Name value",
        "description": "Description value",
        "platforms": "android",
        "technologies": "mdm",
        "createdDateTime": "2017-01-01T00:02:43.5775965-08:00",
        "lastModifiedDateTime": "2017-01-01T00:00:35.1329464-08:00",
        "settingCount": 12,
        "creationSource": "Creation Source value",
        "roleScopeTagIds": [
            "Role Scope Tag Ids value"
        ],
        "isAssigned": true,
        "templateReference": {
            "@odata.type": "microsoft.graph.deviceManagementConfigurationPolicyTemplateReference",
            "templateId": "Template Id value",
            "templateFamily": "endpointSecurityAntivirus",
            "templateDisplayName": "Template Display Name value",
            "templateDisplayVersion": "Template Display Version value"
        },
        "priorityMetaData": {
            "@odata.type": "microsoft.graph.deviceManagementPriorityMetaData",
            "priority": 8
        }
    }
#>
class EmConfigurationPolicy {
    [string]$id
    [string]$name
    [string]$description
    [string]$platforms
    [string]$technologies
    [datetime]$createdDateTime
    [datetime]$lastModifiedDateTime
    [object]$settingCount
    [string]$creationSource
    [object[]]$roleScopeTagIds
    [psobject]$templateReference
    [psobject]$priorityMetaData
    # Default constructor
    EmConfigurationPolicy() {
        $this.id = ''
        $this.name = ''
        $this.description = ''
        $this.platforms = ''
        $this.technologies = ''
        $this.createdDateTime = [datetime]::MinValue
        $this.lastModifiedDateTime = [datetime]::MinValue
        $this.settingCount = $null
        $this.creationSource = ''
        $this.roleScopeTagIds = @()
        $this.templateReference = $null
        $this.priorityMetaData = $null
    }
    # Parameterized constructor
    EmConfigurationPolicy ($policy) {
        $this.id = $policy.id
        $this.name = $policy.name
        $this.description = $policy.description
        $this.platforms = $policy.platforms
        $this.technologies = $policy.technologies
        $this.createdDateTime = $policy.createdDateTime
        $this.lastModifiedDateTime = $policy.lastModifiedDateTime
        $this.settingCount = $policy.settingCount
        $this.creationSource = $policy.creationSource
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.templateReference = $policy.templateReference
        $this.priorityMetaData = $policy.priorityMetaData
    }
    # Overriding the ToString method
    [string] ToString() {
        return "Class: EmConfigurationPolicy"
    }
}