
# Start-Transcript
Start-Transcript -Path C:\logs\MyApp.log
# Out-file 
New-EventLog   -LogName Application -Source 'AxxesApp'
Write-EventLog -LogName "Application" -Source "AxxesApp" -EventID 3001 -EntryType Information -Message "MyApp added a user-requested feature to the display." -Category 1 -RawData 10,20

# inline logging 

#1 	Success stream 	PowerShell 2.0 	Write-Output
#2 	Error stream 	PowerShell 2.0 	Write-Error
#3 	Warning stream 	PowerShell 2.0 	Write-Warning
#4 	Verbose stream 	PowerShell 2.0 	Write-Verbose
#5 	Debug stream 	PowerShell 2.0 	Write-Debug
#6 	Information stream 	PowerShell 5.0 	Write-Information
#n/a 	Progress stream 	PowerShell 2.0 	Write-Progress

Write-Output "This is regular text output" # Does not do objects
Write-Error "This is an error message"
Write-Warning "This is a Warning message"
Write-verbose "This is a verbose message" -Verbose
Write-Debug "This is a debug message" -debug
Write-Information -MessageData "Writing out information about processes" -InformationAction Continue
Get-Process | Sort-Object CPU -Descending | Select-Object Id, ProcessName, CPU -First 10


function Test-Info
{
    Write-Output "This is regular text output" # Does not do objects
    Write-Error "This is an error message"
    Write-Warning "This is a Warning message"
    Write-verbose "This is a verbose message" -Verbose
    Write-Debug "This is a debug message" -debug
    Write-Information -MessageData "Writing out information about processes" -InformationAction Continue
    Get-Process | Sort-Object CPU -Descending | Select-Object Id, ProcessName, CPU -First 10
}
Test-Info 6> Info.txt

for ($i = 1; $i -le 100; $i++ )
{
    Write-Progress -Activity "Search in Progress" -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 250
}
