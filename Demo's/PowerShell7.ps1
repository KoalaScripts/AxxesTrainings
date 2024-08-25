#the ternary Operatora a ? b : c allows you to formulate a simplified “if-else” statement.
#[condition] ? [if-true] : [if-false]
$total = 10*5 -eq 20 ? 'yes' : 'no'
if(10*5 -eq 20){$total = 'yes'}else{$total = 'no'}

# Pipeline chain operators && and ||
# The && operator only allows execution of the second part if the first part succeeds
Write-Output 'Hello' && Write-Output 'World'

# The || operator only allows execution of the second part if the first part fails
Get-Process notepad -ErrorAction SilentlyContinue || "Notepad process is not available"

# Possibility to execute your for each loops in parallel
<# 
ForEach-Object
		[-InputObject ]
		-Parallel 
		[-ThrottleLimit ]
		[-TimeoutSeconds ]
		[-AsJob]
		[-WhatIf]
		[-Confirm]
		[]
#>
# Sequential processing
Measure-Command { 
    $port = '53','80','88','443' 
    $port | ForEach-Object { 
            Test-NetConnection -ComputerName 172.30.5.10 -Port $_
    }
} | Select-Object Minutes,Seconds

# Parallel processing
Measure-Command {
    $port = '53','80','88','443'
    $port | ForEach-Object -Parallel {
            Test-NetConnection -ComputerName 172.30.5.10 -Port $_ 
    }
} | Select-Object Minutes,Seconds


#The ability to use the PSReadline module for greater intelisence and help in the command line
Install-Module PSReadLine -AllowPrerelease -Force