*** Variables
${LoginPage_btnEntrar}      xpath=//button[text()='Entrar']
${LoginPage_txtSenha}       xpath=//input[@type='text' and @name='senha']
${LoginPage_btnLogout}      xpath=//*[@href="/logout" and text()='Sair']

***Keywords
Dado que estou acessando a pagina de login Seu Barriga
    Go To           ${url}

Quando digitar um email inválido
    Input Text  email        email@.
    Press Keys  email        TAB

Quando digitar a senha "${senha}"
    Input Text  senha    ${senha}    
    Press Keys  senha     TAB

Quando preencher minhas credenciais "${login}" "${senha}"
    Input Text  email                   ${login}
    Input Text  senha                   ${senha}    
    Press Keys  senha        TAB

E clicar no botão login
    Click Element                       ${LoginPage_btnEntrar}

Então sistema deve apresentar botão entrar
    Wait Until Element Is Visible       ${LoginPage_btnEntrar}
    Title Should Be                     Seu Barriga - Log in

#Deixei esta keyword de exemplo para quando precisar testar se um botão está habilitado para click
Então sistema deve habilitar botão entrar
    Wait Until Element Is Enabled       ${LoginPage_btnEntrar}

#Deixei esta keyword de exemplo para quando precisar verificar se um elemento de senha ficou como texto ao clicar para exibir (clicar com mouse down)
Então sistema deve exibir a senha como texto
    Wait Until Element Is Visible       ${LoginPage_txtSenha}   

Então sistema deve exibir Portal Seu Barriga
    ${textoBemVindo}=                   Catenate    Bem vindo,      ${nomeUsuarioCriado}!
    Log to console                      ${textoBemVindo}
    Title Should Be                     Seu Barriga - Home
    Sleep       5
    Page Should Contain                 ${textoBemVindo}
    Wait Until Element Is Visible       ${LoginPage_btnLogout}