# 1. Write a script to get 10 longest words chart and put them in separate file.
[CmdletBinding()]
    param (
        [string]$In,
        [string]$Out
    )
    end {
        $set = [System.Collections.Generic.HashSet[string]]::new()
        (Get-Content $In) -split "[\s.,\n\(\)]" | ForEach-Object {$null = $set.Add($_)}
        $res = $set | Sort-Object Length -Descending | Select-Object -First 10 
        $res | ForEach-Object {
            $str = "{0}:{1}" -f $_, $_.Length
            Add-Content -Path $Out -Value $str
        }
    }