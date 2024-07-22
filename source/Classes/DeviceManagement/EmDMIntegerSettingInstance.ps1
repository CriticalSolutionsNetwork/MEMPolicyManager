<#
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceintent-devicemanagementintegersettinginstance?view=graph-rest-beta#json-representation
    {
        "@odata.type": "#microsoft.graph.deviceManagementIntegerSettingInstance",
        "id": "String (identifier)",
        "definitionId": "String",
        "valueJson": "String",
        "value": 1024
    }
#>
class EmDMIntegerSettingInstance {
    [string]${@odata.type}
    [string]$id
    [string]$definitionId
    [string]$valueJson
    [object]$value

    # Default constructor
    EmDMIntegerSettingInstance() {
        $this."@odata.type" = ''
        $this.id = ''
        $this.definitionId = ''
        $this.valueJson = ''
        $this.value = $null
    }

    # Parameterized constructor
    EmDMIntegerSettingInstance ($policy) {
        $this."@odata.type" = $policy."@odata.type"
        $this.id = $policy.id
        $this.definitionId = $policy.definitionId
        $this.valueJson = $policy.valueJson
        $this.value = $policy.value
    }

    # Overriding the ToString method
    [string] ToString() {
        return "Class: EmDMIntegerSettingInstance"
    }
}
