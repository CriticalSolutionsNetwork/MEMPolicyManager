<#
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceintent-devicemanagementstringsettinginstance?view=graph-rest-beta#json-representation
    {
        "@odata.type": "#microsoft.graph.deviceManagementStringSettingInstance",
        "id": "String (identifier)",
        "definitionId": "String",
        "valueJson": "String",
        "value": "String"
    }
#>
class EmDMStringSettingInstance {
    [string]${@odata.type}
    [string]$id
    [string]$definitionId
    [string]$valueJson
    [string]$value
    # Default constructor
    EmDMStringSettingInstance() {
        $this."@odata.type" = ''
        $this.id = ''
        $this.definitionId = ''
        $this.valueJson = ''
        $this.value = ''
    }
    # Parameterized constructor
    EmDMStringSettingInstance ($policy) {
        $this."@odata.type" = $policy."@odata.type"
        $this.id = $policy.id
        $this.definitionId = $policy.definitionId
        $this.valueJson = $policy.valueJson
        $this.value = $policy.value
    }
    # Overriding the ToString method
    [string] ToString() {
        return "Class: EmDMStringSettingInstance"
    }
}
