***Settings
#Registra no console e nos logs a descrição da Suite
Documentation   DRB - Cadastro Seu Barriga

#Herdando tudo que seja comum a todo o projeto
Resource        ../common/base.robot

#O que quero rodar para iniciar a suite? Aqui coloco o que eu precisar fazer para dar inicio ao ambiente de testes
#Por exemplo, tem gente que usa o suite setup para fazer insert no banco de dados (em casos onde o banco é criado no pipeline sem um seed, ou seja, zerado)
Suite Setup     Nova Sessão

#o que quero fazer ao fechar a sessão?
Suite Teardown  Encerra Sessão

#Tirar print a cada Test Case (no final)
Test Teardown    Capture Page Screenshot

***Variables
#Aqui eu faço um override da variável que também existe no base.robot, é usada para rodar a palavra chave "Nova Sessão"
${url}          https://seubarriga.wcaquino.me/cadastro

***Test Cases
Cadastra e Loga com Usuário
    [tags]      e2e
    Dado que cadastro usuário aleatório
    Quando preencher minhas credenciais "${emailUsuarioCriado}" "${senhaUsuarioCriado}"
    E clicar no botão login
    Então sistema deve exibir Portal Seu Barriga