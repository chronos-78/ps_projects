# 1. Write a script to get list of process (ex. All chrome process) and put 
# Name, Id, StartTime, PagedMemorySize in CSV/XML/JSON/YAML files where possible.

function Converter($str) {
    return [System.Management.ManagementDateTimeConverter]::ToDateTime($str).ToString("HH:mm:ss")
}

$processes = Get-WmiObject -Class Win32_Process | Select-Object ProcessId, Name,   
        @{Name='Start Time'; Expression={Converter($_.CreationDate)}}, 
        @{Name='Paged Memory Size (kb)'; Expression={$_.PageFileUsage}}   


#Write to CSV
$csvFilePath = $HOME + "\WmiData.csv"
$processes | Export-Csv -Path $csvFilePath -NoTypeInformation

#Write to JSON 
$jsonFilePath = $HOME + "\WmiData.json"
$processes| ConvertTo-Json | Out-File $jsonFilePath

#Write to XML
$xmlFilePath = $HOME + "\WmiData.xml"
$xmlData = $processes | ConvertTo-XML -NoTypeInformation
$xmlData.Save($xmlFilePath)

#Write to YAML
$yamlData = @{}
$processes | ForEach-Object  { $yamlData[$_.ProcessId] = $_}

foreach($key in $yamlData.Keys) {
    $yamlData[$key].psobject.properties.Remove('ProcessId')
}
$yamlFilePath = $HOME + "\WmiData.yml"
$yamlData | ConvertTo-Yaml | Out-File $yamlFilePath