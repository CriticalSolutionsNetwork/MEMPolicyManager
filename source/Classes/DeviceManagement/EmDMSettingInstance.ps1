<#
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceintent-devicemanagementsettinginstance?view=graph-rest-beta#json-representation
    # Can be one of the following types:
    # #microsoft.graph.deviceManagementBooleanSettingInstance
    # #microsoft.graph.deviceManagementIntegerSettingInstance
    # #microsoft.graph.deviceManagementStringSettingInstance
    {
        "@odata.type": "#microsoft.graph.deviceManagementSettingInstance",
        "id": "String (identifier)",
        "definitionId": "String",
        "valueJson": "String"
    }
        # EmDeviceEndpointSecurityTemplateSettingCategory
        # Get-EndpointSecurityCategorySetting
#>
class EmDMSettingInstance {
    [string]$value
    [string]$valueJson
    [string]$definitionId
    [string]${@odata.type}
    [string]$id
    # Default constructor
    EmDMSettingInstance() {
        $this.value = ''
        $this.valueJson = ''
        $this.definitionId = ''
        $this."@odata.type" = ''
        $this.id = ''
    }
    # Parameterized constructor
    EmDMSettingInstance ($policy) {
        $this.value = $policy.value
        $this.valueJson = $policy.valueJson
        $this.definitionId = $policy.definitionId
        $this."@odata.type" = $policy."@odata.type"
        $this.id = $policy.id
    }
    # Overriding the ToString method
    [string] ToString() {
        return "Class: EmDMSettingInstance"
    }
}
