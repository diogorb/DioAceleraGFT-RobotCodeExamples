*** Settings ***
Documentation     Lib que concentra as funções para reuso em toda a Stack de Testes Automatizados
Resource          data.robot
Resource          keywords.robot
Resource          testData.robot

#Pages
Resource          ./pages/LoginPage.robot
Resource          ./pages/CadastroPage.robot

#libs
Library           SeleniumLibrary
Library           ./libs/DynamicTestCases.py
Library           ./libs/DateExtraction.py
Library           ./libs/Util.py
Library           ./libs/Random.py
Library           String

*** Variables ***
${url}            http://localhost:4200
${browser}        headless
${versao}         ${EMPTY}
${nomeUsuarioCriado}    teste    
${emailUsuarioCriado}
${senhaUsuarioCriado}
