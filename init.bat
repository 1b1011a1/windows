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
  copy .\zh-cn.py C:\zh-cn.py
  copy .\1.PNG C:\1.png
  copy .\2.PNG C:\2.png
  copy .\3.PNG C:\3.png
  copy .\4.PNG C:\4.png
  copy .\5.PNG C:\5.png
  copy .\6.PNG C:\6.png
  copy .\7.PNG C:\7.png
  Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f
  "C:\Program Files\PowerShell\7\pwsh.exe" -ExecutionPolicy Bypass -File "C:\zh-cn.ps1"
  "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Set-WinSystemLocale zh-CN"
  echo | runas /user:Administrator "C:\Set.bat /set"
  net user Administrator yhr@666
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v SetSystem /t REG_SZ /d "C:\Set.bat /init" /f
  pip install opencv-python
  pip install numpy
  pip install pillow
  pip install pywinauto
  pip install pyautogui
) else if "%1"=="/init" (
  reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v SetSystem /f
  echo 仅用于自动完成一些修改，不需要可以直接关掉。
  timeout /t 10 /nobreak
  python C:\zh-cn.py
) else if "%1"=="/set" (
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
  "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Set-WinUserLanguageList -LanguageList ( New-WinUserLanguageList zh-CN ) -Force"
  "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Set-WinUILanguageOverride -Language zh-CN"
)
