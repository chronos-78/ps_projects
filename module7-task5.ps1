# 5. Write a script to find all words which are at least 6 characters long in a string.

$string = $args[0]
$pattern = "[a-zA-Z]{6,}"
$results = $string | Select-String $pattern -AllMatches
$results.Matches.Value