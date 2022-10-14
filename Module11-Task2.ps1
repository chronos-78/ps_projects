# 2. Write a script to sort words in alphabet order from specific file and put them 
# into 26 text files named A.txt, B.txt, and so on up to Z.txt.

[CmdletBinding()]
    param (
        [string]$In        
    )
    end {
        $LETTERS = "abcdefghijklmnopqrstuvwxyz".ToCharArray()
        $set = [System.Collections.Generic.HashSet[string]]::new()
        (Get-Content $In) -split "[\s.,\n\(\)\[\]\d\""]" | ForEach-Object {
            if ($_.Length -gt 0) { 
                $null = $set.Add($_) 
            }
        }
        $res = $set | Sort-Object 
        foreach($letter in $LETTERS) {
            $file = $letter + ".txt"
            foreach($word in $res) {
                if ($word.Substring(0,1).ToLower() -eq $letter) {                    
                    Add-Content -Path $file -Value $word
                } 
            }
        }
    }