<#
Excercise 2 : Error Handling

DO at least a try Catch to catch the error
Find out the exact error type that is being outputted
#>

$thebigarray = @(1,2,3,5,6,7,9,4,8)


foreach ($SingleString in $thebigarray){
    Write-Output "Hello Number:  $SingleString"
}

$thesortedArray = $thebigarray | sort 

$Filereader = Get-Content "C:\thisisthefile.txt"


$Filereader
foreach ($singleSorted in $thesortedArray){
    write-output "Hello Sorted number: $singleSorted"
    Add-Content 'AxxesWorkshop/thisisthefile.txt' $singleSorted
}
