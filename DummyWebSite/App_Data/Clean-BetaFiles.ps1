$betaPath = "$PSScriptRoot\BetaFiles"
if (Test-Path $betaPath) { 	Remove-Item $betaPath -Recurse }
[System.IO.Directory]::CreateDirectory($betaPath) | Out-Null
Set-Location $PSScriptRoot\..
Get-ChildItem -Filter *-Beta.aspx -Recurse | Where-Object {	$_.FullName -inotmatch 'app_data\\' } | ForEach-Object {
	$src = $_.FullName
	$relPath = Resolve-Path -Relative $src
	$tgt = [System.IO.Path]::ChangeExtension($betaPath + $relPath, ".aspx_")
	& echo F|xcopy $src $tgt /i
	Write-Host "Move Beta File: $src"
	Remove-Item $src
}