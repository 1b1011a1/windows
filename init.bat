net user Administrator yhr@666 /add
net localgroup Administrators Administrator /add
echo y | del /s /f C:\Users\runningadmin\Desktop\*
echo y | del /s /f C:\Users\Public\Desktop\*
del /f C:\A.msi
"C:\Program Files\PowerShell\7\pwsh.exe" -Command "Add-WindowsCapability -Online -Name Language.zh-CN~Offline"
"C:\Program Files\PowerShell\7\pwsh.exe" -Command "Set-WinSystemLocale zh-CN"
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" "Set-WinUserLanguageList -LanguageList ( New-WinUserLanguageList zh-CN ) -Force"
taskkill /f /im explorer.exe & start explorer.exe
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v CheckedValue /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
copy .\init.bat C:\Set.bat
schtasks /create /tn "Set Init" /tr "C:\Set.bat" /sc onlogon
taskkill /f /im explorer.exe & start explorer.exe
