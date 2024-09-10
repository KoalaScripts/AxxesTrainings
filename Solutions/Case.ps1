function Get-RandomPassword ($int) {
    Add-Type -AssemblyName 'System.Web'
    return [System.Web.Security.Membership]::GeneratePassword($int, 1)
}



# Get a module to read out Excel files
# Install-Module -Name ImportExcel
$Array = New-Object System.Collections.ArrayList

Import-Excel .\NewUserList.xlsx -OutVariable Users
foreach($user in $Users){
  $Password = Get-RandomPassword 20
  $Username = "{0}.{1}" -f $User.'First Name' , $user.'Last Name'
  $Email = "{0}@axxes.labo" -f $Username
  $Description = Get-Date -Format "dd/mm/yyyy"
  try {
    Get-ADOrg 
    New-AdOrg 
  }
  catch {
  }

  New-ADUser -Name $Username -Accountpassword $Password -Enabled $true -0ffice $User.Office -SamAccountName $Username -Description $Description -EmailAddress $Email -Path"OU=$User.office
  $Array.Add([PSCustomObject]@{Name = $Username;  Password = $Password})

} 
$Array | Export-Excel -Path Output.xlsx