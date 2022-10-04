# Exemplos para comparação das frameworks Tauri e Electron

Pequenas aplicações feitas para a comparação das frameworks Tauri e Electron.

Este repositório é uma adaptação das comparações do artigo ["macOS Performance Comparison: Flutter Desktop vs. Electron"](https://getstream.io/blog/flutter-desktop-vs-electron/), por Gordon H., e é **fortemente** baseado no repositório que foi fornecido no mesmo ([HayesGordon/flutter-desktop-vs-electron-samples](https://github.com/HayesGordon/flutter-desktop-vs-electron-samples)).

## Índice

- [Requisitos](#requisitos)
- [Compilando os projetos com o script de automação](#compilando-os-projetos-com-o-script-de-automação)
  - [Linux](#linux)
  - [Windows](#windows)
- [Compilando e executando os projetos manualmente](#compilando-e-executando-os-projetos-manualmente)
  - [Projetos Tauri](#projetos-tauri)
  - [Projetos Electron](#projetos-electron)
- [Aplicações nesse repositório](#aplicações-nesse-repositório)
  - [Hello World](#hello-world)
  - [Image Demo](#image-demo)
  - [Lottie Demo](#lottie-demo)

## Requisitos

É necessário instalar o [Node.js e NPM](https://nodejs.org/en/download/package-manager/), e o [suporte à linguagem Rust](https://www.rust-lang.org/pt-BR/learn/get-started) para executar os projetos abaixo.

## Compilando os projetos com o script de automação

A raiz do projeto contém scripts que baixam automaticamente as dependências de todos os projetos, geram os instaladores dos mesmos, exibem um relatório do tempo gasto por esses passos, e colocam os instaladores nas pastas `build/electron` e `build/tauri`.

### Linux

O script [build.sh](/build.sh) é feito para sistemas operacionais/distribuições Linux que utilizem pacotes Debian (`.deb`) para instalar sua aplicações, utilizando o interpretador de comandos Bash. Pode ser executado usando uma seguintes formas:

```sh
bash build.sh
```

Ou

```sh
chmod +x build.sh # Fornecer permissão de execução do script
./build.sh
```

### Windows

O script [build.ps1](/build.ps1) foi feito para ser executado no sistema operacional Windows usando o PowerShell. Execute o seguinte:

```powershell
.\build.ps1
```

**Nota**: Pode ser necessário mudar a política de execução para que o PowerShell permita a execução desse script. Para isso, execute:

```powershell
Set-ExecutionPolicy Bypass -Scope Process
```

E então tente executar o script.

Esse comando configura a política de execução para que qualquer script possa ser executado durante a sessão atual do PowerShell.

Após a execução do script, fechar e abrir o terminal após a execução dos comandos acima é suficiente para desfazer a configuração modificada da política de execução.

Mais informações: [Sobre Políticas de Execução (Microsoft)](https://learn.microsoft.com/pt-br/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-5.1)

## Compilando e executando os projetos manualmente

Também é possível executar os projetos manualmente. Para isso, entre na pasta de cada projeto e execute os comandos adequados.

Antes, instale as dependências do projeto:

```sh
# Substitua o caminha abaixo pelo correto
cd pasta/do_projeto/electron/ou_tauri

# Baixa as dependências:
npm install
```

### Projetos Tauri

```sh
# Inicia a aplicação no ambiente de desenvolvimento:
npm run tauri dev

# Constrói os instaladores da aplicação:
npm run tauri build
```

Os arquivos gerados pelo comando `tauri build` ficam na pasta `{raiz do repositório}/target/release/bundle/`.

- No Linux: `{raiz do repositório}/target/release/bundle/deb/`, arquivos com extensão `.deb` (Em distribuições linux que usam pacotes Debian)

- No Windows: `{raiz do repositório}/target/release/bundle/msi/`, arquivos com a extensão `.msi`

### Projetos Electron

```sh
# Inicia a aplicação no ambiente de desenvolvimento:
npm run start

# Constrói os executáveis e pacotes para distribuição da aplicação:
npm run make
```

Os arquivos gerados pelo comando `make` ficam na pasta `{raiz do projeto electron}/out/make/`.

- No Linux: `{raiz do projeto electron}/out/make/deb/x64/`, arquivos com extensão `.deb` (Se foram feitos pacotes `.deb`)
- No Windows: `{raiz do projeto electron}/out/make/squirrel.windows/x64/`, arquivos com extensão `.exe`

No linux, pode ser necessário especificar o parâmetro `--targets` do comando `make` para que ele funcione. Por exemplo:

```sh
npm run make -- --target=@electron-forge/maker-deb
```

Dessa forma, também é possível compilar para outras distribuições além das baseadas no Debian, e usar seu próprio compilador com o Electron Forge. Mais informações na [Documentação oficial](https://www.electronforge.io/cli#make).

## Aplicações nesse repositório

### Hello World

Aplicação simples que exibe o texto "Hello World!" na tela.

- Tauri: [/hello-world/tauri-hello-world/](/hello-world/tauri-hello-world/)
- Electron: [/hello-world/electron-hello-world/](/hello-world/electron-hello-world/)

### Image Demo

Aplicação que carrega diversas imagens de alta resolução do website [Lorem Picsum](https://picsum.photos/).

- Tauri: [/image-demo/tauri-image-demo/](/image-demo/tauri-image-demo/)
- Electron: [/image-demo/electron-image-demo/](/image-demo/electron-image-demo/)

### Lottie Demo

Aplicação que carrega diversas animações [Lottie](http://airbnb.io/lottie) armazenadas em arquivos JSON.

- Tauri: [/lottie-demo/tauri-lottie-demo/](/lottie-demo/tauri-lottie-demo/)
- Electron: [/lottie-demo/electron-lottie-demo/](/lottie-demo/electron-lottie-demo/)
