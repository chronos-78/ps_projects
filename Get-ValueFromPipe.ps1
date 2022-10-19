# 2. Create a function that will get any array from the pipeline. Function output should be formatted according to the example below
function Get-ValueFromPipe { 

[CmdletBinding()]
    param
    (
	[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
	[string]	      
	$Value
    )
	
    process{
        Write-Host -ForegroundColor Yellow $("Value from pipe: " + $Value)
    }
}