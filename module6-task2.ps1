# 2. Write a script that it converts dash/underscore delimited words into camel and pascal casing.
# Example 1
# $inputString = "the-stealth-warrior"
#
# Result
# "theStealthWarrior"

# Example 2
# $inputString = "The_Stealth_Warrior"

# Result
#"TheStealthWarrior"
function case_fun([string]$inputString) {
    $array = $inputString -split "[-_]"
    for ($i = 1; $i -lt $array.Count; $i++) {
        $array[$i] = (Get-Culture).TextInfo.ToTitleCase($array[$i])
    }
    -join $array
}

case_fun("the-stealth-warrior")
case_fun("The_Stealth_Warrior")



