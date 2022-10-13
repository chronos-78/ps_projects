#1. Set PowerShell execution policy for local computer to Remote Sign only mode.

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
Get-ExecutionPolicy -List

#2. Set PowerShell execution policy in Restricted only mode as preparation to
# run module1-task2.ps1 script from cmd tool using bypass command option for PowerShell.

Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope LocalMachine

cmd.exe /c ".\module1-exec.cmd"

#Restore policy for the remaining scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine