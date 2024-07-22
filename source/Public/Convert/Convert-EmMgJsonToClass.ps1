<#
    .SYNOPSIS
        Converts a JSON string to a PowerShell class definition.
    .DESCRIPTION
        The Convert-EmMgJsonToClass cmdlet takes a JSON string and a class name as input and generates a PowerShell class definition.
        The cmdlet supports different operations (create, update, get) to customize the generated class properties and constructors.
    .PARAMETER Json
        The JSON string to be converted into a PowerShell class. This parameter is mandatory.
    .PARAMETER ClassName
        The name of the class to be generated. This parameter is mandatory.
    .PARAMETER Operation
        The operation type to customize the generated class. Valid values are "create", "update", and "get".
        This parameter is mandatory.
    .INPUTS
        [string] The cmdlet accepts a JSON string and a class name as input.
    .OUTPUTS
        [string] The cmdlet outputs the generated PowerShell class definition as a string.
    .EXAMPLE
        PS> $json = '{"name": "Test", "value": 123}'
        PS> Convert-EmMgJsonToClass -Json $json -ClassName "TestClass" -Operation "create"
        This example converts the JSON string into a PowerShell class named "TestClass" for the "create" operation.
    .NOTES
        The cmdlet generates a PowerShell class with properties, a default constructor, and a parameterized constructor based on the JSON string.
        The cmdlet uses different operations to customize the class properties and constructors.
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Convert-EmMgJsonToClass
#>

function Convert-EmMgJsonToClass {
  [cmdletBinding()]
  [OutputType([string])]
  param (
    [Parameter(
        Mandatory = $true,
        Position = 0,
        HelpMessage = "The JSON string to convert to a PowerShell class."
    )]
    [ValidateNotNullOrEmpty()]
    [string]$Json,
    [Parameter(
        Mandatory = $true,
        Position = 1,
        HelpMessage = "The name of the class to generate."
    )]
    [ValidateNotNullOrEmpty()]
    [string]$ClassName,
    [Parameter(
        Mandatory = $true,
        Position = 2,
        HelpMessage = "The operation type for the class generation."
    )]
    [ValidateSet("create", "update", "get")]
    [string]$Operation
)
  process {
    # Convert JSON string to PowerShell object
    switch ($Operation) {
      "get" { $jsonObject = $Json | ConvertFrom-Json -NoEnumerate | Select-Object -Property * }
      Default {
        $jsonObject = $Json | ConvertFrom-Json -NoEnumerate | Select-Object -Property * -ExcludeProperty id, lastModifiedDateTime, roleScopeTagIds, supportsScopeTags, deviceManagementApplicabilityRuleOsEdition, deviceManagementApplicabilityRuleOsVersion, deviceManagementApplicabilityRuleDeviceMode, createdDateTime
      }
    }
    $properties = @()
    $constructorAssignments = @()
    $defaultAssignments = @()
    # Iterate over each property in the JSON object
    foreach ($property in $jsonObject.PSObject.Properties) {
      $name = $property.Name
      $value = $property.Value
      $type = switch ($value.GetType().Name) {
        "String" { "[string]" }
        "Int32" { "[int]" }
        "Boolean" { "[bool]" }
        "DateTime" { "[datetime]" }
        "Object[]" { "[object[]]" }
        "PSCustomObject" { "[psobject]" }
        default { "[object]" }
      }
      # Special handling for the @odata.type property
      if ($name -eq "@odata.type") {
        $properties += "[string]`$`{${name}`}"
        $constructorAssignments += "`$this.`"$name`"` = `$policy.`"$name`""
        $defaultAssignments += "`$this.`"@odata.type`" = ''"
      }
      else {
        $properties += "$type`$$name"
        $constructorAssignments += "`$this.$name = `$policy.$name"
        $defaultAssignment = switch ($type) {
          "[string]" { "`$this.$name = ''" }
          "[int]" { "`$this.$name = 0" }
          "[bool]" { "`$this.$name = `$false" }
          "[datetime]" { "`$this.$name = [datetime]::MinValue" }
          "[object[]]" { "`$this.$name = @()" }
          "[psobject]" { "`$this.$name = `$null" }
          default { "`$this.$name = `$null" }
        }
        $defaultAssignments += $defaultAssignment
      }
    }

    # Join the properties and assignments into text blocks
    $propertiesText = $properties -join "`n    "
    $constructorAssignmentsText = $constructorAssignments -join "`n        "
    $defaultAssignmentsText = $defaultAssignments -join "`n        "

    # Create the class template
    $classTemplate = @"
class $ClassName {
  $propertiesText

  # Default constructor
  $ClassName() {
      $defaultAssignmentsText
  }

  # Parameterized constructor
  $ClassName (`$policy) {
      $constructorAssignmentsText
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: $ClassName"
  }
}
"@
    return $classTemplate
  } # process
}
