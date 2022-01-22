# Introdução 
TODO: Projeto tem objetivo de criar e otimizar gradualmente um Asset a ser compartilhado na GFT com implementações em RobotFramework. 
A motivação principal é compartilhar conhecimento e possibilitar reuso de código e nivelamento de mais um conhecimento com a comunidade GFT.

# Como Preparar ambiente local
1. Instalar Python 3 na máquina e colocar no path da mesma
2. Executar comando dentro da pasta do projeto: pip install -r requirements.txt
OBS: Para testers / Devs, é sugerido o uso do VSCode, Cmder.net e Extensão: Robot Framework Intellisense
3.	Execute testes robot: robot -d .\logs *.robot
4.	Execute testes robot em paralelo: pabot -d .\logs-paralelo *.robot

# ### Exemplos de passagem de parâmetros para a Execução ###
1. Rodar testes de regressão pela TAG (opção -i), usando Chrome headless:
robot -v browser:headless -i regression -d logs-regression ./tests/web/*.robot 

2. Rodar testes de regressão pela tag regression, abrindo Chrome e passando url:
robot -v browser:chrome -v validaversao:True -v examplevar:examplevalue -v url:http://URL -i regression -d ./logs Regression_*.robot

3. Rodar testes de regressão pela tag regression, sem abrir o browser e passando url:
robot -v browser:headless -v validaversao:True -v url:https://URL -i regression -d ./logs-20.7.8-Union-Regression ./tests/web/*.robot

4. Rodar os testes em Paralelo usando Pabot (passar pasta que contém arquivos .robot)
pabot -d ./logs -v browser:headless tests/web


#Status do projeto
1. Criadas libs para reuso relativo ao "BootStrap" de qualquer projeto de testes. 
Podendo fazer uso da abordadem ATDD, escrevendo em BDD, podemos implementar testes web ou mobile, UI ou Integração, com foco em Regression ou Smoke Tests. 
2. Implementados testes de UI usando Robot e Selenium Library
3. Implementados testes de Mobile com Appium
4. Implementados testes de API usando a lib Requests

# Contribua
Suba as alterações que achar conveniente
