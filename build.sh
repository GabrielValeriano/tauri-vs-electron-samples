#!/usr/bin/env bash

set -e

bold=$(tput bold)
normal=$(tput sgr0)

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

echo "${bold}Aviso:${normal} O processo de construção dos instaladores, \
especialmente do primeiro dos projetos Tauri, \
pode demorar ${bold}muito${normal} tempo na primeira execução, pelo processo de download e compilação dos pacotes ${bold}cargo${normal}."
sleep 5
echo "Baixando Dependências NPM"
echo "Electron"

cd $elec_hw_dir
echo "Electron Hello World"
SECONDS=0
npm i
elec_hw_dep_time=$SECONDS

cd $elec_img_dir
echo "Electron Image Demo"
SECONDS=0
npm i
elec_img_dep_time=$SECONDS

cd $elec_lottie_dir
echo "Electron Lottie Demo"
SECONDS=0
npm i
elec_lottie_dep_time=$SECONDS

echo "Tauri"

cd $tauri_hw_dir
echo "Tauri Hello World"
SECONDS=0
npm i
tauri_hw_dep_time=$SECONDS

echo "Tauri Image Demo"
cd $tauri_img_dir
SECONDS=0
npm i
tauri_img_dep_time=$SECONDS

echo "Tauri Lottie Demo"
cd $tauri_lottie_dir
SECONDS=0
npm i
tauri_lottie_dep_time=$SECONDS

echo "Construindo Instaladores"
echo "Electron"

echo "Electron Hello World"
cd $elec_hw_dir
SECONDS=0
npm run make -- --targets=@electron-forge/maker-deb
elec_hw_build_time=$SECONDS

echo "Electron Image Demo"
cd $elec_img_dir
SECONDS=0
npm run make -- --targets=@electron-forge/maker-deb
elec_img_build_time=$SECONDS

echo "Electron Lottie Demo"
cd $elec_lottie_dir
SECONDS=0
npm run make -- --targets=@electron-forge/maker-deb
elec_lottie_build_time=$SECONDS

echo "Tauri"

echo "Tauri Hello World"
cd $tauri_hw_dir
SECONDS=0
npm run tauri build
tauri_hw_build_time=$SECONDS

echo "Tauri Image Demo"
cd $tauri_img_dir
SECONDS=0
npm run tauri build
tauri_img_build_time=$SECONDS

echo "Tauri Lottie Demo"
cd $tauri_lottie_dir
SECONDS=0
npm run tauri build
tauri_lottie_build_time=$SECONDS


echo "Relatório de tempo gasto"
echo "  Instalação de dependêcias"
echo "    Electron"
echo -e "      Hello World!:\t${elec_hw_dep_time}s"
echo -e "      Image Demo:\t${elec_img_dep_time}s"
echo -e "      Lottie Demo:\t${elec_lottie_dep_time}s"
echo -e "    Tauri"
echo -e "      Hello World!:\t${tauri_hw_dep_time}s"
echo -e "      Image Demo:\t${tauri_img_dep_time}s"
echo -e "      Lottie Demo:\t${tauri_lottie_dep_time}s"
echo -e "  Construção de instaladores"
echo -e "    Electron"
echo -e "      Hello World!:\t${elec_hw_build_time}s"
echo -e "      Image Demo:\t${elec_img_build_time}s"
echo -e "      Lottie Demo:\t${elec_lottie_build_time}s"
echo -e "    Tauri"
echo -e "      Hello World!:\t${tauri_hw_build_time}s"
echo -e "      Image Demo:\t${tauri_img_build_time}s"
echo -e "      Lottie Demo:\t${tauri_lottie_build_time}s"
mkdir -p $proj_root/build/electron
mkdir -p $proj_root/build/tauri
tauri_build=$proj_root/build/tauri
elec_build=$proj_root/build/electron
cp $proj_root/target/release/bundle/deb/*.deb $tauri_build/ 
find $proj_root -path "$proj_root/*/electron-*/out/make/deb/x64/*.deb" -exec cp "{}" $elec_build/ \;
echo "Os pacotes de instalação foram copiados e estão localizados na pasta build/{nome da framework}"
