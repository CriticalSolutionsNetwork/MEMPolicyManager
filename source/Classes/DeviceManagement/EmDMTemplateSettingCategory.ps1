<#
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceintent-devicemanagementtemplatesettingcategory?view=graph-rest-beta#json-representation
    # Json representation does not accurately represent the output as there is no "@odata.type" property.
    $policy = [PSCustomObject]@{
        displayName    = "Test Policy"
        description    = "Test Description"
        settingsDelta  = @()
        roleScopeTagIds = @()
    }
    $instance = [EmDeviceManagementTemplateSettingCategory]::new($policy)
    # JSON:
    {
        "id": "String (identifier)",
        "displayName": "String",
        "hasRequiredSetting": true
    }
#>
class EmDMTemplateSettingCategory {
    [string]$id
    [string]$displayName
    [bool]$hasRequiredSetting
    # Default constructor
    EmDMTemplateSettingCategory() {
        $this.id = ''
        $this.displayName = ''
        $this.hasRequiredSetting = $false
    }
    # Parameterized constructor
    EmDMTemplateSettingCategory ($policy) {
        $this.id = $policy.id
        $this.displayName = $policy.displayName
        $this.hasRequiredSetting = $policy.hasRequiredSetting
    }
    # Overriding the ToString method
    [string] ToString() {
        return "Class: EmDMTemplateSettingCategory"
    }
}
