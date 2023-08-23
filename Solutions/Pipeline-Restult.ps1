# Find and kill the service Spooler & bits to then stop them using the pipeline
Get-Service spool*,*bits* | Stop-Service -Verbose

# Count out how many items are in the File1.txt in this folder (Not manually :) )
Get-Content -Path file1.txt | Measure-Object | Select-Object Count

# Count how many unique items the file contains
Get-Content -Path File1.txt | Get-Unique | Measure-Object | Select-Object Count

# Get all services and only return name and status
Get-Service * | Select-Object Name,Status | Out-GridView