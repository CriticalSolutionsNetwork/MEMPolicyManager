<#
    # https://learn.microsoft.com/en-us/graph/api/intune-deviceintent-devicemanagementtemplate-createinstance?view=graph-rest-beta#request
    {
        "displayName": "Display Name value",
        "description": "Description value",
        "settingsDelta": [
            {
            "@odata.type": "#microsoft.graph.deviceManagementSettingInstance",
            "id": "d68168e1-68e1-d681-e168-81d6e16881d6",
            "definitionId": "Definition Id value",
            "valueJson": "Value Json value"
            }
        ],
        "roleScopeTagIds": [
            "Role Scope Tag Ids value"
        ]
    }
#>
class EmDManagementIntentInstanceCustom {
    [string]$displayName
    [string]$description
    [object[]]$roleScopeTagIds
    [string]$TemplateDisplayName
    [string]$TemplateId
    [object[]]$settingsDelta
    # Default constructor
    EmDManagementIntentInstanceCustom() {
        $this.displayName = ""
        $this.description = ""
        $this.roleScopeTagIds = @()
        $this.TemplateDisplayName = ""
        $this.TemplateId = ""
        $this.settingsDelta = @()

    }
    # Constructor with parameters
    EmDManagementIntentInstanceCustom ($policy) {
        $this.displayName = $policy.displayName
        $this.description = $policy.description
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.TemplateDisplayName = $Policy.TemplateDisplayName
        $this.TemplateId = $policy.templateId
        $this.settingsDelta = $policy.settingsDelta
    }
    # Overriding the ToString method
    [string] ToString() {
        return "Policy Name: $($this.displayName), Description: $($this.description)"
    }
}
