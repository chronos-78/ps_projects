# 2. Write an advanced function to delete file from a specific folder if file size greater then specified size in Kb.
function Remove-FileBySize {
[CmdletBinding()]
    param (
        [string]$Folder,        
        [int]$Size

    )

    end{
        Get-ChildItem -File $Folder | Where-Object {$_.Length -gt $Size * 1024} | Remove-Item       
    }
}