# 4. Transform hash-table into ordered hash-table sorted by value.

$Hashtable = @{
                a = 12
                g = 4 
                h = 1 
                t = 7 
                d = 8
            }

$OrderedTable = [ordered]@{}
foreach($item in $Hashtable.GetEnumerator() | Sort-Object Value)
{
    $OrderedTable[$item.Key] = $item.Value
}
$OrderedTable
