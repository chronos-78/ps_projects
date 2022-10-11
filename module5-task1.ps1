#1. Write a PowerShell class to implement pow(x, n) that is returns the base to the 
# exponent power(base**exponent).

class Calc {
    [double]Pow([double]$base,[double]$exp) {
        return [System.Math]::Pow($base, $exp)
    }
}

$MyCustomObject = New-Object Calc
$MyCustomObject.Pow(2, 3)
$MyCustomObject.Pow(7, 2)
