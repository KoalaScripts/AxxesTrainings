# Start by updating your local help 
Update-Help

# Why does the command bellow not work? 
Get-Childitem *.txt C:\ 

# Find a command to get todays date

Get-Command -Name *Date*

# Find out how you can use powershell to get the day of the week from this date

Get-Date | Get-Member
(Get-Date).DayOfWeek

# Find a command to send out an email with 

Get-Command -name *Mail*

# With the information you found to send yourself an email  gmail : username laboaxxes@gmail.com pwd: Powershell2022!  

Send-MailMessage -From xavier.clinquart@axxes.com -to xavierclinquart@outlook.com -subject "Hello email" -body "Welcome to Powershell" -SmtpServer smtp.office365.com -Credential (Get-credential) -UseSsl -port 587

