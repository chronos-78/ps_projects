# 3.  Create nested hash-table and retrieve values by Keys from it.

$HashTable = @{
                a = 12
                g = @{s = 7}
            }

foreach($Key in $HashTable.Keys) {
    Write-Host $HashTable[$Key]
}