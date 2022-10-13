# 2. List user’s home directory file path and get datatype for it.

(Get-Item -Path $HOME).GetType().FullName