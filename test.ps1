Get-Process | Sort-Object cpu -Descending | Select-Object -First 10
Get-Command  -Noun process
Get-command | Get-Member
Update-Help
Get-Help Get-Member -Examples
cls
Import-Module activedirectory
Get-ExecutionPolicy
$date = Get-Date
$date | Get-Member -MemberType method
$date.ToShortDateString()
$date | fl -Property *
(Get-Date).AddDays(-30)
(Get-Date).AddMonths(-1)
$a = [string]24
$a | Get-Member
$wmicomp = Get-WmiObject win32_computersystem
$wmicomp | Get-Member -MemberType Method
$wmicomp | Out-GridView
Get-WmiObject -List
Get-Process -Name lsass
Get-Process lsass
get-help about_*
Get-Help about_regular_expression
Get-Help Get-Date -Full > get-date-help.txt
notepad get-date-help.txt
Get-Date -Day 10 -ErrorAction Stop
Get-Service | Out-GridView
Get-Service | ConvertTo-Csv > services.csv
notepad services.csv
Get-Help Get-Date -Online 
Get-Help Get-Date -ShowWindow
Get-ChildItem
Set-Location env:
Set-Location c:
Get-Alias
get-command *alias
New-Alias np notepad.exe
np services.csv

Get-WinEvent | Select-Object -First 10 > first10events.txt
noteapdad.exe first10events.txt
New-Alias of Out-File
$processes = Get-Process
$processes > proc.txt

Get-Process | Measure-Object PM, VM -Average -Sum -Maximum -Minimum
Get-Process | where-object {$_.PM -gt 5000000} | sort-object PM -Descending | Select-Object name, PM, VM -First 10
Get-Process | where-object {$_.PM -gt 5000000} | sort-object PM -Descending | Select-Object name, PM, VM
Get-Process | where-object {$_.PM -gt 5000000} | sort-object PM -Descending | Select-Object name, PM, VM | Format-Table -AutoSize -Wrap
Get-Process | where-object {$_.PM -gt 5000000} | sort-object PM -Descending | Select-Object name, PM, VM | measure-object
Get-Process | Sort-Object PM -Descending | ForEach-Object {$name=$_.ProcessName;$PM=$_.PM;$VM=$_.VM;write-output "Name: $name, Paged Memory: $PM, Virtual Memory: $VM"}
# -whatif kollar vad som händer för ett kommando
# -confirm ger Y/N
$cred = Get-Credential -Message "Ange ditt username och password"
$cred
[System.Diagnostics.Process]::Start("powershell","-noexit",$cred.UserName,$cred.Password,"localhost")
$pwd = Read-Host -Prompt "Password" -AsSecureString
[System.Diagnostics.Process]::Start("mmc","compmgmt.msc","TP1\SEDEGERMANE",$pwd,"localhost")
[System.Diagnostics.Process]::Start("powershell","-noexit","TP1\SEDEGERMANE",$pwd,"localhost")
[System.Diagnostics.Process]::Start("powershell")
[Math]::PI
Get-Service vss | Format-List -Property *
"{0:C}" -f 10
"{0:E3}" -f 10000
"{0:P}" -f 0.5
"{0:X}" -f 255
$text1 = "Hej"
"{0} {1}" -f $text1, $env:USERNAME
"Rader`n" * 5
Get-Process | Sort-Object VM -Descending | Format-Table name, @{expression={"{0:N0}MB" -f ($_.VM/1MB)};Label="VM"} -AutoSize
Set-PSDebug -Trace 0
$Error
$Error[0] | fl -Property *
$?