# 2. Write a script to sort a list of elements using the bubble sort algorithm. 
# Make output in console for each sort steps and could be controlled by 
# Verbose parameter (user can choose if he would like to see output).
Function module10-task2 {    
    Param ([switch]$verbose)  
    $oldverbose = $VerbosePreference
    $VerbosePreference = "continue"

    $array = @(1..10 | ForEach-Object {Get-Random -Minimum 2 -Maximum 20 })
    $len = $array.Count
    "Initial: " + $array -join " "
    foreach ($i in 0..($len-2)){
        foreach ($j in ($i+1)..($len-1)){
            if ($array[$i] -gt $array[$j]) {
                if ($verbose) {
                $debug_str = "array[{0}]({1}) is greater then array[{2}]({3}), swapping {1} and {3}" -f $i,$array[$i],$j,$array[$j]
                Write-Verbose $debug_str
                }
                $tmp = $array[$i]
                $array[$i] = $array[$j]
                $array[$j] = $tmp
            }
            else {
                if($verbose) {
                $debug_str = "array[{0}]({1}) is less or equal to array[{2}]({3}), next iteration..." -f $i,$array[$i],$j,$array[$j]
                Write-Verbose $debug_str
                }
            }
        }
    }
    "Result: " + $array -join " "
    $VerbosePreference = $oldverbose
}