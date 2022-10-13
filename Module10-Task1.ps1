# 1. Write a script to list directory that contain files. Output is the same with Get-ChildItem cmdlet. 
# Print file size in megabytes (Mb).

Get-ChildItem $args[0] |
    Format-Table Mode, 
    @{
        name='LastWriteTime'
        expression={$_.LastWriteTime}
        formatstring='s'
        align='right'
    }, 
    @{
        name='Size (Mb)'
        expression={$_.Length/1MB}
        formatstring='N6'
    }, Name