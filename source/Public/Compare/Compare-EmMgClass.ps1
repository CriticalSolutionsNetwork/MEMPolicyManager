<#
    .SYNOPSIS
        Compares two PowerShell classes and outputs their differences.
    .DESCRIPTION
        The Compare-EmMgClass cmdlet compares the properties and methods of two specified PowerShell classes.
        It outputs the differences between the classes, if any, or indicates if the classes are identical.
    .PARAMETER Class1
        The first class to compare. This parameter is mandatory.
    .PARAMETER Class2
        The second class to compare. This parameter is mandatory.
    .INPUTS
        [Type] The cmdlet accepts two class types as input.
    .OUTPUTS
        [string] The cmdlet outputs a string indicating whether the classes are different or identical.
        It also outputs the specific property and method differences, if any.
    .EXAMPLE
        PS> Compare-EmMgClass -Class1 [ClassA] -Class2 [ClassB]
        This example compares ClassA and ClassB, outputting their differences in properties and methods.
    .NOTES
        The cmdlet uses the Compare-Object cmdlet to compare properties and methods of the specified classes.
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Compare-EmMgClass
#>

function Compare-EmMgClass {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            HelpMessage = "The first class type to compare."
        )]
        [ValidateNotNull()]
        [Type]$Class1,
        [Parameter(
            Mandatory = $true,
            HelpMessage = "The second class type to compare."
        )]
        [ValidateNotNull()]
        [Type]$Class2
    )
    process {
        $class1Properties = $Class1 | Get-Member -MemberType Properties
        $class2Properties = $Class2 | Get-Member -MemberType Properties
        $class1Methods = $Class1 | Get-Member -MemberType Methods
        $class2Methods = $Class2 | Get-Member -MemberType Methods
        $propertyDifferences = Compare-Object -ReferenceObject $class1Properties -DifferenceObject $class2Properties -Property Name, MemberType, Definition
        $methodDifferences = Compare-Object -ReferenceObject $class1Methods -DifferenceObject $class2Methods -Property Name, MemberType, Definition
        if ($propertyDifferences -or $methodDifferences) {
            Write-Output "The classes are different."
            if ($propertyDifferences) {
                Write-Output "Property Differences:"
                $propertyDifferences | ForEach-Object { $_ }
            }
            if ($methodDifferences) {
                Write-Output "Method Differences:"
                $methodDifferences | ForEach-Object { $_ }
            }
        }
        else {
            Write-Output "The classes are identical."
        }
    }
}

