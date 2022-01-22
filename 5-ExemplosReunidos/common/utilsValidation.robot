***Settings
Documentation   GFT RobotFramework Asset, Utils Validation
Resource        ./base.robot
Test Teardown    Capture Page Screenshot

***Variables
${url}          https://seubarriga.wcaquino.me/cadastro

***Test Cases
Random Lib Using
    [tags]  utils
    ${numAleatorio}=    Random.aleatorioDe1a10000
    #${numAleatorio}=    Evaluate    ${numAleatorio1}+${numAleatorio2}+${numAleatorio3}
    Log to console      ${numAleatorio}

Data Lib Using

GeraCpf Lib Using
