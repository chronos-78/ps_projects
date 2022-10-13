# 2. Write a script to find the occurrences of 10 most common words in a given text. 
# Use any article from Wikipedia as given text. Use pipelines as match as possible.

$result = @{}
$oResult = [ordered]@{}

(Get-Content $args[0]) -split "[\s.,\n\(\)]" | ForEach-Object {$result[$_]++}
$result.Remove("")   
$result.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 10 | ForEach-Object {$oResult[$_.Key] = $_.Value}

$oResult