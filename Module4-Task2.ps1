# 2. Put three different hash-tables in array. Retrieve value from the second key 
# in third hash table in array.

$HashTables = @(
                @{
                    key1="value1"
                    key2="value2"
                },
                @{
                    a=5
                    b=6
                },
                @{
                    pi=3.14
                    e=2.718
                }
)

$Index = @($HashTables[2].Keys)
Write-Host  $HashTables[2][$Index[1]]

