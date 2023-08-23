<# Exercise 1 Logging:
The basic info is already created. 
Try to log the result into a file
#>

## Function Log
function Log{
    param(
        [Parameter (Mandatory=$True)][string] $Message
    )

    $Message = "LOG:: This is the Result:" + $Message

    Add-Content "AxxesWorkshop\log.log" $Message
}


$counter = 0

for($i=0;$i -lt 10;$i++){
    $Result = ++$counter

    Write-host -ForegroundColor yellow "The result is: $Result"
    Log "$($Result)"
}
