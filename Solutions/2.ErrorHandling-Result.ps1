<#
Excercise 2 : Error Handling

DO at least a try Catch to catch the error

#>

$thebigarray = @(1,2,3,5,6,7,9,4,8)


foreach ($SingleString in $thebigarray){
    Write-Output "Hello Number:  $SingleString"
}

$thesortedArray = $thebigarray | sort 

try{
    $Filereader = Get-Content "C:\thisisthefile.txt" -ErrorAction Stop
}
catch{
    $PSItem.Exception
    Write-Host -ForegroundColor Blue "Something went wrong reading the file: " $_
}
finally{
    Write-Output $Filereader
    foreach ($singleSorted in $thesortedArray){
        write-output "Hello Sorted number: $singleSorted"
        Add-Content 'AxxesWorkshop/thisisthefile.txt' $singleSorted
    }
}
