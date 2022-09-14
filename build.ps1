$hw_dir = Join-Path $PSScriptRoot "hello-world"
$elec_hw_dir = Join-Path $hw_dir "electron-hello-world"
$tauri_hw_dir = Join-Path $hw_dir "tauri-hello-world"

$img_dir= Join-Path $PSScriptRoot "image-demo"
$elec_img_dir= Join-Path $img_dir "electron-image-demo"
$tauri_img_dir=Join-Path $img_dir "tauri-image-demo"

$lottie_dir = Join-Path $PSScriptRoot "lottie-demo"
$elec_lottie_dir = Join-Path $lottie_dir "electron-lottie-demo"
$tauri_lottie_dir = Join-Path $lottie_dir "tauri-lottie-demo"

Write-Output "Instalando Dependências..."

Set-Location $elec_hw_dir 
npm i
Set-Location $elec_img_dir 
npm i
Set-Location $elec_lottie_dir 
npm i 

Set-Location $tauri_hw_dir
npm i
Set-Location $tauri_img_dir
npm i
Set-Location $tauri_lottie_dir
npm i

Write-Output "Construindo pacotes"

Set-Location $elec_hw_dir
npm run make
Set-Location $elec_img_dir
npm run make
Set-Location $elec_lottie_dir
npm run make

Set-Location $tauri_hw_dir
npm run tauri build 
Set-Location $tauri_img_dir
npm run tauri build
Set-Location $tauri_lottie_dir
npm run tauri build

Set-Location $PSScriptRoot
