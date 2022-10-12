# 4. Write a script to create the multiplication table (from 1 to 10) of a number.
$num = [int]$args[0]
if ($num -ge 0 -and $num -le 9) {
    foreach ($i in 1..9) {
        $mul = $num * $i
        "{0} x {1} = {2}" -f $num, $i, $mul
    }
}