# 2. Write a script that it converts dash/underscore delimited words into camel and pascal casing.
# Example 1
# $InputString = "the-stealth-warrior"
#
# Result
# "theStealthWarrior"

# Example 2
# $InputString = "The_Stealth_Warrior"

# Result
#"TheStealthWarrior"
function CaseFun([string]$InputString) {
    $array = $InputString -split "[-_]"
    for ($i = 1; $i -lt $array.Count; $i++) {
        $array[$i] = (Get-Culture).TextInfo.ToTitleCase($array[$i])
    }
    -join $array
}

CaseFun("the-stealth-warrior")
CaseFun("The_Stealth_Warrior")