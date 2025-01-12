Get-ChildItem -Path ($env:USERPROFILE + "\Desktop" ) | Remove-Item -Recurse -Force
Get-ChildItem -Path "C:\Users\Public\Desktop" | Remove-Item -Recurse -Force
rm C:\A.msi
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons" -Force
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Type DWORD -Value 0
Stop-Process -Name "explorer" -Force
Add-WindowsCapability -Online -Name Language.zh-CN~Offline
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\MUI\UILanguages" -Name "Default" -Value zh-CN
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\MUI\UILanguages" -Name "InstallLanguage" -Value zh-CN
New-ItemProperty -Path "HKCU:\Control Panel\Desktop\ResourceLocale" -Value "00000804" -PropertyType String -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Name "(Default)" -Value "此电脑"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}" -Name "(Default)" -Value "回收站"
Stop-Process -Name "explorer" -Force
