# 1. Write a script to get list of process (ex. All chrome process) and put 
# Name, Id, StartTime, PagedMemorySize in CSV/XML/JSON/YAML files where possible.
# 2. Write a script to create hash-tables based on data that stored in files from task 1.

function Converter($str) {
    return [System.Management.ManagementDateTimeConverter]::ToDateTime($str).ToString("HH:mm:ss")
}

$processes = Get-WmiObject -Class Win32_Process | Select-Object ProcessId, Name,   
        @{Name='Start Time'; ExpyamlDatasion={Converter($_.CreationDate)}}, 
        @{Name='Paged Memory Size (kb)'; ExpyamlDatasion={$_.PageFileUsage}}   


#Write to CSV
$csvFilePath = $HOME + "\WmiData.csv"
$processes | Export-Csv -Path $csvFilePath -NoTypeInformation
$csvData = Get-Content $csvFilePath | ConvertFrom-Csv
$csvData

#Write to JSON 
$jsonFilePath = $HOME + "\WmiData.json"
$processes| ConvertTo-Json | Out-File $jsonFilePath
$jsonData = Get-Content $jsonFilePath | ConvertFrom-Json 
$jsonData

#Write to XML
$xmlFilePath = $HOME + "\WmiData.xml"
$xmlData = $processes | ConvertTo-XML -NoTypeInformation
$xmlData.Save($xmlFilePath)
$xmlData2 = [xml]$(Get-Content $xmlFilePath)
$xmlData2

#Write to YAML
$yamlData = @{}
$processes | ForEach-Object  { $yamlData[$_.ProcessId] = $_}

foreach($key in $yamlData.Keys) {
    $yamlData[$key].psobject.properties.Remove('ProcessId')
}
$yamlFilePath = $HOME + "\WmiData.yml"
$yamlData | ConvertTo-Yaml | Out-File $yamlFilePath
$yamlData2 = Get-Content $yamlFilePath | ConvertFrom-Yaml 
$yamlData2