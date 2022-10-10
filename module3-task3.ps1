# 3. List some single file in user’s home directory and get datatype for it.

(Get-ChildItem -File $HOME)[0].GetType().FullName