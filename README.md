# Quero Workar — As melhores vagas de TI estão aqui!

O QueroWorkar é um aplicativo que conecta profissionais e empresas de forma prática e direta.

![Banner da aplicação](./banner.png)

## Um pouco de história

Esta é a versão mobile da plataforma QueroWorkar, que após ter sido retirada do ar em 2019, retornou e foi finalmente descontinuada por volta de 2021. Desenvolvi o aplicativo como forma de retribuição e também para aplicar meus conhecimentos em desenvolvimento mobile, já que o QueroWorkar foi onde encontrei as primeiras vagas quando comecei a estudar programação e sonhava em ingressar na área de tecnologia.

> **Nota:** O aplicativo esteve disponível na Play Store, mas como dependia da plataforma, também deixou de ser mantido e foi removido.

---

### Tecnologias e pacotes utilizados

- [Dart](https://dart.dev/) como linguagem principal
- [Flutter](https://flutter.dev/) como framework multiplataforma
- [get_it](https://pub.dev/packages/get_it) para injeção de dependências
- [Dio](https://pub.dev/packages/dio) para requisições web
- [Dio Cache Interceptor](https://pub.dev/packages/dio_cache_interceptor) para cache das requisições
- [Cached Network Image](https://pub.dev/packages/cached_network_image) para cache das imagens
- [HTML](https://github.com/dart-lang/html) e [Flutter HTML](https://github.com/Sub6Resources/flutter_html) para transformar HTML em widgets
- [Bloc](https://pub.dev/packages/bloc) e [Flutter Bloc](https://pub.dev/packages/flutter_bloc) para gerenciamento de estado
- [Hydrated Bloc](https://pub.dev/packages/hydrated_bloc) para persistência dos estados
- [Equatable](https://pub.dev/packages/equatable) para comparação de objetos

---

### Estrutura de pastas e arquivos

```
lib:
│   main.dart
├───blocs/...
├───data/...
│   ├───models/...
│   └───repositories/...
├───di/...
├───shared/
│   ├───constants/...
│   └───widgets/...
└───ui/
    └───pages/
        │   ...
        └───home_page/
            │   home_page.dart
            └───widgets/...
```

---

## Como rodar o projeto

Primeiro, clone o repositório:

```sh
git clone https://github.com/robsonsilv4/queroworkar.git quero_workar
cd quero_workar
```

Depois, instale as dependências:

```sh
flutter pub get
```

E execute no seu dispositivo ou emulador:

```sh
flutter run
```

---

## Como gerar o instalador

Para gerar o instalador APK, execute:

```sh
flutter build apk --split-per-abi
```

Para instalar diretamente no dispositivo ou emulador:

```sh
flutter install
```

Os arquivos gerados ficam em:

```sh
quero_workar/build/app/outputs/apk/release/
```

---

## Como contribuir

Você pode contribuir de várias formas: instalando o aplicativo e dando feedback, abrindo issues, melhorando ou traduzindo a documentação, sugerindo ou implementando novas funcionalidades, compartilhando o projeto, ou de qualquer outra maneira que puder. O importante é que, assim como eu, você tenha uma boa experiência e aprenda algo novo!

---

## Contribuidores

Desenvolvido inicialmente por [Robson Silva](https://github.com/robsonsilv4) com a ajuda dos [contribuidores](./CONTRIBUTORS.md).

---

## Licença

O projeto utiliza a licença MIT. Para mais detalhes, leia o [arquivo de licença](./LICENSE.md).

---

## Agradecimentos

Agradeço ao meu amigo Emerson Vieira, de quem surgiu a ideia inicial, e em especial ao Zarathon Maia por disponibilizar a conta de desenvolvedor na Play Store, tornando possível a publicação do aplicativo.

---

Desejo a todos um ótimo café e bons estudos! 🤓
