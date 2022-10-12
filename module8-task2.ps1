# 2. Write a script to get the Fibonacci series between 0 to N.

function Fib() {
    param ($n)
    $a = 0
    $b = 1
    $numbers = [System.Collections.ArrayList]::new()
    while ($c -le $n) {
        $c = $a + $b
        $a = $b
        $b = $c
        $null = $numbers.Add($a)
    } 
    $numbers -join " "    
}

Fib($args[0])