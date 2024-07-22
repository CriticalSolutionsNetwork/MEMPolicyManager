<#
    #
    {
        "@odata.type": "#microsoft.graph.deviceManagementBooleanSettingInstance",
        "id": "String (identifier)",
        "definitionId": "String",
        "valueJson": "String",
        "value": true
    }
#>


class EmDMBooleanSettingInstance {
    [string]${@odata.type}
    [string]$id
    [string]$definitionId
    [string]$valueJson
    [bool]$value

    # Default constructor
    EmDMBooleanSettingInstance() {
        $this."@odata.type" = ''
        $this.id = ''
        $this.definitionId = ''
        $this.valueJson = ''
        $this.value = $false
    }

    # Parameterized constructor
    EmDMBooleanSettingInstance ($policy) {
        $this."@odata.type" = $policy."@odata.type"
        $this.id = $policy.id
        $this.definitionId = $policy.definitionId
        $this.valueJson = $policy.valueJson
        $this.value = $policy.value
    }

    # Overriding the ToString method
    [string] ToString() {
        return "Class: EmDMBooleanSettingInstance"
    }
}
