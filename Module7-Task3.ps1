# 3. Write a script that matches an IP address.
# https://regex101.com/r/KLr1gj/1

$string = $args[0]
$pattern = "(?:(?:1\d\d|2[0-5][0-5]|2[0-4]\d|0?[1-9]\d|0?0?\d)\.){3}(?:1\d\d|2[0-5][0-5]|2[0-4]\d|0?[1-9]\d|0?0?\d)"
$results = $string | Select-String $pattern -AllMatches
$results.Matches.Value