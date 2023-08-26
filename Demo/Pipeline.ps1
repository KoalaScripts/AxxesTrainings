<#
    Checking if Pipeline is accepted
#>
Get-Help Start-Service -Parameter *

<#
    Getting services piping those trough to the next command 
#>
Get-Service bits | Stop-Service
Get-Service bits | Start-Service

<#
    Piped results can be filtered and piped on to the next command 
#>
Get-Printer | Select-Object Name,DriverName | Format-List
Get-Printer | Select-Object Name,DriverName | Format-Table
Get-Printer | Select-Object Name,DriverName | Out-GridView
Get-Printer | Select-Object BranchOfficeOfflineLogSizeMBName,DriverName | Export-Csv C:\temp\test.csv -NoTypeInformation -Delimiter ";"

<#
    Filtering behind the pipeline 
#>
Get-ChildItem | Where-Object {$_.Length -gt 50KB} | Select-Object Name, Length 

<#
    Pushing Piped commands to the limits 
#>
Get-ChildItem -Recurse | where-Object {$_.LastWriteTime -lt ((Get-Date).AddDays(-60)) -and $_.Length -gt 1MB}

Get-childitem -Path C:\Windows | Select-Object Name, @{Name='Length';Expression={if($_.Directory -ne $null){ '{0:N2} KB' -f ($_.length/1KB)}else{'Folder'}}} 

