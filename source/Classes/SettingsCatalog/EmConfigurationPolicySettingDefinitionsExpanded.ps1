<#
    #  $Resource = "deviceManagement/configurationPolicies('$policyId')/settings?`$expand=settingDefinitions"
    # https://learn.microsoft.com/en-us/graph/api/resources/intune-deviceconfigv2-devicemanagementconfigurationsetting?view=graph-rest-beta#json-representation
#>
class EmConfigurationPolicySettingDefinitionsExpanded {
    [string]$id
    [psobject]$settingInstance
    [object[]]$settingDefinitions
    # Default constructor
    EmConfigurationPolicySettingDefinitionsExpanded() {
        $this.id = ''
        $this.settingInstance = @()
        $this.settingDefinitions = @()
    }
    # Parameterized constructor
    EmConfigurationPolicySettingDefinitionsExpanded ($policy) {
        $this.id = $policy.id
        $this.settingInstance = $policy.settingInstance
        $this.settingDefinitions = $policy.settingDefinitions
    }
    # Overriding the ToString method
    [string] ToString() {
        return "Class: EmConfigurationPolicySettingDefinitionsExpanded"
    }
}