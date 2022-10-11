# 3. Write a PowerShell class to reverse a string word by word.

class StrMethods {    
    Reverse([string]$param){
        $words = @(-split $param)
        $cnt = $words.Count
        $reverse_words = $words[-($cnt-1)..0]
        $res =""
        foreach($i in $reverse_words) {
            $letters = $i.ToCharArray()
            [array]::Reverse($letters)
            $reverse_word = -join($letters)
            $res = $res + $reverse_word + " "
        }
        Write-Host $res.Trim()
    }    
}

$MyCustomObject = New-Object StrMethods
$MyCustomObject.Reverse("Nostromo abcde")