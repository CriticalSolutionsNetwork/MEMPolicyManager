# MemPolicyManager
## about_MemPolicyManager

# SHORT DESCRIPTION

- A PowerShell module for managing Microsoft Endpoint Manager policies, including backup, import, export, and comparison using Microsoft Graph API.

# LONG DESCRIPTION

- The MemPolicyManager module provides a comprehensive set of cmdlets for managing Microsoft Endpoint Manager policies. This module allows administrators to perform various tasks such as backing up, importing, exporting, and comparing policies through the Microsoft Graph API. It aims to streamline policy management and ensure that configurations are consistent and easily recoverable.

# EXAMPLES

```powershell
    # Backup Intune App Configuration policies to a specified directory
    PS C:\> Backup-EmMdmAppConfiguration -ExportPath "C:\Backup\AppConfigurations"

    # Import Intune App Configuration policies from a specified directory
    PS C:\> Import-EmMdmAppConfiguration -ImportPath "C:\Backup\AppConfigurations\IOSDeviceConfig.json"

    # Compare two Endpoint Manager policy classes
    PS C:\> Compare-EmMgClass -Class1 [Type1] -Class2 [Type2]

    # Retrieve Intune App Configuration policies using a specific Graph API version
    PS C:\> Get-EmMdmAppConfiguration
```

# NOTE

- Only beta api is supported at the moment.

# TROUBLESHOOTING NOTE

- Look out on the Github repository for issues and new releases.

# SEE ALSO

- https://github.com/criticalsolutionsnetwork/MemPolicyManager

# KEYWORDS

- Microsoft Graph API
- Endpoint Manager
- Intune
- Policy Management
- Backup
- Import
- Export
- Compare
