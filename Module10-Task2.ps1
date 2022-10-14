# 2. Write a script to sort a list of elements using the bubble sort algorithm. 
# Make output in console for each sort steps and could be controlled by 
# Verbose parameter (user can choose if he would like to see output).

[CmdletBinding()]
    param ()

    begin{
        $verbose = ($PSBoundParameters.Verbose -eq $true)? $true : $false 
    }

    process{      
    $oldVerbose = $VerbosePreference
    $VerbosePreference = "continue"

    $array = @(1..10 | ForEach-Object {Get-Random -Minimum 2 -Maximum 20 })
    $len = $array.Count
    "Initial: " + $array -join " "
    foreach ($i in 0..($len-2)){
        foreach ($j in ($i+1)..($len-1)){
            if ($array[$i] -gt $array[$j]) {
                if ($verbose) {
                    $verboseStr = "array[{0}]({1}) is greater then array[{2}]({3}), swapping {1} and {3}" -f 
                        $i, $array[$i], $j, $array[$j]
                    Write-Verbose $verboseStr
                }
                
                $tmp = $array[$i]
                $array[$i] = $array[$j]
                $array[$j] = $tmp
            }
            else {
                if($verbose) {
                    $verboseStr = "array[{0}]({1}) is less or equal to array[{2}]({3}), next iteration..." -f 
                        $i, $array[$i], $j, $array[$j]
                    Write-Verbose $verboseStr
                }
            }
        }
    }
    "Result: " + $array -join " "
    $VerbosePreference = $oldVerbose
}