$ProjectPath = "$PSScriptRoot\..\..\.." | Convert-Path
$ProjectName = (Get-ChildItem $ProjectPath\*\*.psd1 | Where-Object {
        ($_.Directory.Name -match 'source|src' -or $_.Directory.Name -eq $_.BaseName) -and
        $(try { Test-ModuleManifest $_.FullName -ErrorAction Stop }catch{$false}) }
    ).BaseName

Import-Module $ProjectName

InModuleScope $ProjectName {
    Describe class1 {
        Context 'Type creation' {
            It 'Has created a type named class1' {
                'class1' -as [Type] | Should -BeOfType [Type]
            }
        }

        Context 'Constructors' {
            It 'Has a default constructor' {
                $instance = [class1]::new()
                $instance | Should -Not -BeNullOrEmpty
                $instance.GetType().Name | Should -Be 'class1'
            }
        }

        Context 'Methods' {
            BeforeEach {
                $instance = [class1]::new()
            }

            It 'Overrides the ToString method' {
                # Typo "class" is inherited from definition. Preserved here as validation is demonstrative.
                $instance.ToString() | Should -Be 'This class is class1'
            }
        }

        Context 'Properties' {
            BeforeEach {
                $instance = [class1]::new()
            }

            It 'Has a Name property' {
                $instance.Name | Should -Be 'Class1'
            }
        }
    }
}
