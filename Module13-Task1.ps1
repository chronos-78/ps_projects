# 1. Write a script to get from selected remote computer the following data:

[CmdletBinding()]
    param (
        [string]$RemoteHost
    )

    end {

        # CPU model and max clock speed
        Get-WmiObject -ComputerName $RemoteHost Win32_Processor | Select-Object Name, MaxClockSpeed | Format-Table

        # Amount of RAM (total, free)
        Get-WmiObject -ComputerName $RemoteHost Win32_ComputerSystem | Select-Object TotalPhysicalMemory | Format-Table
        Get-WmiObject -ComputerName $RemoteHost Win32_OperatingSystem | Select-Object FreePhysicalMemory | Format-Table

        # OS disk free space
        Get-WmiObject -ComputerName $RemoteHost Win32_OperatingSystem | ForEach-Object {$sysDrive = $_.SystemDrive} | Format-Table
        Get-WmiObject -ComputerName $RemoteHost Win32_LogicalDisk | Where-Object {$_.DeviceID -eq $sysDrive} | Select-Object DeviceID, FreeSpace | Format-Table

        # OS version
        Get-WmiObject -ComputerName $RemoteHost Win32_OperatingSystem | Select-Object Version | Format-Table

        # Installed hot fixes
        Get-HotFix -ComputerName $RemoteHost | Format-Table 

        # List of stopped services
        Get-WmiObject -Class Win32_Service | Where-Object {$_.State -eq "Stopped"} | Format-Table
}