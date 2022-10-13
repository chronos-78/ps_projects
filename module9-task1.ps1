# 1. Write a script that it makes association with running services and process in Windows. 
# Put result in hash table. Use pipelines as match as possible.

Install-Module -Name Join-Object
$Services = Get-WmiObject -Class Win32_Service | Where-Object {$_.State -eq "Running"} 
$Processes = Get-Process | Select-Object 'ProcessName', @{Name='ProcessId';Expression={$_.Id}},'CPU'
$JoinedObjects = Join-Object -Left $Processes -Right $Services -LeftJoinProperty ProcessId -RightJoinProperty ProcessId -Type OnlyIfInBoth
$ResultObjects = $JoinedObjects | Select-Object ProcessId, ProcessName, Name, DisplayName, CPU, StartMode, State, Status
$ServiceTable = @{}
$ResultObjects | ForEach-Object {
    $ServiceTable[$_.Name] = @{
            ProcessId = $_.ProcessId; 
            ProcessName = $_.ProcessName;
            DisplayName = $_.DisplayName;
            CPU = $_.CPU;
            StartMode = $_.StartMode;
            State  = $_.State;
            Status = $_.Status
        }
    $_.Name
    $ServiceTable[$_.Name] | Format-Table   
}
    



