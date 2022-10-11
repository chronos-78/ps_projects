class StrCase {
    [string]$str;

    SetString([string]$param) {
        $this.str = $param;
    }

    PrintString(){
        Write-Host $this.str.ToUpper()
    }    
}

$MyCustomObject = New-Object StrCase
$MyCustomObject.SetString("You shall not pass!")
$MyCustomObject.PrintString()
