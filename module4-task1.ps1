$data = @(
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

Write-Host $data[1][0]
