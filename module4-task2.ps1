# 2. Put three different hash-tables in array. Retrieve value from the second key 
# in third hash table in array.


$hashTable = @(
                @{key1="value1"; key2="value2"},
                @{a=5;b=6},
                @{pi=3.14;e=2.718}
)

$index = @($hashTable[2].Keys)

Write-Host  $hashTable[2][$index[1]]

