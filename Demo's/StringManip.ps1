#Get all the possible options
"Hello world" | Get-Member

#Concatenate strings into one 
$h = "Hello" 
$w = "world"
$h + " " + $w
"$($h) $($w)"
"$h $w"
#Allowing a function to be executed first to your variable before it ending up in the text
"$($j.toString()) $h"

#using the join operator
$h,$w -join " "

#Adding text in specific places thanks to tags and the format operator
"{0} This is a text with manipulations in the {1}" -f $h,$w

#Splitting based string
$Temp = ("Hello world").split("ll")
$Temp
$Temp = ("Hello world of hello's").split("ll", 2)
$Temp
#Fetch a part of a string
("Hello world").Substring(2,5)
#Remove a part of a string
("Hello world").Remove(2,3)

# Use TrimStart, TrimEnd, or Trim. to remove spaces

#Compare 2 strings -1 when everything is the same but les chars , 0 when the same ,1 when different or extra chars
("Hello world").CompareTo("Hell0" + " " + "world")

("Hello world").Equals("Hello" + " " + "world")

("Hello world").Contains("Hello" + " " + "world")



#Operators
# -match -cmatch -notmatch
$message = 'there is an error with your file'
$message -match 'error'
$message -cmatch 'Error'

# -like -clike -notlike
#Like operator is used to match a pattern to a string. Needs to match exactly unless combined with the wildcard operator.
$message -like '*error*'

#Regex matching
'123-45-6789' -match '\d\d\d-\d\d-\d\d\d\d'

#Regex matching with Select string offers the option to match multiple. 
$data = 'The event runs from 2018-10-06 to 1018-10-09'
$datePattern = '\d\d\d\d-\d\d-\d\d'
$results = $data | Select-String $datePattern -AllMatches
$results.Matches.Value

