# 4.  Write a script to convert a date of mm-dd-yyyy format to dd-mm-yyyy format.

$Date = $args[0]
$DateArray=$Date -split "-"
$NewDate= "$($DateArray[1])-$($DateArray[0])-$($DateArray[2])"
$NewDate