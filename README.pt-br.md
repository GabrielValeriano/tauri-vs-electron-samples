# Exemplos para comparação das frameworks Tauri e Electron <!-- omit in toc -->

Pequenas aplicações feitas para a comparação das frameworks Tauri e Electron.

Este repositório é uma adaptação das comparações do artigo ["macOS Performance Comparison: Flutter Desktop vs. Electron"](https://getstream.io/blog/flutter-desktop-vs-electron/), por Gordon H., e é **fortemente** baseado no repositório que foi fornecido no mesmo ([HayesGordon/flutter-desktop-vs-electron-samples](https://github.com/HayesGordon/flutter-desktop-vs-electron-samples)).

## Índice <!-- omit in toc -->

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
- [Nota sobre Workspaces](#nota-sobre-workspaces)
- [Sobre esse repositório/conclusão](#sobre-esse-repositórioconclusão)

## Requisitos

É necessário instalar o [Node.js e NPM](https://nodejs.org/en/download/package-manager/), e o [suporte à linguagem Rust](https://www.rust-lang.org/pt-BR/learn/get-started) para executar os projetos abaixo.

## Compilando os projetos com o script de automação

A raiz do projeto contém scripts que baixam automaticamente as dependências de todos os projetos, geram os instaladores dos mesmos, exibem um relatório do tempo gasto por esses passos, e colocam os instaladores nas pastas `build/electron` e `build/tauri`.

### Linux

O script [build.sh](/build.sh) utiliza o interpretador de comandos Bash e é feito
para sistemas operacionais/distribuições Linux que utilizem pacotes Debian
(`.deb`) para instalar sua aplicações. Ele pode ser executado usando uma das
seguintes formas:

```sh
# Executando-o com o Bash diretamente
bash build.sh
```

Ou

```sh
# Fornecer permissão de execução do script
chmod +x build.sh
# e então executá-lo
./build.sh
```

### Windows

O script [build.ps1](/build.ps1) foi feito para ser executado no sistema
operacional Windows usando o PowerShell. Execute-o com o seguinte comando:

```powershell
.\build.ps1
```

**Nota**: Pode ser necessário mudar a política de execução para que o PowerShell
permita a execução desse script. Para isso, execute:

```powershell
Set-ExecutionPolicy Bypass -Scope Process
```

E então tente executar o script.

Esse comando configura a política de execução para que qualquer script possa ser executado (`Bypass`) durante a sessão atual do PowerShell (`-Scope Process`).

Após a execução do script, fechar e abrir o terminal é suficiente para desfazer a
configuração modificada da política de execução feita pelo comando acima.

Mais informações:
[Sobre Políticas de Execução (Microsoft)](https://learn.microsoft.com/pt-br/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-5.1)

## Compilando e executando os projetos manualmente

Também é possível executar os projetos manualmente. Para isso, entre na pasta de
cada projeto e execute os comandos adequados.

Antes, instale as dependências do projeto:

```sh
# Substitua o caminho abaixo pelo correto
cd pasta/do_projeto/Electron/ou_Tauri

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

Os arquivos gerados pelo comando `tauri build` ficam na pasta
`{raiz do repositório}/target/release/bundle/`.

- No Linux: `{raiz do repositório}/target/release/bundle/deb/`, arquivos com extensão `.deb` (Em distribuições Linux que usam pacotes Debian)

- No Windows: `{raiz do repositório}/target/release/bundle/msi/`, arquivos com a extensão `.msi`

### Projetos Electron

```sh
# Inicia a aplicação no ambiente de desenvolvimento:
npm run start

# Constrói os executáveis e pacotes para distribuição da aplicação:
npm run make
```

Os arquivos gerados pelo comando `make` ficam na pasta
`{raiz do projeto electron}/out/make/`.

- No Linux: `{raiz do projeto electron}/out/make/deb/x64/`, arquivos com extensão `.deb` (_Se_ foram feitos pacotes `.deb`)
- No Windows: `{raiz do projeto electron}/out/make/squirrel.windows/x64/`, arquivos com extensão `.exe`

No Linux, pode ser necessário especificar o parâmetro `--targets` do comando
`make` para que ele funcione. Por exemplo:

```sh
npm run make -- --targets=@electron-forge/maker-deb
```

Dessa forma, também é possível compilar para outras distribuições além das
baseadas no Debian, e usar seu próprio compilador com o Electron Forge. Mais
informações na [Documentação oficial](https://www.electronforge.io/cli#make).

## Aplicações nesse repositório

### Hello World

Aplicação que exibe o texto "Hello World!" na tela.

- Tauri: [/hello-world/tauri-hello-world/](/hello-world/tauri-hello-world/)
- Electron: [/hello-world/electron-hello-world/](/hello-world/electron-hello-world/)

### Image Demo

Aplicação que carrega diversas imagens de alta resolução do website
[Lorem Picsum](https://picsum.photos/).

- Tauri: [/image-demo/tauri-image-demo/](/image-demo/tauri-image-demo/)
- Electron: [/image-demo/electron-image-demo/](/image-demo/electron-image-demo/)

### Lottie Demo

Aplicação que carrega diversas animações [Lottie](http://airbnb.io/lottie)
armazenadas em arquivos JSON.

- Tauri: [/lottie-demo/tauri-lottie-demo/](/lottie-demo/tauri-lottie-demo/)
- Electron: [/lottie-demo/electron-lottie-demo/](/lottie-demo/electron-lottie-demo/)

## Nota sobre Workspaces

Os pacotes Cargo deste repositório estão todos num mesmo
[workspace Cargo](https://doc.rust-lang.org/book/ch14-03-cargo-workspaces.html),
como pode ser visto no arquivo [Cargo.toml](/Cargo.toml).
Isso foi feito para economizar tempo, já que o download das dependências de todos
esses pacotes pode ser feito de uma vez.

Porém, os pacotes NPM não estão juntos em um
[workspace NPM](https://docs.npmjs.com/cli/v7/using-npm/workspaces),
pois a ferramenta Electron Forge, ao executar o comando `package` dentro de um
workspace, não consegue localizar (sem configurações e dependências adicionais) o
executável do Electron, que passa a não estar mais na raiz do pacote.

Por isso, todas as dependências NPM devem ser baixadas separadamente e
repetidamente (como no script de automação), e todas as dependências Cargo são
baixadas ao mesmo tempo e apenas uma vez na execução do primeiro comando `build`
(`tauri build`, no caso).

## Sobre esse repositório/conclusão

Esse projeto foi usado para o desenvolvimento do meu Trabalho de Conclusão de
Curso (TCC).

No final, as comparações feitas confirmaram como a framework Tauri usa menos
espaço de armazenamento que a Electron, e muitas diferenças de performance
puderam ser observadas.

Porém, o uso de CPU, o uso de memória, o uso de GPU e as taxas de quadro por
segundo são dependentes do navegador web subjacente que cada framework utiliza.
Esses navegadores podem chegar a ser diferentes ou até semelhantes. No Linux, se
uma comparação for feita entre uma aplicação Electron e uma aplicação Tauri, os
navegadores subjacentes dessas serão o Chromium para a Electron e o WebKitGTK
para a Tauri, diferentes. No Windows, eles serão Chromium para a Electron e
WebView2 para a Tauri, WebView2 é baseado no Chromium, e por isso é semelhante.
Essa inconsistência torna essas métricas irrelevantes para a comparação das
duas frameworks se consideradas individualmente, e não como um todo na categoria
de diferenças entre plataformas.
