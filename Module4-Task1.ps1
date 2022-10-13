# 1. Create two-dimensional strong defined string array.

$Data = @(
    [string[]]@(
        "Mark",  
        "Bill"        
    ),
    [string[]]@(
        "John",
        "Steve"
    ),
    [string[]]@(
        "Charles",
        "Peter"
    )
)

Write-Host $Data[1][0]
