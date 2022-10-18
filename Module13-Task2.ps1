# 2. Write a script to get all interactive and remote logon sessions for the selected remote computer. 
# And for every session find associated user information.

[CmdletBinding()]
    param (
        [string]$RemoteHost
    )

    end {

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

        $loggedUsers = Get-WmiObject -ComputerName $RemoteHost Win32_LoggedonUser | Select-Object @{
            name='LoggedUser'
            expression={GetUser($_.Antecedent)}
        },
        @{
            name='LogonID'
            expression={GetLogonID($_.Dependent)}
        }

        $logonSessions = Get-WmiObject -ComputerName $RemoteHost Win32_LogonSession | Where-Object {
            $_.AuthenticationPackage -eq "NTLM" -and 
            ($_.LogonType -eq "2" -or $_.LogonType -eq "10")
        }  
        $userAccounts = Get-WmiObject -ComputerName $RemoteHost Win32_Account

        foreach ($session in $logonSessions) {
            $session | Format-Table    
            $loggedUser = $loggedUsers | Where-Object {$_.LogonID -eq $session.LogonId}  
            $loggedUser | Format-Table    
            $userAccount = $userAccounts | Where-Object {$_.Name -eq $loggedUser.LoggedUser}
            $userAccount | Format-Table
            Write-Host "---------------------------------------------------------------------------------------------------"
        }
}