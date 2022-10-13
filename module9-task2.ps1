# 2. Write a script to find the occurrences of 10 most common words in a given text. 
# Use any article from Wikipedia as given text. Use pipelines as match as possible.

$result = @{}
$o_result = [ordered]@{}

(Get-Content $args[0]) -split "[\s.,\n\(\)]" | ForEach-Object {$result[$_]++}
$result.Remove("")   
$result.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 10 | ForEach-Object {$o_result[$_.Key] = $_.Value}

$o_result