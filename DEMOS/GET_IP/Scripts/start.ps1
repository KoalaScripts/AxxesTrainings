$rootPath = Split-Path $PSScriptRoot -Parent

#$input = "sv-arg-hdds-v11"
$inputFile = Get-Content -Path "$rootPath\inputFiles\testList.txt"
$outputFile = "$rootPath\outputFiles\result.txt"

if (Test-Path -Path $outputFile){
    remove-item -Path $outputFile
}


foreach($single in $inputFile){
    $output = (Resolve-DnsName $single).IPAddress
    write-host $single --> $output
    "$output" | Out-File -FilePath $outputFile -Append
}
