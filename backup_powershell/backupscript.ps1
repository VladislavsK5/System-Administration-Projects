while($true) {

    $SourceDir = "<your_source_directory_here>" # your source directory here
    $BackupDir = "D:\Backups\" # your backup directory here
    $MaxBackups = 5 # maximum number of backups to keep
    $Interval = 600 # interval in seconds (10 minutes)

    $Timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss" #timestamp for backup file name
    $ZipPath = Join-Path -Path $BackupDir -ChildPath "SBackup_$Timestamp.zip" # backup file name with timestamp

    if (!(Test-Path $BackupDir)) { New-Item -ItemType Directory -Path $BackupDir } # create backup directory if it doesn't exist

    Write-Host "Backing up..." # start backup process
    Compress-Archive -Path $SourceDir -DestinationPath $ZipPath -Force # create zip archive of the source directory

    Get-ChildItem $BackupDir -Filter "*.zip" | Sort-Object LastWriteTime -Descending | Select-Object -Skip $MaxBackups | Remove-Item -Force # remove old backups if exceeding max limit

    Write-Host "Done! Next backup in $($Interval / 60) minutes." # display completion message and next backup time
    
    Start-Sleep -Seconds $Interval
}