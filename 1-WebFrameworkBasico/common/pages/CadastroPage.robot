***Variables
${CadastroPage_txtNome}         id:nome
${CadastroPage_txtEmail}        id:email
${CadastroPage_txtSenha}        id:senha
${CadastroPage_btnCadastrar}    xpath://input[@value='Cadastrar']

***Keywords
Dado que estou acessando a pagina de cadastro Seu Barriga
    Go To           ${url}

Então sistema deve apresentar botão cadastrar
    Wait Until Element Is Visible       ${CadastroPage_btnCadastrar}    5       O elemento botao de cadastro não estava presente
    Title Should Be                     Seu Barriga - Novo Usuário

Dado que preencho os dados de um usuário novo aleatório
    ${numAleatorio}=            Random.aleatorioDe1a10000
    ${numAleatorioStr}=         Convert To String       ${numAleatorio}
    #Log to console             ${numAleatorioStr} 

    ${senhaUsuarioCriado}=      Evaluate    ${numAleatorioStr}   
    Set Global Variable         ${senhaUsuarioCriado}

    ${nomeUsuarioCriado}=       Catenate    usuario${numAleatorioStr}
    Set Global Variable         ${nomeUsuarioCriado}

    ${emailUsuarioCriado}=      Catenate    usuario${numAleatorioStr}@email.com
    Set Global Variable         ${emailUsuarioCriado}

    Input Text      ${CadastroPage_txtNome}     ${nomeUsuarioCriado}
    Input Text      ${CadastroPage_txtEmail}    ${emailUsuarioCriado}     
    Input Text      ${CadastroPage_txtSenha}    ${senhaUsuarioCriado} 

Quando clico em cadastrar
    Click element   ${CadastroPage_btnCadastrar}

Dado que cadastro usuário aleatório
    Dado que preencho os dados de um usuário novo aleatório
    Quando clico em cadastrar
    Então sistema deve exibir mensagem "Usuário inserido com sucesso"
