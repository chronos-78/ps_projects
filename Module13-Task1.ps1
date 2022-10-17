# 1. Write a script to get from selected remote computer the following data:

$remoteHost = "SRV2019"

# CPU model and max clock speed
Get-WmiObject -ComputerName $remoteHost Win32_Processor | Select-Object Name, MaxClockSpeed | Format-Table

# Amount of RAM (total, free)
Get-WmiObject -ComputerName $remoteHost Win32_ComputerSystem | Select-Object TotalPhysicalMemory | Format-Table
Get-WmiObject -ComputerName $remoteHost Win32_OperatingSystem | Select-Object FreePhysicalMemory | Format-Table

# OS disk free space
Get-WmiObject -ComputerName $remoteHost Win32_OperatingSystem | ForEach-Object {$sysDrive = $_.SystemDrive} | Format-Table
Get-WmiObject -ComputerName $remoteHost Win32_LogicalDisk | Where-Object {$_.DeviceID -eq $sysDrive} | Select-Object DeviceID, FreeSpace | Format-Table

# OS version
Get-WmiObject -ComputerName $remoteHost Win32_OperatingSystem | Select-Object Version | Format-Table

# Installed hot fixes
Get-HotFix -ComputerName $remoteHost | Format-Table 

# List of stopped services
Get-WmiObject -Class Win32_Service | Where-Object {$_.State -eq "Stopped"} | Format-Table