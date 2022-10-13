function Get-TwoSum ([System.Array]$numbers, [int]$target) {
    $n = $numbers.Count
    foreach ($i in 0..($n-2)) {
        foreach ($j in ($i+1)..($n-1)) {
            if ($numbers[$i] + $numbers[$j] -eq $target) {
                return @($i, $j)
            }
        }
    }
}

$expected = Get-TwoSum -numbers @(2, 2, 3) -target 4
$expected