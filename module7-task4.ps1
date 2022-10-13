# 4.  Write a script to convert a date of mm-dd-yyyy format to dd-mm-yyyy format.

$date = $args[0]
$dateArray = $date -split "-"
$newDate = "$($dateArray[1])-$($dateArray[0])-$($dateArray[2])"
$newDate