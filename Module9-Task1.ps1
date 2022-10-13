# 1. Write a script that it makes association with running services and process in Windows. 
# Put result in hash table. Use pipelines as match as possible.

Install-Module -Name Join-Object
$services = Get-WmiObject -Class Win32_Service | Where-Object {$_.State -eq "Running"} 
$processes = Get-Process | Select-Object 'ProcessName', @{
                                                            Name='ProcessId'
                                                            Expression={$_.Id}
                                                        },'CPU'
$joinedObjects = Join-Object -Left $processes -Right $services -LeftJoinProperty ProcessId -RightJoinProperty ProcessId -Type OnlyIfInBoth
$resultObjects = $joinedObjects | Select-Object ProcessId, ProcessName, Name, DisplayName, CPU, StartMode, State, Status
$serviceTable = @{}
$resultObjects | ForEach-Object {
    $ht = @{}
    $_.psobject.properties | ForEach-Object { $ht[$_.Name] = $_.Value }
    $serviceTable[$_.Name] = $ht
    $_.Name
    $serviceTable[$_.Name] | Format-Table   
}