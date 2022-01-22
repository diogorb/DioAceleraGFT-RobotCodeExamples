***Settings
#Registra no console e nos logs a descrição da Suite
Documentation   DRB - Login Seu Barriga

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
${url}                      https://seubarriga.wcaquino.me/login

#Aqui também uso para fazer override de variável também existente no base.robot. Uso isto para por exemplo ter um valor padrão para uma variável e poder passar outro na execução.
${browser}      headless

*** Test cases ***
Abrir tela Login
    [tags]  smoke
    Dado que estou acessando a pagina de login Seu Barriga
    Então sistema deve apresentar botão entrar

Login válido
    [tags]  loginValido
    Dado que estou acessando a pagina de login Seu Barriga 

    Quando preencher minhas credenciais "testeteste@teste.com" "123" 
    ${nomeUsuarioCriado} =	Set Variable	teste
    Set Global Variable         ${nomeUsuarioCriado}

    E clicar no botão login
    Então sistema deve exibir Portal Seu Barriga
    
Login invalido, sem email e senha
    [tags]  loginInvalido
    Dado que estou acessando a pagina de login Seu Barriga
    Quando preencher minhas credenciais "" ""
    E clicar no botão login
    Então sistema deve exibir mensagem "Email é um campo obrigatório"
    Então sistema deve exibir mensagem "Senha é um campo obrigatório"

Login inválido, email não cadastrado
    [tags]  loginInvalido
    Dado que estou acessando a pagina de login Seu Barriga 
    Quando preencher minhas credenciais "emailnaocadastrado@cliente.com" "1234!@#$"
    E clicar no botão login
    Então sistema deve exibir mensagem "Problemas com o login do usuário"
    #E solicitar que digite meu usuário e senha novamente.

Login inválido, email cadastrado, senha errada
    [tags]  loginInvalido
    Dado que estou acessando a pagina de login Seu Barriga
    Quando preencher minhas credenciais "testeteste@teste.com" "1234!@#$"
    E clicar no botão login
    Então sistema deve exibir mensagem "Problemas com o login do usuário"
    #E solicitar que digite meu usuário e senha novamente.