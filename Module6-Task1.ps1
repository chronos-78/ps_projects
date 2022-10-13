# 1. Create a new sorted string using two strings with random characters in them. 
# Strings contain only letters from a to z.

$str1 = "xyaabbbccccdefww"
$str2 = "xxxxyyyyabklmopq"

$letters1 = $str1.ToCharArray()
$letters2 = $str2.ToCharArray()

$sortedSet = [System.Collections.Generic.SortedSet[char]]::new()

foreach($char in $letters1){
    $null = $sortedSet.Add($char)
}

foreach($char in $letters2){
    $null = $sortedSet.Add($char)
}

-join $sortedSet