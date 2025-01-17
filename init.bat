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
  REM 禁用了，bug一堆。
  REM copy .\zh-cn.py C:\zh-cn.py
  REM copy .\1.PNG C:\1.png
  REM copy .\2.PNG C:\2.png
  REM copy .\3.PNG C:\3.png
  REM copy .\4.PNG C:\4.png
  REM copy .\5.PNG C:\5.png
  REM copy .\6.PNG C:\6.png
  REM copy .\7.PNG C:\7.png
  Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f
  "C:\Program Files\PowerShell\7\pwsh.exe" -ExecutionPolicy Bypass -File "C:\zh-cn.ps1"
  "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Set-WinSystemLocale zh-CN"
  echo | runas /user:Administrator "C:\Set.bat /set"
  net user Administrator yhr@666
  REM 禁用了，bug一堆。
  REM reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v SetSystem /t REG_SZ /d "C:\Set.bat /init" /f
  REM pip install opencv-python
  REM pip install numpy
  REM pip install pillow
  REM pip install pywinauto
  REM pip install pyautogui
  del /f /q C:\Set.bat
  del /f /q C:\zh-cn.zip
  del /f /q C:\zh-cn.ps1
  del /f /q /s C:\zh-cn\*
) else if "%1"=="/init" (
  REM 禁用了，bug一堆。
  REM reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v SetSystem /f
  REM echo 仅用于自动完成一些修改，不需要可以直接关掉。
  REM timeout /t 10 /nobreak
  REM python C:\zh-cn.py
) else if "%1"=="/set" (
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
  "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Set-WinUserLanguageList -LanguageList ( New-WinUserLanguageList zh-CN ) -Force"
  "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Set-WinUILanguageOverride -Language zh-CN"
)
