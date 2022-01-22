*** Keywords ***
Nova Sessão
    #Open browser    ${url}    chrome
    Run Keyword if    "${browser}" == "chrome"    Open browser    ${url}    Chrome  options=add_experimental_option('excludeSwitches', ['enable-logging'])
    Run Keyword if    "${browser}" == "headless"    Open browser    ${url}    Headlesschrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])
    #Maximize Browser Window
    Set Window Size                     1600    900
    Capture Page Screenshot
    #Wait Until Element is Visible    identifier:user       10
    Set Selenium Implicit Wait    10
    Set Selenium Timeout    10
    #Wait Until Page Contains Element    xpath=//span[@id='USERLOGO']
    Register Keyword To Run On Failure    Capture Page Screenshot

Encerra Sessão
    Capture Page Screenshot
    Close Browser

Quando eu clicar no botão login
    Click Element       xpath://button[text()='Entrar']

Então sistema deve exibir mensagem "${mensagem}"
    #Wait Until Element Is Visible       //span[text()=contains(., '${mensagem}' )]
    Wait Until Element Is Visible       //*[normalize-space(text())='${mensagem}'] 
    #referência: https://stackoverflow.com/questions/2994198/xpath-to-return-only-elements-containing-the-text-and-not-its-parents
    Capture Page Screenshot

Então sistema não deve exibir mensagem "${mensagem}"
    Page Should Not Contain       ${mensagem}
