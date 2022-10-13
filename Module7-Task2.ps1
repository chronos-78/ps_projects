#2. Write a script that matches a word at the end of string.

$string = $args[0]
$null = $string -match '(?<lastword>\w+$)'
Write-Host $Matches['lastword']