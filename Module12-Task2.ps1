# 2. Write a script to create hash-tables based on data that stored in files from task 1.

function ConvertFrom-Xml($XML) {
    foreach ($Object in @($XML.Objects.Object)) {
        $PSObject = New-Object PSObject
        foreach ($Property in @($Object.Property)) {
            $PSObject | Add-Member NoteProperty $Property.Name $Property.InnerText
        }
        $PSObject
    }
}

#Read from CSV
$csvFilePath = $HOME + "\WmiData.csv"
$csvData = Get-Content $csvFilePath | ConvertFrom-Csv
Write-Host "CSV Data:"
$csvData | Format-Table

#Read from  JSON 
$jsonFilePath = $HOME + "\WmiData.json"
$jsonData = Get-Content $jsonFilePath | ConvertFrom-Json 
Write-Host "JSON Data:"
$jsonData | Format-Table

#Read from XML
$xmlFilePath = $HOME + "\WmiData.xml"
$xmlData = [xml]$(Get-Content $xmlFilePath)
$xmlData2 = ConvertFrom-Xml($xmlData)
Write-Host "XML Data:"
$xmlData2 | Format-Table

#Read from YAML
$yamlFilePath = $HOME + "\WmiData.yml"
$yamlData2 = Get-Content $yamlFilePath | ConvertFrom-Yaml 
Write-Host "YAML Data:"
$yamlData2 | Format-Table