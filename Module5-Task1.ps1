#1. Write a PowerShell class to implement pow(x, n) that is returns the Base to the 
# Exponent power(Base**Exponent).

class Calc {
    [double]Pow([double]$Base,[double]$Exp) {
        return [System.Math]::Pow($Base, $Exp)
    }
}

$MyCustomObject = New-Object Calc
$MyCustomObject.Pow(2, 3)
$MyCustomObject.Pow(7, 2)
