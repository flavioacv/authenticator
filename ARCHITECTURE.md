# Arquitetura

A construção da arquitetura do projeto tem sido aprimorada com a utilização de abordagens como a Clean Architecture, a aplicação dos princípios SOLID e a adoção do Cubit como simplificação do Bloc. Essas práticas têm demonstrado ser altamente eficientes em nosso processo de desenvolvimento, contribuindo para a construção de uma arquitetura de software robusta, escalável e de fácil manutenção.

A Clean Architecture tem como principal objetivo criar um sistema desacoplado e independente, onde cada camada possui uma responsabilidade específica. Com essa abordagem, é possível garantir a escalabilidade do sistema, a manutenibilidade do código e a facilidade de implementação de testes automatizados. Além disso, a Clean Architecture permite uma maior flexibilidade na escolha de tecnologias e frameworks, uma vez que as camadas do sistema estão desacopladas.

Os princípios SOLID, por sua vez, são fundamentais para garantir a qualidade do código. Com esses princípios, é possível criar um sistema mais coeso e coeso, onde cada classe ou método tem uma única responsabilidade. Isso torna o código mais fácil de entender e de manter, além de facilitar a implementação de testes automatizados.

Já o Cubit é uma abordagem que tem como objetivo facilitar a implementação do padrão Bloc. Com o Cubit, é possível simplificar a estrutura do Bloc e tornar a implementação mais eficiente e manutenível. O Bloc é uma arquitetura de gerenciamento de estado que permite separar a lógica de apresentação da lógica de negócio.

No geral, a utilização da Clean Architecture, dos princípios SOLID e do Cubit para simplificação do Bloc é uma abordagem que tem trazido excelentes resultados para a equipe de desenvolvimento. Essas práticas garantem a qualidade e a manutenibilidade do código, além de facilitar a implementação de testes automatizados e tornar o sistema mais flexível e escalável.

obs: Foi utilizado a nova proposta do [Clean Dart 2.0](https://github.com/Flutterando/Clean-Dart/tree/2.0).

# Objetivo

Esse documento tem por objetivo principal organizar o processo de desenvolvimento do software da equipe.

# Regras iniciais, limite e Análise

Pontos a serem levados em consideração antes de introduzir uma nova feature:

- Todo projeto precisará respeitar as regras de Lint escritas no pacote analysis_options.
- Camadas globais devem ter um lugar específico na aplicação, por tanto, devem estar na camada do Core na sua pasta especifica.
- Cada feature/modulo, deverá ter sua própria pasta onde conterá todas as camadas necessárias para a execução dos casos de uso da feature.
- Todos os designs patterns usados no projeto devem estar listados na sessão “Design Patterns” desse documento, caso contrário será considerado implementação errônea.
- Packages e plugins novos só poderão ser usados nos projetos após avaliação e aprovação de toda equipe responsável pelo projeto.
- Incapsular todos os packages que serão utlizados no projeto.
- Atualizações no Modelo de domínio só poderão ser aceitas se primeiro for adicionada nesse documento e aprovado por todos os envolvidos no projeto.
- Não é permitido ter uma classe concreta como dependência de uma camada. Só será aceita coesão com classes abstratas ou interfaces.
- Cada camada deve ter apenas uma responsabilidade.
- Obrigatorio a tipagem de retorno em funções e nomenclatura descritiva.

# Design Patterns

- Datasource: Para acesso a fontes de dados.
- Dependency Injection: Resolver dependências das classes.
- Controller: Guardar e mudar estados.
- State pattern: Padrão que auxilia no gerenciamento estados.


# Package externos (Comum)

- dio: Cliente HTTP.
- Mocktail: Para testes de unidade.


# Package externos (App)

- flutter_modular: Modularização de rotas e injeção de dependências.
- google_fonts: Fontes para o app.


