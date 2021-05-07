$Source = 'C:\Test\profiles.xml'
$Destination = 'C:\Users\*\.enterpriseManager\'
Get-ChildItem $Destination | ForEach-Object {Copy-Item -Path $Source -Destination $_ -Force}