# Check system symlink status, does not require admininstrator perm
$argsF = [ordered]@{}
fsutil behavior query symlinkEvaluation | foreach-object {
	$src,$dest,$status = $_.split(" ")[0,2,-1]
	$argsF["$($src[0])2$($dest.ToUpper()[0])"]="$(If ($status -eq "enabled.") {1} Else {0}) "
}
echo $argsF

