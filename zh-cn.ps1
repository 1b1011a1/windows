$zipFilePath = "C:\zh-cn.zip"
$extractPath = "C:\zh-cn\"
if (Test-Path -Path $extractPath -PathType Container) {
    rm -rf C:\zh-cn
}
New-Item -Path $extractPath -ItemType Directory

$LangList = New-WinUserLanguageList zh-CN
$LangList[0].Handwriting = $false
Set-WinUserLanguageList $LangList -Force

Expand-Archive -Path $zipFilePath -DestinationPath $extractPath
$cabFiles = Get-ChildItem -Path $extractPath -Filter "*.cab"
$esdFiles = Get-ChildItem -Path $extractPath -Filter "*.esd"
foreach ($cabFile in $cabFiles) {
    dism /online /add-package /packagepath:$cabFile
}
foreach ($esdFile in $esdFiles) {
    dism /online /add-package /packagepath:$esdFile /norestart
}
DISM /Online /Add-Capability /CapabilityName:Language.Basic~~~zh-CN~0.0.1.0
DISM /Online /Add-Capability /CapabilityName:Language.Handwriting~~~zh-CN~0.0.1.0
DISM /Online /Add-Capability /CapabilityName:Language.OCR~~~zh-CN~0.0.1.0
DISM /Online /Add-Capability /CapabilityName:Language.Speech~~~zh-CN~0.0.1.0
DISM /Online /Add-Capability /CapabilityName:Language.TextToSpeech~~~zh-CN~0.0.1.0

Set-WinUILanguageOverride -Language zh-CN