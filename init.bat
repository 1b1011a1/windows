@echo off
if "%1"=="" (
  net user Administrator /add
  net localgroup Administrators Administrator /add
  echo y | del /q /s /f C:\Users\runningadmin\Desktop\*
  echo y | del /q /s /f C:\Users\Public\Desktop\*
  del /q /f C:\A.msi
  del /q /f C:\A.zip
  reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v CheckedValue /t REG_DWORD /d 1 /f
  copy .\init.bat C:\Set.bat
  copy .\zh-cn.zip C:\zh-cn.zip
  copy .\zh-cn.ps1 C:\zh-cn.ps1
  copy .\WallPaper\1.py C:\1.py
  copy .\WallPaper\2.jpg C:\Windows\Web\Wallpaper\Windows\WallPaper.jpg
  Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f
  pip install ctypes
  "C:\Program Files\PowerShell\7\pwsh.exe" -ExecutionPolicy Bypass -File "C:\zh-cn.ps1"
  "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Set-WinSystemLocale zh-CN"
  echo | runas /user:Administrator "C:\Set.bat /set"
  net user Administrator yhr@666
  del /f /q C:\Set.bat
  del /f /q C:\zh-cn.zip
  del /f /q C:\zh-cn.ps1
  del /f /q /s C:\zh-cn\*
) else if "%1"=="/set" (
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
  "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Set-WinUserLanguageList -LanguageList ( New-WinUserLanguageList zh-CN ) -Force"
  "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Set-WinUILanguageOverride -Language zh-CN"
  python C:\1.py
)
