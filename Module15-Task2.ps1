# 2. Call a function that will get any array from the pipeline. Function output should be formatted according to the example below

. .\Get-ValueFromPipe.ps1

1..3 | Get-ValueFromPipe
@("First", "Second") | Get-ValueFromPipe