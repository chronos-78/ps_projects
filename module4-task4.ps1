# 4. Transform hash-table into ordered hash-table sorted by value.

$hashTable = @{a = 12; g = 4; h = 1; t = 7; d = 8}
$orderedTable = [ordered]@{}

foreach($item in $hashtable.GetEnumerator() | Sort-Object Value)
{
    $orderedTable[$item.Key] = $item.Value
}

$orderedTable
