# Decisões do projeto

## Geral
- Utilizei a arquitetura MVVM por 3 motivos:
    * É a arquitetura mais utilizada atualmente (de acordo com as minhas experiências);
    * Estou bastante familiarizado com ela;
    * Traz uma boa testabilidade para o projeto.
- Eu optei por não utilizar Coordinator, apesar de ter o costume de usar, pois é desnecessário com um projeto tão pequeno e com poucas navegações, então só criei um arquivo Navigator pra tratar da navegação de forma mais simples.
- Utilização de protocolos e métodos construtores para injeção de dependência 

## Camada - Model
- Utilizei structs em conforminade com o protocolo Codable para facilitar o parse na comunicação com a API e dividi em pastas por feature, além de uma pasta separada com os responses da API.

## Camada - View
- Optei por dividir a ViewController da parte de UI, para manter com mais facilidade o princípio de responsabilidade única do SOLID, dando assim a responsabilidade das ações de controle para a ViewController, que busca esses dados na ViewModel e a classe de UI somente com as configurações dos componentes e o autolayout.

## Camada - ViewModel
- É responsável pelas regras de negócio, armazenamento dos dados. É basicamente o local onde a ViewController busca tudo que ela precisa para apresentar as informações para o usuário.
- Foi utilizado um Observable, para fazer o binding e notificar a view controller das mudanças de estado da aplicação.

## Camada - API
- Tem uma divisão de clients e routers por fluxo do app. A classe client é responsável pelos métodos que chamam as requests. A classe router é responsável por definir a rota que será usada na chamada do cliente, dividindo a url com url components e depois montando ela na classe de request.
- A request verifica se existe cache para a url atual e utiliza async/await para a chamada, ajudando na legibilidade do código, por diminuir o uso de completion handler. 

## Util
- BaseClasses: Utilizado para arquivos de classes bases de componentes para herança.
- Cache: Arquivos de cache de dados
- Extensions: Extensões de classes do Swift criadas para deixar o código mais limpo.

## Resourses 
- Aqui temos o arquivo de layout da lauch screen, além dos Assets, que eu utilizei um para imagens e outro para cores, já preparado para trabalhar com dark mode.
- Junto a cada arquivo de asset tem um enum para organizar a utilização desses assets, quando necessário
- Possui uma pasta de strings com suporte ao inglês e português, além de enums para facilitar a utilização desses textos.
- Também foi escrito um enum para definir o accessibilityIdentifier dos componentes do app utilizados nos testes de UI.

## Application
- Arquivos necessários para a inicialização do app.


