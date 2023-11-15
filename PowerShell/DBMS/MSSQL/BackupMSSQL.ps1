$fileName = $(Get-Date).ToString("yyyyMMdd")
$outputFolder="F:\Backup\$fileName\MSSQL"

function DoBackup([string]$output, [string]$server, [string]$db) 
{
	md "$outputFolder\$db"
	Backup-SqlDatabase -ServerInstance "$server" -Database "$db" -BackupFile "$outputFolder\$db\$db.bak"
	Compress-Archive -Path "$output\$db\$db.bak" -DestinationPath "$outputFolder\$db.zip"
	Remove-Item "$outputFolder\$db\" -Recurse
}

DoBackup($outputFolder, "localhost\SQL2019", "Axxxxxxxx")
