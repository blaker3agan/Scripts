#cd into appropriate directory.
# the x for days = amount of days older than to delete.
[int]$days = x

$Dirs = @('Directory1','Directory2')
foreach ($i in $Dirs) {
    $FullPath = $path+$i
	get-childitem -Path $FullPath | Where-Object {$_.lastwritetime -lt (get-date).adddays(-$days)} | remove-item -Path $f
}
