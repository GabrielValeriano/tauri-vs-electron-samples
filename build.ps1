$hw_dir = Join-Path $PSScriptRoot "hello-world"
$elec_hw_dir = Join-Path $hw_dir "electron-hello-world"
$tauri_hw_dir = Join-Path $hw_dir "tauri-hello-world"

$img_dir = Join-Path $PSScriptRoot "image-demo"
$elec_img_dir = Join-Path $img_dir "electron-image-demo"
$tauri_img_dir = Join-Path $img_dir "tauri-image-demo"

$lottie_dir = Join-Path $PSScriptRoot "lottie-demo"
$elec_lottie_dir = Join-Path $lottie_dir "electron-lottie-demo"
$tauri_lottie_dir = Join-Path $lottie_dir "tauri-lottie-demo"


Write-Host -ForegroundColor White 'Aviso: ' -NoNewline;
Write-Host 'O processo de construção dos instaladores, especialmente do primeiro dos projetos Tauri, pode demorar ' -NoNewline
Write-Host -ForegroundColor White 'muito ' -NoNewline;
Write-Host 'tempo na primeira execução, pelo processo de download e compilação dos pacotes ' -NoNewline;
Write-Host -ForegroundColor White 'cargo' -NoNewline;
Write-Host '.';
Start-Sleep -Seconds 5

Write-Host "Baixando Dependências NPM"
Write-Host "Electron"

Write-Host "Electron Hello World"
Set-Location $elec_hw_dir
$elec_hw_dep_time=(Measure-Command { npm i | Out-Default}).TotalSeconds
Write-Host "Electron Image Demo"
Set-Location $elec_img_dir
$elec_img_dep_time=(Measure-Command { npm i | Out-Default}).TotalSeconds
Write-Host "Electron Lottie Demo"
Set-Location $elec_lottie_dir
$elec_lottie_dep_time=(Measure-Command { npm i | Out-Default}).TotalSeconds

Write-Host "Tauri Hello World"
Set-Location $tauri_hw_dir
$tauri_hw_dep_time=(Measure-Command { npm i | Out-Default}).TotalSeconds
Write-Host "Tauri Image Demo"
Set-Location $tauri_img_dir
$tauri_img_dep_time=(Measure-Command { npm i | Out-Default}).TotalSeconds
Write-Host "Tauri Lottie Demo"
Set-Location $tauri_lottie_dir
$tauri_lottie_dep_time=(Measure-Command { npm i | Out-Default}).TotalSeconds

Write-Host "Construindo Instaladores"

Write-Host "Electron"

Write-Host "Electron Hello World"
Set-Location $elec_hw_dir
$elec_hw_build_time=(Measure-Command { npm run make | Out-Default}).TotalSeconds

Write-Host "Electron Image Demo"
Set-Location $elec_img_dir
$elec_img_build_time=(Measure-Command { npm run make | Out-Default}).TotalSeconds

Write-Host "Electron Lottie Demo"
Set-Location $elec_lottie_dir
$elec_lottie_build_time=(Measure-Command { npm run make | Out-Default}).TotalSeconds

Write-Host "Tauri"

Write-Host "Tauri Hello World"
Set-Location $tauri_hw_dir
$tauri_hw_build_time=(Measure-Command { npm run tauri build | Out-Default}).TotalSeconds

Write-Host "Tauri Image Demo"
Set-Location $tauri_img_dir
$tauri_img_build_time=(Measure-Command { npm run tauri build | Out-Default}).TotalSeconds

Write-Host "Tauri Lottie Demo"
Set-Location $tauri_lottie_dir
$tauri_lottie_build_time=(Measure-Command { npm run tauri build | Out-Default}).TotalSeconds



Write-Output "Relatório de tempo gasto"
Write-Output "  Instalação de dependêcias"
Write-Output "    Electron"
Write-Output "      Hello World!:`t${elec_hw_dep_time}s"
Write-Output "      Image Demo:`t${elec_img_dep_time}s"
Write-Output "      Lottie Demo:`t${elec_lottie_dep_time}s"
Write-Output "    Tauri"
Write-Output "      Hello World!:`t${tauri_hw_dep_time}s"
Write-Output "      Image Demo:`t${tauri_img_dep_time}s"
Write-Output "      Lottie Demo:`t${tauri_lottie_dep_time}s"
Write-Output "  Construção de instaladores"
Write-Output "    Electron"
Write-Output "      Hello World!:`t${elec_hw_build_time}s"
Write-Output "      Image Demo:`t${elec_img_build_time}s"
Write-Output "      Lottie Demo:`t${elec_lottie_build_time}s"
Write-Output "    Tauri"
Write-Output "      Hello World!:`t${tauri_hw_build_time}s"
Write-Output "      Image Demo:`t${tauri_img_build_time}s"
Write-Output "      Lottie Demo:`t${tauri_lottie_build_time}s"

$elec_build = Join-Path $PSScriptRoot -ChildPath "build" | Join-Path -ChildPath "electron"
$tauri_build = Join-Path $PSScriptRoot -ChildPath "build" | Join-Path -ChildPath "tauri"
New-Item -ItemType Directory -ea 0 $elec_build
New-Item -ItemType Directory -ea 0 $tauri_build
Copy-Item (Get-ChildItem (Join-Path $PSScriptRoot -ChildPath "target\release\bundle\msi\tauri-*.msi" )) -Destination $tauri_build
Copy-Item (Get-ChildItem (Join-Path $PSScriptRoot -ChildPath "*\*\out\make\squirrel.windows\x64\*.exe")) -Destination $elec_build
Write-Host "Os pacotes de instalação foram copiados e estão localizados na pasta build\{nome da framework}"
Set-Location $PSScriptRoot