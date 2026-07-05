#Device name
$adapterName = "" #HERE

while ($true) {
    Write-Host "$(Get-Date) — restarting '$adapterName'..."
    
    Disable-NetAdapter -Name $adapterName -Confirm:$false
    Start-Sleep -Seconds 5
    Enable-NetAdapter -Name $adapterName -Confirm:$false
    
    Write-Host "Done."
    Start-Sleep -Seconds 600
}