function Converter($str) {
    return [System.Management.ManagementDateTimeConverter]::ToDateTime($str).ToString("HH:mm:ss")
}

$res = @{}

$processes = Get-WmiObject -Class Win32_Process | Select-Object ProcessId, Name,   
        @{Name='Start Time'; Expression={Converter($_.CreationDate)}}, 
        @{Name='Paged Memory Size (kb)'; Expression={$_.PageFileUsage}}   

$processes | ForEach-Object  { $res[$_.ProcessId] = $_}

foreach($key in $res.Keys) {
    $res[$key].psobject.properties.Remove('ProcessId')
}

#Write to CSV
$csvFilePath = $HOME + "\WmiData.csv"
$processes | Export-Csv -Path $csvFilePath -NoTypeInformation

#Write to XML
$xmlFilePath = $HOME + "\WmiData.xml"
$xmlData = $processes | ConvertTo-XML -NoTypeInformation
$xmlData.Save($xmlFilePath)

#Write to JSON 
$jsonFilePath = $HOME + "\WmiData.json"
$processes| ConvertTo-Json | Out-File $jsonFilePath

#Write to YAML
$yamlFilePath = $HOME + "\WmiData.yml"
$processes| ConvertTo-Yaml | Out-File $yamlFilePath