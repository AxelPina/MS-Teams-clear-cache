param([switch]$Elevated)
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
# Test if the script is running as Admin, if not, run it again as Admin.
if ((Test-Admin) -eq $false){ 
    if ($elevated) {
    } else {
        try{
            Start-Process powershell.exe -WindowStyle Hidden -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -elevated' -f ($MyInvocation.MyCommand.Definition))
# Clear Microsoft Teams cache

$challenge = Read-Host "Are you sure you want to delete the Microsoft Teams Cache (Y/N)?"

if ($challenge -eq "Y"){
    Write-Host "Stopping Teams" -ForegroundColor Yellow
    Get-Process -ProcessName Teams | Stop-Process -Force
    Clear-Host
    Write-Host "Teams Stopped, please wait..." -ForegroundColor Green

    Start-Sleep -Seconds 5
    Write-Host "Clearing Teams Disk Cache" -ForegroundColor Green
    try{
        Get-ChildItem -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Teams\blob_Storage" -recurse -force | Remove-Item -Confirm:$false
        Get-ChildItem -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Teams\cache" | Remove-Item -Confirm:$false
        Get-ChildItem -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Teams\databases" -recurse -force | Remove-Item -Confirm:$false
        Get-ChildItem -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Teams\gpucache" -force | Remove-Item -Confirm:$false
        Get-ChildItem -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Teams\IndexedDB" -recurse -force | Remove-Item -recurse -Confirm:$false
        Get-ChildItem -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Teams\Local Storage" -recurse -force | Remove-Item -recurse -Confirm:$false
        Get-ChildItem -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Teams\tmp" -recurse -force | Remove-Item -Confirm:$false
    }catch{
        Write-Output
    }
    Write-Host "Cleanup Complete. Please start Microsoft Teams." -ForegroundColor Green
    Write-Host "The command prompt will close in 10 seconds."
    Start-Sleep -Seconds 10
}
        }
        catch{          
            exit
        }
    }
    
}
