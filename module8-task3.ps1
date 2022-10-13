# 3. Write a script to calculate a dog's age in human years: for the first two years, a dog year is equal to 10.5 human years. 
# After that, each dog year equals 4 human years.

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