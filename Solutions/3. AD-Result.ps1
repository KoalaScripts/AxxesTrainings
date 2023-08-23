#Create Your own OU under the AD root give it your firstname as Name. In this OU Create 3 other OU's COMPUTERS, USERS and GROUPS
New-ADOrganizationalUnit -Name "XAVIER" -Path "DC=AXXES,DC=LABO"
New-ADOrganizationalUnit -Name "USERS" -Path "OU=XAVIER,DC=AXXES,DC=LABO"
New-ADOrganizationalUnit -Name "COMPUTERS" -Path "OU=XAVIER,DC=AXXES,DC=LABO"

#Move All users starting with the first letter of your name to the new user OU created above. 
Get-ADUser -Filter {Name -like "X*"} | Move-ADObject -TargetPath "OU=USERS,OU=XAVIER,DC=AXXES,DC=LABO"

#Count how many users are in this OU
(Get-ADUser -Filter * -SearchBase "OU=USERS,OU=XAVIER,DC=AXXES,DC=LABO").Count

#Have the users in your OU change there password at next logon
Get-ADUser -Filter * -SearchBase "OU=USERS,OU=XAVIER,DC=AXXES,DC=LABO" | Set-ADUser -ChangePasswordAtLogon $True 

#Find all users from the office Limburg and Luxemburg with a mobile number that starts with 0475... . Select and show name , office and mobile
Get-ADUser -Filter {(Office -eq "Limburg" -or Office -eq "Luxemburg") -and (mobile -like "0475*")} -properties * | Select-Object Name,Office,mobile

#Get the users and groups that a member of the "MAIN" group. Can you also show the users in the member groups?  
Get-ADGroupMember "Main" -Recursive

#Get lastlogon atribute from your own user and make the time show in a readable way DD/MM/YYYY uu:mm:ss  
Get-ADUser PSAdmin -Properties lastLogon | Select samaccountname, @{Name="lastLogon";Expression={[datetime]::FromFileTime($_.'lastLogon')}}