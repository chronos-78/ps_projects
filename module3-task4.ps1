# 4. List some single directory in user’s home directory and get datatype for it.

(Get-ChildItem -Directory $HOME)[0].GetType().FullName