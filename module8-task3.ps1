function DogAge() {
    param ($n)
    $numbers = [System.Collections.ArrayList]::new()
    $c = 1
    $age = 0
    foreach ($c in 1..$n) {
        if ($c -eq 1 -or $c -eq 2) {
            $age += 10.5
        }
        else {
            $age += 4
        }
        $null = $numbers.Add($age)        
    }    
    $numbers -join " "
}

DogAge($args[0])