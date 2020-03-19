# Quero Workar - As melhores vagas de TI você encontra aqui!

O QueroWorkar é um aplicativo que aproxima, de forma prática e direta, profissionais e empresas.

Disponível na [PlayStore](https://play.google.com/store/apps/details?id=tech.robsonsilva.quero_workar)!

![Banner da aplicação](./banner.png)

## Um pouco de história

Essa é a versão mobile da já conhecida plataforma que havia sido retirada do ar e que voltou recentemente graças ao Carlos Terceiro e a Mobills. Então resolvi desenvolver a aplicação para retribuir ao QueroWorkar e aplicar os conhecimentos que venho adquirindo em mobile, já que o QueroWorkar era a plataforma onde via as vagas quando comecei a estudar na área de desenvolvimento e sonhava trabalhar um dia. Me inspirei também na primeira versão desenvolvia pelo meu grande amigo Emerson Vieira e se você quiser saber ainda mais um pouco, basta conferir [esse](https://www.linkedin.com/posts/robsonsilv4_flutter-bloc-flutterando-activity-6642161887561736192-FDV4) e [esse](https://www.linkedin.com/posts/robsonsilv4_queroworkar-apps-on-google-play-activity-6644998985910145024-WKRK) outro post.

### Tecnologias e pacotes utilizados:

- Dart como linguagem principal.
- Flutter como framework cross plataform.
- GetIt para injeção de dependência.
- Dio para requisição web.
- Dio HTTP Cache para cachear as requisções.
- HTML para tratamento das páginas.
- Flutter HTML para transformação de html em widgets.
- Transparent Image para carregamento das imagens.
- Loading para animações de carregamento.
- Bloc para gerencimaneto de estado.
- Flutter Bloc que são widgets do Bloc para Flutter.
- Equatable para comparação de objetos.
- Meta para adição de paramêtros obrigatoórios.
- Hydrated Bloc para sincronização de dados.
- Share para compartilhamento.

### Estrutura de pastas e arquivos:

```
lib:

│   main.dart
├───blocs/
│   │   app_bloc_delegate.dart
│   │   blocs.dart
│   │
│   └───jobs/
│           jobs.dart
│           jobs_bloc.dart
│           jobs_event.dart
│           jobs_state.dart
├───data/
│   ├───models/
│   │       job_model.dart
│   │
│   └───repositoires/
│           job_repository.dart
│
├───di/
│       service_locator.dart
├───shared/
│   ├───constants/
│   │       api.dart
│   │       images.dart
│   │       qw_theme.dart
│   │
│   └───widgets/
│           info_widget.dart
│           job_share.dart
│           loading_qw.dart
└───ui/
    └───pages/
        │   detail_page.dart
        │   splash_page.dart
        │
        └───home_page/
            │   home_page.dart
            │
            └───widgets/
                    jobs_quantity.dart
                    job_item.dart
```

## Como rodar o projeto

Primeiro você precisa clonar o repositório:

```sh
git clone https://github.com/robsonsilv4/queroworkar.git quero_workar
```

Agora basta entrar na pasta do projeto e baixar os pacotes:

```sh
cd esse repo

flutter packages get
```

E rodar no seu dispositivo:

```sh
flutter run
```

## Como gerar o instalador

Para gerar os instaladores, basta entrar na pasta do projeto e rodar o seguinte comando:

```sh
flutter build apk --split-per-abi

flutter install # para instalar no dispositivo ou emulador
```

Os arquivos gerados ficam em:

```sh
quero_workar/build/app/outputs/apk/release/...
```

## Como contribuir

Você pode contribuir para o projeto de qualquer maneira. Seja instalado o aplcativo e dando feedback, abrindo issues, melhorando ou trauduzindo a documentação, melhorando ou adicionando features, compartilhando ou falando sobre o projeto, doando ou de qualquer outra forma que conseguir. O importante é que assim como eu, você tenha uma boa experiência e aprenda algo.

## Contribuidores

Desenvolvido incialmente por [Robson Silva](https://github.com/robsonsilv4) com a ajuda dos seguintes [contribuidores](./CONTRIBUTORS.md).

## Liceça

A licença utilizado no projeto é a MIT. Para mais detalhes leia o [arquivo](./LICENSE.md).

## Fim

E isso é tudo pessoal!

Agradeço ao Zarathon Maira por ter me disponibilizado a conta de desenvolvedor e desejo a todos um ótimo café e bons estudos.
