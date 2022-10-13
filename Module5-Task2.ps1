# 2.  Write a PowerShell class which has two methods SetString() and PrintString(). 
# SetString() accept a string from the user and PrintString() print the string in upper case.

class StrCase {
    [string]$str;

    SetString([string]$Param) {
        $this.str = $Param;
    }

    PrintString(){
        Write-Host $this.str.ToUpper()
    }    
}

$MyCustomObject = New-Object StrCase
$MyCustomObject.SetString("You shall not pass!")
$MyCustomObject.PrintString()
