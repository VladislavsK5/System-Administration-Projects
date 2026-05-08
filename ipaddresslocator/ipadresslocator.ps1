try {
    $Ipaddress = Read-Host "Enter IP address to locate" #User enter IP address in command line

    $result = Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$Ipaddress" # free to use ip locator api

    Write-Output $result

    $result | Out-file "log.txt" -Append #all user request are logged in .txt file
}catch { #catch in case of error
    " Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    exit 1
}