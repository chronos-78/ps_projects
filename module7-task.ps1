$string = "Ents or talking trees are derived from the Old English word for giant"
$null = $string -match '(?<lastword>\w+$)'
$Matches['lastword']