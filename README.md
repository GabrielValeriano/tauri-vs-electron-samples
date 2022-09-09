# Exemplos para comparação das frameworks Tauri e Electron

Este repositório é uma adaptação das comparações do artigo ["macOS Performance Comparison: Flutter Desktop vs. Electron"](https://getstream.io/blog/flutter-desktop-vs-electron/), por Gordon H., e é **fortemente** baseado no repositório que foi fornecido no mesmo ([HayesGordon/flutter-desktop-vs-electron-samples](https://github.com/HayesGordon/flutter-desktop-vs-electron-samples)).

## Requisitos

É necessário instalar o [Node.js e NPM](https://nodejs.org/en/download/package-manager/), e o [suporte à linguagem Rust](https://www.rust-lang.org/pt-BR/learn/get-started) para executar os projetos abaixo.

## Hello World

Aplicação simples que exibe o texto "Hello World!" na tela.

### Hello World (Electron)

```sh
cd hello-world/electron-hello-world/
npm i
npm run start       # Inicia a aplicação no ambiente de desenvolvimento
npm run make        # Constrói os executáveis e pacotes para distribuição da aplicação
```

### Hello world (Tauri)

```sh
cd hello-world/tauri-hello-world/
npm i
npm run tauri dev   # Inicia a aplicação no ambiente de desenvolvimento
npm run tauri build # Constrói os executáveis e pacotes para distribuição da aplicação
```

## Image Demo

Aplicação que carrega diversas imagens de alta resolução do website [Lorem Picsum](https://picsum.photos/).

### Image Demo (Electron)

```sh
cd image-demo/electron-image-demo/
npm i
npm run start       # Inicia a aplicação no ambiente de desenvolvimento
npm run make        # Constrói os executáveis e pacotes para distribuição da aplicação
```

### Image Demo (Tauri)

```sh
cd image-demo/tauri-image-demo/
npm i
npm run tauri dev   # Inicia a aplicação no ambiente de desenvolvimento
npm run tauri build # Constrói os executáveis e pacotes para distribuição da aplicação
```

## Lottie Demo

Aplicação que carrega diversas animações [Lottie](http://airbnb.io/lottie) armazenadas em arquivos JSON.

### Lottie Demo (Electron)

```sh
cd lottie-demo/electron-lottie-demo/
npm i
npm run start       # Inicia a aplicação no ambiente de desenvolvimento
npm run make        # Constrói os executáveis e pacotes para distribuição da aplicação
```

### Lottie Demo (Tauri)

```sh
cd lottie-demo/tauri-lottie-demo/
npm i
npm run tauri dev   # Inicia a aplicação no ambiente de desenvolvimento
npm run tauri build # Constrói os executáveis e pacotes para distribuição da aplicação
```

## Executáveis e pacotes para distribuição

Após o comando `make` dos projetos Electron, os executáveis da aplicação estarão na pasta `{nome da aplicação}/electron-{nome da aplicação}/out/`. A pasta "make" dentro dessa é responsável por conter os pacotes para distribuição, e a outra, os executáveis sem necessidade de instalação.

Após o comando `tauri build`, o executável da aplicação estará em `/target/release/{nome da aplicação}`, e os pacotes para distribuição estarão em `/target/release/bundle/{tipo de pacote}/`, identificados pelo nome da aplicação.

## Erros

Nas aplicações Electron, pode ser necessário especificar o parâmetro `--targets` do comando `make`, por exemplo `npm run make -- --target=@electron-forge/maker-deb`, para que ele funcione. Mais informações na [Documentação oficial](https://www.electronforge.io/cli#make)
