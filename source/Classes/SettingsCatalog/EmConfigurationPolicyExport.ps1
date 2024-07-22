<#
    # Custom Setting Catalog Policy class
    # Custom Output object to allow for easy import
#>
class EmConfigurationPolicyExport {
    [string]$name
    [string]$description
    [string]$platforms
    [string]$technologies
    [psobject]$templateReference
    [object[]]$settings
    # Default constructor
    EmConfigurationPolicyExport() {
        $this.name = ''
        $this.description = ''
        $this.platforms = ''
        $this.technologies = ''
        $this.templateReference = $null
        $this.settings = @()
    }
    # Parameterized constructor
    EmConfigurationPolicyExport ($policy) {
        $this.name = $policy.name
        $this.description = $policy.description
        $this.platforms = $policy.platforms
        $this.technologies = $policy.technologies
        $this.templateReference = $policy.templateReference
        $this.settings = $policy.settings
    }
    # Overriding the ToString method
    [string] ToString() {
        return "Class: EmConfigurationPolicyExport"
    }
}