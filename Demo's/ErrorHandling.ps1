#Return error when call fails. $PSItem.ToString() textual value of the error
try {
    [System.IO.File]::ReadAllText( '\\test\no\filefound.log')
}
catch {
    Write-Output "Ran into an issue: $($PSItem.ToString())"
}



#Return error when call fails. $PSItem.InvocationInfo for the error info context
try {
    [System.IO.File]::ReadAllText( '\\test\no\filefound.log')
}
catch {
    $PSItem.InvocationInfo | Format-List *
}

#Return error when call fails. $PSItem.Exception will return all the effective error info -> Will show the most valuable error info
try {
    [System.IO.File]::ReadAllText( '\\test\no\filefound.log')
}
catch {
    $PSItem.Exception
}

#Spot the difference in the Inner Exception type System.IO.FileNotFoundException and System.IO.IOException from the previous call
try {
    [System.IO.File]::ReadAllText( 'C:\Temp\filefound.log')
}
catch {
    $PSItem.Exception
}

#you can also split out the error message here
try {
    [System.IO.File]::ReadAllText( 'C:\Temp\filefound.log')
}
catch {
    $PSItem.Exception.Message
}

# Ability to have multiple Catches to specify the error type and message
try {
 $path = '\\test\no\filefound.log'
    [System.IO.File]::ReadAllText($path)
}
catch [System.IO.FileNotFoundException]
{
    Write-Output "Could not find $path"
}
catch [System.IO.IOException]
{
        Write-Output "IO error with the file: $path"
}

try {
    [System.IO.File]::ReadAllText( 'C:\Temp\filefound.log')
}
catch [System.IO.FileNotFoundException]
{
    Write-Output "Could not find $path"
}
catch [System.IO.IOException]
{
        Write-Output "IO error with the file: $path"
}

#you can also have multiple types in one catch block
try{
    [System.IO.File]::ReadAllText( 'C:\Temp\filefound.log')
}
catch [System.IO.DirectoryNotFoundException],[System.IO.FileNotFoundException]
{
        Write-Output "Directory not found: $path"
}
catch [System.Exception]
{
        Write-Output "Something went wrong: $path"
}


#Have a finally option that will execute code with or without the error being trown
try {
    [System.IO.File]::ReadAllText( '\\test\no\filefound.log')
}
catch {
    Write-Output "Ran into an issue: $($PSItem.ToString())"
}

finally {
    <#Do this after the try block regardless of whether an exception occurred or not#>
}


#Throwing errors from within a catch block
try {
    [System.IO.File]::ReadAllText( '\\test\no\filefound.log')
}
catch {
    Write-Output "Ran into an issue: $($PSItem.ToString())"
    throw #-> stops the command can be followed by an error or exception the code has to trow
    throw [System.MissingFieldException]::new('Could not access field',$PSItem.Exception)
}
