<h1 align="center">SDK-iOS-POC</h1>

<p align="center">
  <strong>Uma biblioteca mínima para experimentar distribuição em Swift.</strong><br>
  Instalação com Swift Package Manager e uma API pública simples para começar.
</p>

<p align="center"><sub>Swift tools 6.0 · iOS 13+ · Swift Package Manager</sub></p>

<p align="center">
  <a href="#uso">Uso</a> &nbsp; · &nbsp;
  <a href="#instalação">Instalação</a> &nbsp; · &nbsp;
  <a href="#explorar-o-projeto">Explorar o projeto</a> &nbsp; · &nbsp;
  <a href="#estado-da-distribuição">Estado da distribuição</a>
</p>

## Uso

A API pública cabe em um exemplo:

```swift
import SDK_iOS_POC

let sdk = ClassPublic()
print(sdk.version) // 2.0
```

`ClassPublic` é uma **struct pública** com inicializador público e a propriedade de leitura `version`. O nome do módulo para `import` é `SDK_iOS_POC`, com underscores; o produto do pacote se chama `SDK-iOS-POC`, com hífens.

O projeto é uma prova de conceito de empacotamento. Seu fonte atual expõe esse tipo e o valor `2.0`; esse valor é definido no código e não acompanha automaticamente a versão da tag instalada.

## Instalação

Use uma ferramenta compatível com o manifesto **Swift tools 6.0**. O pacote declara **iOS 13** como versão mínima da plataforma e não declara dependências de terceiros.

### Em um projeto no Xcode

1. Adicione uma dependência Swift Package usando a URL:

   ```text
   https://github.com/guilhermepratac/SDK-iOS-POC.git
   ```

2. Selecione a versão exata **2.0.1**, uma tag existente no repositório.
3. Adicione o produto **SDK-iOS-POC** ao target que vai consumir a biblioteca.
4. Importe `SDK_iOS_POC` e execute o exemplo de uso.

<details>
<summary><strong>Em outro pacote Swift</strong></summary>

No array `dependencies` do seu `Package.swift`, acrescente:

```swift
.package(
    url: "https://github.com/guilhermepratac/SDK-iOS-POC.git",
    exact: "2.0.1"
)
```

Nas dependências do target consumidor, acrescente:

```swift
.product(name: "SDK-iOS-POC", package: "SDK-iOS-POC")
```

Use `import SDK_iOS_POC` no código desse target. Os trechos acima complementam um manifesto existente; não são um `Package.swift` completo.

</details>

## Explorar o projeto

```text
Package.swift                         Produto, target e plataforma mínima
Sources/SDK-iOS-POC/SDK_iOS_POC.swift   API pública e tipo interno de exemplo
SDK-IOS-POC.podspec                    Metadados de distribuição CocoaPods
```

- [Manifesto SwiftPM](Package.swift) — uma biblioteca e um target, sem target de testes.
- [Código da biblioteca](Sources/SDK-iOS-POC/SDK_iOS_POC.swift) — `ClassPublic` e o tipo interno `NewClass`.
- [Podspec](SDK-IOS-POC.podspec) — configuração que ainda precisa de alinhamento com os arquivos do repositório.

## Estado da distribuição

Os números presentes no projeto têm origens diferentes:

| Referência | Valor observado |
| --- | --- |
| [Tag usada neste guia](https://github.com/guilhermepratac/SDK-iOS-POC/tree/2.0.1) | `2.0.1` |
| Propriedade `ClassPublic.version` | `2.0` |
| Versão declarada no podspec | `1.0.3` |
| [GitHub Release marcada como Latest](https://github.com/guilhermepratac/SDK-iOS-POC/releases/latest) na revisão deste guia | `1.0.0` |

**Validação do exemplo.** Um consumidor SwiftPM local no macOS compilou a biblioteca, importou `SDK_iOS_POC` e executou o exemplo, obtendo `2.0`. Essa verificação não exercitou integração no simulador ou dispositivo iOS, resolução remota da tag em um projeto consumidor, nem instalação pelo CocoaPods. O repositório não contém uma suíte de testes automatizados.

<details>
<summary><strong>Pendências do CocoaPods e da referência de licença</strong></summary>

O podspec existente não foi validado com `pod lib lint` ou uma instalação. Há duas diferenças nos arquivos que precisam ser conferidas antes de apresentá-lo como um caminho de instalação pronto:

- `source_files` aponta para `Sources/SDK-IOS-POC/**/*`, mas o diretório versionado se chama `Sources/SDK-iOS-POC`. A capitalização é diferente e pode afetar ambientes com sistema de arquivos sensível a maiúsculas.
- O podspec declara MIT e referencia `LICENSE.md`, mas esse arquivo não está versionado na revisão documentada. Este README não acrescenta nem redefine uma licença.

A versão `1.0.3` do podspec também deve ser considerada separadamente da tag `2.0.1` usada nas instruções SwiftPM. A curadoria documental preserva o manifesto, o podspec e os fontes existentes.

</details>
