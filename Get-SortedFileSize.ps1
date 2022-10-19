# 1. Write an advanced function to show the size of files in specific folder and sort all of them by size.
function Get-SortedFileSize {
[CmdletBinding()]
    param (
        [string]$Directory
    )
    end{
        Get-ChildItem -File $Directory | Select-Object Name,Length | Sort-Object Length -Descending
    }
}