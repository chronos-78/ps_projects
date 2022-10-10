#1. Get all processes where name starts with C (capital C).

Get-Process | Where-Object {$_.Name -clike "C*"}