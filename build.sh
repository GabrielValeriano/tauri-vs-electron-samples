#!/usr/bin/env bash

set -e

proj_root=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
hw_dir=$proj_root/hello-world
elec_hw_dir=$hw_dir/electron-hello-world
tauri_hw_dir=$hw_dir/tauri-hello-world

img_dir=$proj_root/image-demo
elec_img_dir=$img_dir/electron-image-demo
tauri_img_dir=$img_dir/tauri-image-demo

lottie_dir=$proj_root/lottie-demo
elec_lottie_dir=$lottie_dir/electron-lottie-demo
tauri_lottie_dir=$lottie_dir/tauri-lottie-demo

echo "Instalando Dependências..."

cd $elec_hw_dir
npm i
cd $elec_img_dir
npm i
cd $elec_lottie_dir
npm i

cd $tauri_hw_dir
npm i
cd $tauri_img_dir
npm i
cd $tauri_lottie_dir
npm i

echo "Construindo pacotes"

cd $elec_hw_dir
npm run make -- --targets=@electron-forge/maker-deb
cd $elec_img_dir
npm run make -- --targets=@electron-forge/maker-deb
cd $elec_lottie_dir
npm run make -- --targets=@electron-forge/maker-deb

cd $tauri_hw_dir
npm run tauri build
cd $tauri_img_dir
npm run tauri build
cd $tauri_lottie_dir
npm run tauri build
