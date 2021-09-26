

# Testes web com Robot Framework para Python: introdução



### [RODRIGO MATOLA](https://imasters.com.br/perfil/rodrigomatola)

Tem [2 artigos](https://imasters.com.br/back-end/testes-web-com-robot-framework-para-python-introducao#) publicados com[ 1461 visualizações](https://imasters.com.br/back-end/testes-web-com-robot-framework-para-python-introducao#) desde [2018](https://imasters.com.br/back-end/testes-web-com-robot-framework-para-python-introducao#)

[![Rodrigo Matola](https://static.imasters.com.br/wp-content/uploads/2018/08/09144034/MATO.jpg)](https://imasters.com.br/perfil/rodrigomatola)

Analista de QA na Concrete, Rodrigo Matola é meteorologista de formação, cursando e fã de computação, curioso e fuçador, adora saber como o mundo funciona. Estudioso de coisas e pessoas, também tenta cuidar de um blog sobre física e matemática, aprender japonês e a desenhar.

9 AGO, 2018

### [Como faço (ou tento fazer) automação de testes na Sprint](https://imasters.com.br/desenvolvimento/como-faco-ou-tento-fazer-autamocao-de-testes-na-sprint)

![img](https://static.imasters.com.br/wp-content/uploads/2018/02/SAY.jpg)

Antes de começar, gostaria de agradecer ao [Darling Lopes Cabral](https://www.linkedin.com/in/darling-cabral-6b709a49/) por me apresentar o Robot e por me ajudar com os primeiros passos; [Mayara Ribeiro Fernandes](https://www.linkedin.com/in/mayfernandes), por me auxiliar indiretamente por meio do portal [Robotizando Testes](http://robotizandotestes.blogspot.com.br/), e diretamente pelo LinkedIn. Nesta introdução, vou dar uma visão geral sobre o que é o Robot e fazer um script simples de busca no Google.

## O que é o Robot Framework?

O [Robot](http://robotframework.org/) é um framework para automação de testes de aceitação (acceptance test-driven development – ATDD). É open source e independente de sistema operacional. Nativamente implementado para Python e Java, mas também roda em Jython (JVM) e IronPython (.NET).

Sua sintaxe é tabular, como o Python, e usa uma abordagem de palavras chave (keyword driven). Esta abordagem é o que mais me chamou atenção no Robot, pois permite a escrita de cenários com uma linguagem totalmente natural. É possível também usar a sintaxe Gherkin.

## Estrutura do código

A estrutura do script é simples e pode ser dividida em quatro seções:

### Settings

Aqui é onde você configura as bibliotecas que serão utilizadas, caminhos para arquivos auxiliares (page objects, por exemplo), contextos e hooks.

### Variables

Lista das variáveis a serem usadas (de preferência com descrição) e definição dos valores de algumas dessas variáveis.

### Test Cases

Esta é a seção mais importante, pois sem ela seu teste não roda. É aqui que ficam os cenários/casos de teste, com ou sem implementação.

### Keywords

Aqui você pode definir palavras chave ou implementar os cenários de teste descritos acima.

Todas as seções acima são opcionais, dependendo de como seu código foi escrito, exceto a *** Test Cases ***. Aconselho a usá-las sempre para uma melhor organização do código.

Os rótulos abaixo não são obrigatórios, mas também ajudam na organização.

### Documentation

Esta palavra chave precede a descrição da funcionalidade ou do cenário de teste. Fique atento, porque se a documentação é feita na seção *** Settings ***, ela não deve estar entre colchetes. Eles só são usados dentro dos *** Test Cases ***

### Tags

Um rótulo mais simples para o cenário, caso queira ou precise rodar somente um ou poucos casos. É possível fazer isso chamando pelo título dos cenários na linha de comando, mas, como geralmente eles são grandes, as tags acabam sendo a melhor opção no geral.

### Espaços e Variáveis

As variáveis no Robot são representadas por ${variavel}. O Robot tem a peculiaridade de ignorar um espaço entre palavras. ${nome_da_variavel} é igual a ${nome da variavel}. Elas também são case insensitive.

As divisões dos argumentos são feitas por, no mínimo, dois espaços. Por exemplo:

comando (dois espaços) argumento1 (dois espaços) argumento 2.

Reparem que o espaço no “argumento 2” é ignorado. O sinal de atribuição (=) também é opcional. Valores podem ser atribuídos, tanto:

**${valor} valor**

**${valor} = valor**

### Indentação

O Python é uma linguagem [indentada](https://pt.wikibooks.org/wiki/Python/Conceitos_básicos/Indentação), ou seja, blocos de comando são separados por espaços ou tabulações, formando uma indentação visual obrigatória. Não existem símbolos de “abre” e “fecha”, o Robot herda essa formatação.

### Instalação

O pré requisito é ter o [Python 2.7](https://www.python.org/downloads/) instalado na máquina. O Robot também suporta o Python 3, mas como Python 2 e 3 [não são inteiramente compatíveis](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#python-2-vs-python-3), vamos aqui usar a versão 2.7.

Após instalar o Python, verifique se o Pip, gerenciador de pacotes do Python também está instalado. Ele deve vir instalado por padrão. Digite os comandos abaixo:

```shell
$ python --version
Python 2.7.12
$ pip --version
pip 9.0.1 from .local/lib/python2.7/site-packages (python 2.7)
```

Se a mensagem aparecer assim, está tudo pronto para prosseguir. Baixe o arquivo [requirements.txt](https://github.com/rodmatola/robot-framework-blog-concrete/blob/master/requirements.txt) e digite:

```shell
$ pip install -r requirements.txt
```

Se preferir a instalação passo a passo, siga as instruções abaixo:

```shell
$ pip install robot-framework
```

Espere completar a instalação e verifique se tudo ocorreu bem com o comando.

```shell
$ robot --version
Robot Framework 3.0.2 (Python 2.7.12 on linux2)
```

Usuários de Windows devem executar o Robot no cmd. Em outros terminais do Windows, como o Git Bash ou Cmder – geralmente – não reconhecem o comando Robot, por ser instalado como um arquivo bat.

Depois, instale a biblioteca do [Selenium](http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html):

```shell
$ pip list
robotframework (3.0.2)
robotframework-ride (1.5.2.1)
robotframework-seleniumlibrary (3.0.0b3)
selenium (3.6.0)
```

### Webdrivers

Depois das nossas linguagens instaladas, precisamos baixar os drivers que vão controlar os browsers utilizados. No site do [Selenium](http://www.seleniumhq.org/download/) você encontra esses drivers. Os drivers, após baixados, devem ser descompactados e colocados na pasta Python27/Scripts. Funciona também se colocar na pasta do seu projeto, mas isso não é recomendado, pois você teria que replicar o driver para cada projeto.

É possível, no Windows, colocar em qualquer outra pasta, por exemplo, C:\webdrivers (onde eu coloco) e adicionar essa pasta ao path. Tecle “window+s”, digite “path”, clique em “Editar variáveis de sistema” > “Variáveis de Ambiente” > “Path”, e adicione o caminho onde estão seus webdrivers.

No Linux, eu coloco direto na pasta /usr/local/bin/.

Agora está tudo pronto para começar!

### Primeiro script

Como esse texto é uma introdução, vamos fazer uma busca simples no Google, tudo em um único arquivo. Nos próximos artigos vamos adicionar mais funcionalidades e organização.

Usaremos o BDD keyword driven, e não o Gherkin, por permitir maior liberdade na escrita dos cenários. Nosso script vai ser salvo em um arquivo de extensão .robot.

Você pode baixar a fonte no meu meu [GitHub](https://github.com/rodmatola/robot-framework-blog-concrete).

Os editores que indico são o [Pycharm](https://www.jetbrains.com/pycharm/download/) (que uso) com os plugins Intellibot e Robot Framework Support (File>Settings>Plugins>Browser Repositories) ou o [Visual Studio Code](https://code.visualstudio.com/download), com algum plugin para o Robot, mas você pode usar outros que tenham suporte.

### Settings

Vamos começar com a seção *** Settings ***. Como vamos usar biblioteca do Selenium, é preciso declarar isso nesta seção.

```shell
*** Settings ***
Library  SeleniumLibrary
```

Não é obrigatório, mas é bom também colocar uma descrição da suíte, antes ou depois, não importa.

```shell
*** Settings ***
Documentation  Suíte de apresentação do Robot Framework
...  com uma busca simples no Google
...  para o blog da Concrete

Library  SeleniumLibrary
```

### Test Cases

Aqui é onde nossos cenários e casos de teste, em linguagem natural, vão ser descritos.

Esta parte não tem muito segredo, só escreva o nome do cenário como se fosse um título, alinhado à esquerda, e os passos indentados abaixo.

```shell
*** Test Cases ***
Cenário: Buscar por Robot Framework no Google e entrar na página
   [Documentation]  Cenário para uma busca sobre Robot Framework
   ...              no Google
   [Tags]  busca
   Abrir o Chrome na página <http://www.google.com.br>
   Digite "Robot Framework" no campo de busca
   Verifique se a busca retornou o resultado esperado
   Clique no primeiro link
   Verifique se a página mostrada e a correta
   Fechar o browser
```

Note que, diferente da seção *** Settings ***, aqui, a palavra-chave [Documentation] está entre colchetes. Note também que as reticências de continuação de linha estão indentadas.

Agora vamos a implementação do cenário.

### Key Words

Nesta seção é onde você implementa todas as suas palavras chave (ou frases chave). A implementação segue o mesmo formato acima, com a palavra chave alinhada à esquerda e a implementação indentada abaixo. Vou colocar toda a implementação e depois vou explicar linha por linha.

```shell
*** Keywords ***
Abrir o ${browser} na página <${url}>
   Open Browser  ${url}  ${browser}

Digite "${palavra busca}" no campo de busca
   Set Test Variable  ${palavra busca}
   Input text      id = lst-ib  ${palavra busca}
   Click Button    Pesquisa Google

Verifique se a busca retornou o resultado esperado
   ${titulo} =  Get title
   Should Contain  ${titulo}  ${palavra busca}

Clique no primeiro link
   ${texto} =  Get text  css = #rso > div:nth-child(1) > div > div > div > div > h3
   Click link  ${texto}

Verifique se a página mostrada e a correta
   ${titulo}                   Get title
   Should Contain              ${titulo}       ${palavra busca}
   Element text should be      css = h1        ROBOT FRAMEWORK
Fechar o browser
   Close browser
```

Compare o que está dentro dos *** Test Cases *** com o que está nas *** Keywords ***.

### Test Cases

Abrir o Chrome na página <[http://www.google.com.br](http://www.google.com.br/)>

Digite “Robot Framework” no campo de busca:

### Keywords

**Abrir o ${browser} na página <${url}>**

**Digite “${palavra busca}” no campo de busca**

Veja que o Robot reconhece os parâmetros a serem passados só pela posição na frase. Basta você substituir o parâmetro pelo nome que você quer dar à variável. Não precisa de nenhum comando ou caractere especial para isso.

Cada variável fica no contexto da sua palavra chave. ${browser} e ${url} só existem dentro de **Abrir o ${browser} na página <${url}>**; para a variável ser visível em outros contextos, é preciso especificar isso. No nosso caso, usei o Set Test Variable para torná-la visível dentro do nosso cenário. Existem também o Set Suite Variable e o Set Global Variable, mas não vamos falar deles aqui.

O Robot é “esperto” o suficiente para saber onde você quer clicar, como no Click Button *Pesquisa Google.* Não é preciso informar o css selector ou o xpath e o mesmo vale para o Click Link mais abaixo.

A verificação do resultado da busca é feita pelo título da página, que aparece escrito na aba do browser; ao clicar no primeiro link da busca, a verificação é feita pelo título e pela tag H1, já que esta tag deve ser única.

A suíte termina com o fechamento do browser.

### Reports e logs

Após a execução dos testes, o Robot gera um Report e um Log em html bem completo. Se algum teste falhar, olhe o que aconteceu no log. Certamente ele vai ajudar.

É possível fazer algumas customizações nesses arquivos, mas não vou entrar em detalhes aqui. Aconselho que os explorem, principalmente o log.

O Robot se mostra como mais uma opção de frameworks para automação de testes, não se prende a uma sintaxe exclusiva, como o Cucumber/Gherkin, sendo uma alternativa ao Ruby.

## Para saber mais

- Site do [Robot Framework](http://robotframework.org/)
- [Documentação do Selenium](http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- Blog da Mayara, [Robotizando testes](http://robotizandotestes.blogspot.com.br/)
- Continuação deste artigo (em breve)

***

Este artigo foi publicado originalmente em: https://www.concrete.com.br/2018/01/30/testes-web-com-robot-framework-para-python-introducao/

https://imasters.com.br/back-end/testes-web-com-robot-framework-para-python-introducao