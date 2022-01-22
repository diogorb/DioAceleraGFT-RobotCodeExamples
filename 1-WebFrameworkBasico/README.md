# PROJETO MODELO PARA TESTE WEB (UI) USANDO ROBOTFRAMEWORK E SELENIUM LIBRARY 

Projeto desenvolvido com proposito de ser um modelo base para teste para interface WEB utilizando Python, RobotFramework e Selenium Library



## PRÉ-REQUISITOS

Requisitos de software e hardware necessários para executar este projeto de automação

*   Python 3
*   Executar comando dentro da pasta do projeto: pip install -r requirements.txt
*   Navegador Web e respectivos drivers desejados (Chrome, Opera, FireFox, Edge ou Safari)
*   VSCode, Pycharm ou outra IDE desejada e compatível
*   Plugins do VSCode
    * RobotFramework Intellisense (Tomi Turtiainen)
    * Sugestão de tema e icones: Hyper Term Theme e Material Icon Theme



## ESTRUTURA DO PROJETO

| Diretório \ Arquivo          	| Finalidade                                                                                                      |
|------------------------------	|-------------------------------------------------------------------------------------------                      |
| common\ 		                  | Pasta principal com estrutura básica                                                                            |
| common\libs    		            | Local para salvamento das libs criadas para uso na automação                                                    |
| common\libs\examples           | Local onde estão exemplos de usos de libs Standard e outras consideradas importantes, visando acelerar aprendizado e busca por exemplos de uso |
| common\pages                   | Local para salvamento dos PageObjects que serão usados na automação                                             |
| common\base.robot     	      | Arquivo que une toda Stack de automação e deve ser herdado por todos os arquivos .robot usando a chave resource |
| common\keywords.robot 	      | Arquivo que contém Keywords de uso comum por toda Stack, por exemplo: Hooks de abrir sessão e fechar sessão     |
| web | Local onde devem ser criadas as suítes de testes (arquivos nome_suite.robot). Exemplo: login.robot                                         |

OBS: Recomenda-se que seja seguido o seguinte guia na escrita de casos de testes (https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst)



## DOWNLOAD DO PROJETO TEMPLATE PARA SUA MÁQUINA LOCAL

Faça o download do template no repositório de código para utilizar no seu projeto em especifico, feito isso, fique à vontande para usufruir dos recursos disponíveis e também customizar de acordo com sua necessidade. 



## LIBRARIES UTILIZADAS
Abaixo está a lista de frameworks utilizados nesse projeto

* Selenium - Responsável pela interação com páginas web
* FakerLibrary - Geracão de dados sintéticos
* Pabot - Execução de testes em paralelo, gerando ganho de tempo de execução
* allure-robotframework - Exportação do resultado dos testes no formato utilizado pelo Allure



## COMANDO PARA EXECUTAR OS TESTES

Com o prompt de comando acesse a pasta do projeto, e execute o comando para executar o robot conforme os exemplos a seguir. 



## PASSAGEM DE PARÂMETROS PARA A EXECUÇÃO ##
* Executar testes robot:  python -m robot -d ./logs web

* Executar testes de regressão usando chrome headless (opção -v) e TAG (opção -i): python -m robot -v browser:headless -i regression -d logs-regression web 

* Executar testes de regressão pela TAG regression, abrindo Chrome e passando url: robot -v browser:chrome -v examplevar:examplevalue -v url:http://URL -i regression -d ./logs *.robot

* Executar testes em paralelo: pabot -d ./logs-paralelo *.robot

* Executar testes em paralelo passando variável: pabot -d ./logs -v browser:headless tests/web



## REPORTS E LOG DE EXECUÇÃO  

Uma das características que diferenciam o Robot é o seu Report default. Este report e log detalhado são gerados por padrão na pasta onde é executado, podendo se passado parâmetro -d para indicar o local do salvamento desejado.

O nosso Asset Python GFT ainda conta com a exportação do resultado para o formato do Allure. Para geração:
* robot --listener allure_robotframework;./output/allure ./web/*.robot
Feito isto, para abrir o Allure será necessário que tenha o CLI do Allure instalado na máquina e rode o comando: allure serve ./output/allure

Pode-se ainda:

* Usar opção -x para gerar a saída no formato Junit (A exemplo do formato esperado para leitura na Azure)

* Ex: robot -x ./xunit/test-results.xml 

* OBS: Existem Libs para exportar os reports para Allure e ReportPortal, oportunamente iremos implementar.



## TESTES CONTINUOS

### JENKINS

Executar testes de forma continua vem se tornado fundamental para agregar valor junto a seu time, para isto foi configurado o pipeline para ser aplicado ao jenkins chamando "Jenkinsfile" localizado na raiz do projeto

