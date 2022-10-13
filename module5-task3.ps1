# 3. Write a PowerShell class to reverse a string word by word.

class StrMethods {    
    Reverse([string]$Param){
        $words = @(-split $Param)
        $cnt = $words.Count
        $reverseWords = $words[-($cnt-1)..0]
        Write-Host $reverseWords
    }    
}

$MyCustomObject = New-Object StrMethods
$MyCustomObject.Reverse("Nostromo abcde")