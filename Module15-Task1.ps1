# 1. Create a function that will get a string and one of several switch 
# parameters and return the text from string with the color passed with switch parameter.

[CmdletBinding()]
    param (
        [string]$Text,
        [switch]$Red,
        [switch]$Green,
        [switch]$Blue
    )
    end {
        if ($Red) {
            Write-Host -ForegroundColor Red $Text
        }
        if ($Green) {
            Write-Host -ForegroundColor Green $Text
        }
        if ($Blue) {
            Write-Host -ForegroundColor Blue $Text
        }
    }