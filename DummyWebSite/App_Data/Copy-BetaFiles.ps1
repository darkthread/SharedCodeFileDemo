$betaPath = Join-Path $PSScriptRoot 'BetaFiles'
$publishUrl = Join-Path $PSScriptRoot '..'
Set-Location $betaPath
Get-ChildItem -Filter *.aspx_ -Recurse | ForEach-Object {
	$src = $_.FullName
	$relPath = Resolve-Path -Relative $src
	$tgt = (Join-Path $publishUrl $relPath).Replace('.aspx_', '.aspx');
	$ref = $tgt.Replace('-Beta.aspx', '.aspx')
	$rep1stLine = Get-Content $ref | Select-Object -First 1
	Get-Content $src | ForEach-Object {
		if ($rep1stLine) {
			Write-Output $rep1stLine
			$rep1stLine = $false
		}
		else { Write-Output $_ }
	} | Out-File -FilePath $tgt
	Write-Host "Copy Beta File: $tgt"
}
Set-Location $PSScriptRoot
Remove-Item $betaPath -Recurse
Remove-Item "$PSScriptRoot\*-BetaFiles.ps1"