####################################
####        Variables            ###
####################################

# Strings (Actually an array of chars ;) )
$Var = "This is Text"
# Integers , Float's, Boolians
$Var = 1 
$Var = 0,15
$Var = $true

#Type Declerations 
[int]$Int = 1
$Int.GetType()
[string]$String = "This is a string"
$String.GetType()

# Arrays
$Var = @(1,2,3)
$Var[1]

$Var = @((1,2),1,3)
$Var[0]
#Hashtables
$ageList = @{}
$key = 'Kevin'
$age = 36
$ageList.add( $key, $age )

$ageList.add( 'Alex', 9 )
$ageList["Alex"]

$ageList = @{
    "Kurt" = 17
    "Bart" = 38
}
$ageList.Count

#Environment Variables 
$Env:COMPUTERNAME

#Global Variables
$Global:Var = "Something you need everywhere"


#Objects 
$Item = Get-Service bits
# Multiple objects in one variable
$Items = Get-Process
$Items[0] 

#Inspecting the Object
$Item | Get-Member 
#Accessing Property's and sub Methods
$Item.Name 
$Item.ToString()


####################################
####        Statements           ###
####################################

# If statement
$Var = 5
if($Var -eq 5){
    Write-host "Its equal to 5"
}elseif($Var -eq 4){
    Write-host "Its equal to 4"
}else{
    <# Action when all if and elseif conditions are false #>
    Write-host "its not equal any statement"
}

#For and Foreach statements
$Items = Get-Process
foreach ($item in $Items){
    $Item.Name
}

for ($i=0;$i -le 10;$i++){
    $i
}
$i=1
while ($i -le 5) {                     # loop 5 times
    "{0,1}`t{1,2}" -f $i, ($i*$i)
    ++$i
}

$i=1
do {
    "{0,1}`t{1,2}" -f $i, ($i * $i)
}
while (++$i -le 5) 

#Difference between both
$i=6
while ($i -le 5) {                    
    "{0,1}`t{1,2}" -f $i, ($i*$i)
    ++$i
}

$i=6
do {
    "{0,1}`t{1,2}" -f $i, ($i * $i)
}
while (++$i -le 5) 

#Switch statements

$Var = 1

Switch($Var){
    1 {"Value equal to 1"}
    2 {"Value equal to 2"}
    default {"Default output if none match"}
}


####################################
####      Input and output       ###
####################################

#Read input from user -> Can also be secure
$Username = Read-Host "Please enter username"
$Pwd = Read-Host "Please enter Password" -AsSecureString

# Display messages to host , variables can be added to this
Write-host " This is a message"
Write-host $Username
Write-host "$($Username) was the input from the user"

#Write out or read out from files
"This is text" | Out-File Temp.txt
Get-Content .\Temp.txt

#Clear the terminal from any text AKA "cls"
Clear-host

