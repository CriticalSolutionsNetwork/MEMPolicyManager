<#
    .SYNOPSIS
        Retrieves metadata information for a specific entity type from a Microsoft Graph metadata XML file.
    .DESCRIPTION
        The Get-EmMgMetadataXmlInfo cmdlet parses a Microsoft Graph metadata XML file and retrieves detailed information for a specified entity type.
        It gathers properties, methods, actions, enums, and relationships related to the entity type, and provides a JSON representation of the entity.
    .PARAMETER XmlFilePath
        The file path to the Microsoft Graph metadata XML file. This parameter is mandatory.
    .PARAMETER TypeName
        The name of the entity type to retrieve information for. This parameter is mandatory.
    .PARAMETER InfoType
        The type of information to retrieve. Default is "EntityType".
    .INPUTS
        None. This cmdlet does not accept pipeline input.
    .OUTPUTS
        [PSCustomObject]
        The cmdlet outputs a custom object containing detailed information about the specified entity type, including its properties, methods, actions, enums, relationships, and a JSON representation.
    .EXAMPLE
        PS> Get-EmMgMetadataXmlInfo -XmlFilePath "C:\GraphMetadata\metadata.xml" -TypeName "User"
        This example retrieves metadata information for the 'User' entity type from the specified Microsoft Graph metadata XML file.
    .EXAMPLE
        PS> Get-EmMgMetadataXmlInfo -XmlFilePath "C:\GraphMetadata\metadata.xml" -TypeName "Device"
        This example retrieves metadata information for the 'Device' entity type from the specified Microsoft Graph metadata XML file.
    .NOTES
        The cmdlet uses XPath queries to navigate the metadata XML and extract relevant information.
    .LINK
        https://criticalsolutionsnetwork.github.io/MemPolicyManager/#Get-EmMgMetadataXmlInfo
#>

function Get-EmMgMetadataXmlInfo {
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param (
        [Parameter(
            Mandatory = $true,
            HelpMessage = "Specify the path to the XML metadata file."
        )]
        [ValidateNotNullOrEmpty()]
        [string]$XmlFilePath,
        [Parameter(
            Mandatory = $true,
            HelpMessage = "Specify the type name for which information is to be retrieved."
        )]
        [ValidateNotNullOrEmpty()]
        [string]$TypeName,
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Specify the information type to be retrieved. Default is 'EntityType'."
        )]
        [ValidateSet("EntityType")]
        [string]$InfoType = "EntityType"
    )
    process{
    #[ValidateSet("EntityType")]
    [string]$InfoType = "EntityType"
    [xml]$XmlMetadata = Get-Content -Path $XmlFilePath
    $NamespaceManager = New-Object System.Xml.XmlNamespaceManager($XmlMetadata.NameTable)
    $NamespaceManager.AddNamespace("edmx", "http://docs.oasis-open.org/odata/ns/edmx")
    $NamespaceManager.AddNamespace("edm", "http://docs.oasis-open.org/odata/ns/edm")
    $schemaNodes = $XmlMetadata.SelectNodes("//edmx:Edmx/edmx:DataServices/edm:Schema", $NamespaceManager)
    $info = [PSCustomObject]@{
        Type               = $InfoType
        Name               = $TypeName
        BaseType           = ""
        Properties         = @()
        Methods            = @()
        Actions            = @()
        Enums              = @()
        Relationships      = @()
        JsonRepresentation = @{}
    }
    $found = $false
    foreach ($schema in $schemaNodes) {
        $typeNode = $schema.SelectSingleNode("edm:$InfoType[@Name='$TypeName']", $NamespaceManager)
        if ($typeNode) {
            $found = $true
            Write-Verbose "$InfoType`: $TypeName"
            if ($typeNode.BaseType) {
                $info.BaseType = $typeNode.BaseType
                Write-Verbose "BaseType`: $($typeNode.BaseType)"
            }
            foreach ($property in $typeNode.Property) {
                $propertyName = $property.Name
                $propertyType = $property.Type
                Write-Verbose "Property Name`: $propertyName, Type`: $propertyType"
                $info.Properties += [PSCustomObject]@{
                    Name = $propertyName
                    Type = $propertyType
                }
                switch -Wildcard ($propertyType) {
                    "Edm.String" { $info.JsonRepresentation[$propertyName] = "string" }
                    "Edm.Int32" { $info.JsonRepresentation[$propertyName] = 0 }
                    "Edm.DateTimeOffset" { $info.JsonRepresentation[$propertyName] = "2024-01-01T00:00:00Z" }
                    "Edm.Boolean" { $info.JsonRepresentation[$propertyName] = $false }
                    "Collection(Edm.String)" { $info.JsonRepresentation[$propertyName] = [string[]]@("string1", "string2") }
                    "Collection(Edm.Int32)" { $info.JsonRepresentation[$propertyName] = @(0, 1) }
                    "Collection(Edm.DateTimeOffset)" { $info.JsonRepresentation[$propertyName] = @("2024-01-01T00:00:00Z", "2024-01-02T00:00:00Z") }
                    "Collection(*)" { $info.JsonRepresentation[$propertyName] = @{} }
                    default { $info.JsonRepresentation[$propertyName] = "null" }
                }
            }
            foreach ($navProp in $typeNode.NavigationProperty) {
                $navPropName = $navProp.Name
                $navPropType = $navProp.Type
                Write-Verbose "Navigation Property Name`: $navPropName, Type`: $navPropType"
                $info.Relationships += [PSCustomObject]@{
                    Name = $navPropName
                    Type = $navPropType
                }
            }
            # Gather related functions and actions
            $methods = $schema.SelectNodes("edm:Function", $NamespaceManager)
            foreach ($method in $methods) {
                $parameterType = $method.Parameter.Type
                if ($parameterType -eq "graph.$TypeName" -or $parameterType -eq "Collection(graph.$TypeName)") {
                    $methodName = $method.LocalName
                    $methodType = "Function"
                    Write-Verbose "$methodType`: $methodName"
                    $info.Methods += [PSCustomObject]@{
                        Name = $methodName
                        Type = $methodType
                    }
                }
            }
            $actions = $schema.SelectNodes("edm:Action", $NamespaceManager)
            foreach ($action in $actions) {
                $parameterType = $action.Parameter.Type
                if ($parameterType -eq "graph.$TypeName" -or $parameterType -eq "Collection(graph.$TypeName)") {
                    $actionName = $action.LocalName
                    $actionType = "Action"
                    Write-Verbose "$actionType`: $actionName"
                    $info.Actions += [PSCustomObject]@{
                        Name = $actionName
                        Type = $actionType
                    }
                }
            }
            # Gather related enums
            $enumTypes = $schema.SelectNodes("edm:EnumType", $NamespaceManager)
            foreach ($enumType in $enumTypes) {
                $enumName = $enumType.Name
                Write-Verbose "EnumType`: $enumName"
                $info.Enums += [PSCustomObject]@{
                    Name = $enumName
                    Type = "EnumType"
                }
            }
        }
        if ($found) { break }
    }
    if (-not $found) {
        Write-Verbose "$InfoType`: $TypeName not found in schema: $($schema.NamespaceURI)" -Verbose
    }
    return $info
    }
}