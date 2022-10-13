# 1. Write a script to convert temperatures to and from Celsius, Fahrenheit.

$temp = $args[0]

function ExtractNum([string]$Param) {
    $null = $Param -match "(?<num_temp>\d{1,})"    
    return $Matches.0
}

function F2C([int]$NumF){
    return ($NumF - 32) * 5/9
}

function C2F([int]$NumC){
    return ($NumC * 9/5) + 32
}

if ($temp -match "\d{1,}F") {
    $tempNumF = ExtractNum($temp)
    $tempNumC = F2C($tempNumF)
    "{0}F is {1:n0} in Celsius" -f $tempNumF, $tempNumC
}
elseif ($temp -match "\d{1,}C") {
    $tempNumC = ExtractNum($temp)
    $tempNumF = C2F($tempNumC)
    "{0}C is {1:n0} in Fahrenheit" -f $tempNumC, $tempNumF
}
else {
    Write-Host "Incorrect input"
}