# 1. Write a script to find sequences of lowercase letters joined with underscore or dash.

$string = $args[0]
$pattern = "((?:\w+[-_]\w+)+),?"
$results = $string | Select-String $pattern -AllMatches
$results.Matches.Value