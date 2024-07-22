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
class EmDMIntentInstance {
    [string]$displayName
    [string]$description
    [object[]]$roleScopeTagIds
    [object[]]$settingsDelta

    # Default constructor
    EmDMIntentInstance() {
        $this.displayName = ''
        $this.description = ''
        $this.roleScopeTagIds = @()
        $this.settingsDelta = @()

    }
    # Parameterized constructor
    EmDMIntentInstance ($policy) {
        $this.displayName = $policy.displayName
        $this.description = $policy.description
        $this.roleScopeTagIds = $policy.roleScopeTagIds
        $this.settingsDelta = $policy.settingsDelta

    }
    # Overriding the ToString method
    [string] ToString() {
        return "Class: EmDMIntentInstance"
    }
}
