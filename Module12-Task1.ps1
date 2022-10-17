function Converter($str) {
    return [System.Management.ManagementDateTimeConverter]::ToDateTime($str).ToString("HH:mm:ss")
}

$processes = Get-WmiObject -Class Win32_Process | Select-Object ProcessId, Name,   
        @{Name='Start Time'; Expression={Converter($_.CreationDate)}}, 
        @{Name='Paged Memory Size (kb)'; Expression={$_.PageFileUsage}}   


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
$res = @{}
$processes | ForEach-Object  { $res[$_.ProcessId] = $_}

foreach($key in $res.Keys) {
    $res[$key].psobject.properties.Remove('ProcessId')
}
$yamlFilePath = $HOME + "\WmiData.yml"
$res | ConvertTo-Yaml | Out-File $yamlFilePath
$res2 = Get-Content $yamlFilePath | ConvertFrom-Yaml 
$res2