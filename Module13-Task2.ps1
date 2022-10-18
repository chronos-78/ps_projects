function GetLogonID($string) {
    $null = $string -match '"(?<LogonID>\d+)"$'
    return $Matches['LogonID']
}

function GetUser($string) {
    $null = $string -match 'Name="(?<User>.+)"$'
    return $Matches['User']
}

function GetAccountByName($userAccounts, $userName) {
    return $userAccounts | Where-Object {$userAccounts.Name -eq $userName }
}

$loggedUsers = Get-WmiObject Win32_LoggedonUser | Select-Object @{
    name='LoggedUser'
    expression={GetUser($_.Antecedent)}
},
@{
    name='LogonID'
    expression={GetLogonID($_.Dependent)}
}

$logonSessions = Get-WmiObject Win32_LogonSession | Where-Object {
    $_.AuthenticationPackage -eq "NTLM" -and 
    ($_.LogonType -eq "2" -or $_.LogonType -eq "10")
}  
$userAccounts = Get-WmiObject Win32_Account

foreach ($session in $logonSessions) {
    $session | Format-Table    
    $users = $loggedUsers | Where-Object {$_.LogonID -eq $session.LogonId}  
    $users | Format-Table    
    $userAccount = $userAccounts | Where-Object {$_.Name -eq $users.LoggedUser}
    $userAccount | Format-Table
    Write-Host "---------------------------------------------------------------------------------------------------"
}