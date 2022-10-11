$hashTable = @{a = 12; g = @{s = 7}}

foreach($key in $hashTable.Keys) {
    Write-Host $hashTable[$key]
}