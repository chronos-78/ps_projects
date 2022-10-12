# 1. Write a script to convert temperatures to and from Celsius, Fahrenheit.

$temp = $args[0]

function extract_num([string]$string_temp) {
    $null = $string_temp -match "(?<num_temp>\d{1,})"    
    return $Matches.0
}

function f2c([int]$num_f){
    return ($num_f - 32) * 5/9
}

function c2f([int]$num_c){
    return ($num_c * 9/5) + 32
}

if ($temp -match "\d{1,}F") {
    $temp_num_f = extract_num($temp)
    $temp_num_c = f2c($temp_num_f)
    "{0}F is {1:n0} in Celsius" -f $temp_num_f, $temp_num_c
}
elseif ($temp -match "\d{1,}C") {
    $temp_num_c = extract_num($temp)
    $temp_num_f = c2f($temp_num_c)
    "{0}C is {1:n0} in Fahrenheit" -f $temp_num_c, $temp_num_f
}
else {
    Write-Host "Incorrect input"
}