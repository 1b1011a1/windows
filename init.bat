@echo off
if "%1"=="" (
  net user Administrator yhr@666 /add
  net localgroup Administrators Administrator /add
  echo y | del /q /s /f C:\Users\runningadmin\Desktop\*
  echo y | del /q /s /f C:\Users\Public\Desktop\*
  del /q /f C:\A.msi
  del /q /f C:\A.zip
  reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v CheckedValue /t REG_DWORD /d 1 /f
  copy .\init.bat C:\Set.bat
  schtasks /create /tn "Set Chinese" /tr "C:\Set.bat /set" /sc onlogon
  taskkill /f /im explorer.exe & start explorer.exe
) else (
    if "%1"=="/set" (       
      schtasks /delete /tn "Set Chinese"
      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
      echo Yes | reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesResolve" /f
      taskkill /f /im explorer.exe & start explorer.exe
      pip install opencv-python
      pip install numpy
      pip install pillow
      pip install pywinauto
      pip install pyautogui
    )
)
