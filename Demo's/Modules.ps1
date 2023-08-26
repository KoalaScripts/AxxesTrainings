$CourseFolderPath= "C:\Traneeship2022"
## MODULES
# Install locations
$Env:PSModulePath

# Look at the installed modules
Get-Module -ListAvailable 

# Install a module 
install-module Pester -RequiredVersion 3.4.0

# Look at all the Functions you have in a module (can also be trough google ;=) )
Get-Module PowerShellGet | Select-Object -ExpandProperty ExportedCommands 

# Get help with your commands 

Get-Help Pester

# Where do they come from 
Get-PSRepository

# https://www.powershellgallery.com/
# PowerShellGet
Find-Module -Name Vmware.*
Find-Module -Name Vmware.PowerCLI | Install-Module

# Making your own Modules to reuse your scripts 
# .psm1 file 
# Contains all functions -> All the functions require parameters to be defined 
# Help context can be usefull
# New-ModuleManifest to autogenerate a psd1 template
# See examples in folder \MyModule

Import-Module -Name "$CourseFolderPath\MyModule\MyModule.psm1"
#Command in action
Count-words "This is a self made command that counts the words you typed"
Get-Help Count-words
Get-Help Count-words -Examples

# Save the module 

Save-Module -Name Vmware.PowerCLI -Path C:\Temp\Vmware
