<#
    .SYNOPSIS
        Removes and updates the primary user for specified devices in Microsoft Intune.
    .DESCRIPTION
        This function removes the primary user from specified devices and assigns the last logged-on user (retrieved via the Beta API) as the new primary user.
    .PARAMETER DeviceNames
        An array of device names for which the primary user will be updated.
    .PARAMETER PreviewOnly
        If specified, the function will display the proposed changes without making modifications.
    .EXAMPLE
        Update-WinXPrimaryUser -DeviceNames @('HostA', 'HostB') -PreviewOnly
    .EXAMPLE
        Update-WinXPrimaryUser -DeviceNames @('HostA', 'HostB') -Confirm
    .NOTES
        Author: Doug Rios
        Date: March 4, 2025
#>
function Update-WinXPrimaryUser {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param (
        [string[]]$DeviceNames,
        [switch]$PreviewOnly
    )
    # Connect to Microsoft Graph with required scopes
    Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All", "DeviceManagementConfiguration.ReadWrite.All"
    foreach ($Device in $DeviceNames) {
        # Retrieve the device information from Intune
        $DeviceToModify = Get-MgDeviceManagementManagedDevice -Filter "DeviceName eq '$Device'" | Select-Object DeviceName, Id, userPrincipalName
        if ($null -eq $DeviceToModify) {
            Write-Output "No devices found with the name $Device"
            continue
        }
        $DeviceId = $DeviceToModify.Id
        $DeviceName = $DeviceToModify.DeviceName
        $OldUser = $DeviceToModify.userPrincipalName
        # Retrieve last logged-on user from Beta API
        $BetaURI = "https://graph.microsoft.com/beta/deviceManagement/managedDevices('$DeviceId')"
        try {
            $LoggedOnUsers = (Invoke-MgGraphRequest -Method Get -Uri $BetaURI).usersLoggedOn
            if ($null -eq $LoggedOnUsers) {
                Write-Output "No recent user logins found for device $DeviceName"
                continue
            }
            # Ensure it's an array and sort users by lastLogOnDateTime (descending)
            $SortedUsers = $LoggedOnUsers | Sort-Object { $_.lastLogOnDateTime } -Descending
            $MostRecentUser = $SortedUsers | Select-Object -First 1
            if ($null -eq $MostRecentUser) {
                Write-Output "No valid logon records found for device $DeviceName"
                continue
            }
            $NewUserId = $MostRecentUser.userId
            $LastLogonTime = $MostRecentUser.lastLogOnDateTime
            Write-Output "Device: $DeviceName"
            Write-Output "    Current Primary User: $OldUser"
            Write-Output "    Proposed New User ID: $NewUserId (Last Logon: $LastLogonTime)"
            # If PreviewOnly is set, just display the info
            if ($PreviewOnly) {
                continue
            }
        }
        catch {
            Write-Output "Failed to retrieve last logged-on user for device $DeviceName`: $($_.Exception.Message)"
            continue
        }
        # Step 1: Remove the existing primary user
        if ($PSCmdlet.ShouldProcess("Device $DeviceName", "Remove primary user ($OldUser)")) {
            $RemoveURI = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices('$DeviceId')/users/`$ref"
            try {
                Invoke-MgGraphRequest -Method DELETE -Uri $RemoveURI
                Write-Output "Primary user ($OldUser) removed from device $DeviceName"
            }
            catch {
                Write-Output "Failed to remove primary user from device $DeviceName`: $($_.Exception.Message)"
                continue
            }
        }
        # Step 2: Assign the new user as the primary user
        if ($PSCmdlet.ShouldProcess("Device $DeviceName", "Assign primary user ($NewUserId)")) {
            $AssignURI = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices('$DeviceId')/users/`$ref"
            $Body = @{
                "@odata.id" = "https://graph.microsoft.com/v1.0/users/$NewUserId"
            } | ConvertTo-Json -Depth 1
            try {
                Invoke-MgGraphRequest -Method POST -Uri $AssignURI -Body $Body -ContentType "application/json"
                Write-Output "Primary user ($NewUserId) assigned to device $DeviceName"
            }
            catch {
                Write-Output "Failed to assign new primary user to device $DeviceName`: $($_.Exception.Message)"
            }
        }
    }
}