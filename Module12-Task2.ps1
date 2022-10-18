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
$csvData

#Read from  JSON 
$jsonFilePath = $HOME + "\WmiData.json"
$jsonData = Get-Content $jsonFilePath | ConvertFrom-Json 
$jsonData

#Read from XML
$xmlFilePath = $HOME + "\WmiData.xml"
$xmlData = [xml]$(Get-Content $xmlFilePath)
$xmlData2 = ConvertFrom-Xml($xmlData)
$xmlData2

#Read from YAML
$yamlData2 = Get-Content $yamlFilePath | ConvertFrom-Yaml 
$yamlData2