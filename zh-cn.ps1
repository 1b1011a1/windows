$zipFilePath = "C:\zh-cn.zip"
$extractPath = "C:\zh-cn\"
if (Test-Path -Path $extractPath -PathType Container) {
    rm -rf C:\zh-cn
}
New-Item -Path $extractPath -ItemType Directory
Expand-Archive -Path $zipFilePath -DestinationPath $extractPath
$cabFiles = Get-ChildItem -Path $extractPath -Filter "*.cab"
$esdFiles = Get-ChildItem -Path $extractPath -Filter "*.esd"
foreach ($cabFile in $cabFiles) {
    dism /online /add-package /packagepath:$cabFile
}
foreach ($esdFile in $esdFiles) {
    dism /online /add-package /packagepath:$esdFile /norestart
}