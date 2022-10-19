# Calling function that will get a string and one of several switch 
# parameters and return the text from string with the color passed with switch parameter.

. .\Write-ColoredMessage.ps1    
Write-ColoredMessage -Text "Hello there!" -Red
Write-ColoredMessage -Text "Hello there!" -Green
Write-ColoredMessage -Text "Hello there!" -Blue