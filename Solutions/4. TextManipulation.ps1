#Remove all spaces from following string and print it
$a = 'Any task a computer can do better than a person is, by definition, a task requiring no human creativity or ingenuity.'
$a.Replace(' ', '')


#Split the string up on every comma and print them out underneath each other. Dont forget to get rid of any nasty spaces left behind
$a = 'Any task a computer can do better than a person is, by definition, a task requiring no human creativity or ingenuity.'
$a = $a.Split(',')
foreach($b in $a){
    Write-Host $b.Trim()
}

#loop over the list of strings and show the ones that contain the letter A in them.
$List = @("Walter","Bart" ,"Alex", "Felix", "Jenny", "Robbert")
foreach($item in $List){
    if($item.ToLower().contains('a')){
        Write-Host $item
    }
}

#Find the dates matching pattern dd/mm/yyyy and print them out.
$List = @("12-07-2008","18/05/19" ,"18/16/2019", "17/03/2028", "17-12-19", "3/3/2010")
foreach($item in $List){
    if($item -Match '^\d{2}/\d{2}/\d{4}$'){
        Write-Host $item
    }
}

#Fetch data from the axxes jobs website and get the jobtitles on the first page 
(Invoke-WebRequest -uri "https://www.axxes.com/jobs").Content  | Out-file "$CourseFolderPath\Temp.txt" -Force
$Page = Get-content "$CourseFolderPath\Temp.txt"
foreach($Line in $Page){
    if($line.Contains("c-job__title")){
        $Temp = $Line.Split('">')
        $temp = $Temp[1].Replace('</p>','')
        Write-Host $Temp
    }
}