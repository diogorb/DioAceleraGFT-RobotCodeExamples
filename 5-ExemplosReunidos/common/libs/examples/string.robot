*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/String.html
Library         String
Library         OperatingSystem

*** Test Cases ***
Exemplo 01: Lidando com linhas de um texto String
    Contando as linhas
    Pegando uma linha específica
    Pegando uma linha específica com a palavra "linha 01"
    Pegando até um marcador

Exemplo 02: Manipulando a String
    Substituindo valores no texto
    Quero tudo minúsculo!
    Quero tudo maiúsculo!

*** Keywords ***
Pega arquivo
    ## Lembrando: O GET FILE retorna o conteúdo do arquivo em STRING!
    ${CONTEUDO_ARQUIVO}    Get File    ./my_files/arquivo_texto_linhas.txt
    [Return]        ${CONTEUDO_ARQUIVO}

Contando as linhas
    ${STRING}       Pega arquivo
    ${LINHAS}       Get Line Count   ${STRING}
    Log             Meu arquivo tem: ${LINHAS} linhas!!

Pegando uma linha específica
    ${STRING}       Pega arquivo
    ${LINHA_3}      Get Line    ${STRING}    3
    Log             Conteúdo da linha 03 do arquivo:\n"${LINHA_3}"
    FOR  ${NUMERO_LINHA}   IN RANGE   0   6
         ${CONTEUDO_LINHA}      Get Line    ${STRING}   ${NUMERO_LINHA}
         Log     Conteúdo da linha ${NUMERO_LINHA} do arquivo:\n"${CONTEUDO_LINHA}"
    END

Pegando uma linha específica com a palavra "${PALAVRA}"
    ${STRING}       Pega arquivo
    ${LINHA}        Get Lines Containing String    ${STRING}    ${PALAVRA}
    Log             Linha com ${PALAVRA}:\n"${LINHA}"

Pegando até um marcador
    ## Use a variável fixa ${SPACE} para o Robot entender que
    ## você quer considerar espaço em branco
    ${STRING}       Pega arquivo
    ${LINHA}        Get Line    ${STRING}    0
    ${COMECO}       Fetch From Left    ${LINHA}    0
    ${FIM}          Fetch From Right   ${LINHA}    linha${SPACE}
    Log   Começo: "${COMECO}"\nFim:"${FIM}"\n\nTudo junto: "${COMECO}${FIM}"

Substituindo valores no texto
    ${TEXTO}        Pega arquivo
    ${NOVO_TEXTO}   Replace String    string=${TEXTO}    search_for=Minha linha    replace_with=Conteúdo da minha linha
    Log             O velho texto era assim:\n${TEXTO}\nO novo texto ficou assim:\n${NOVO_TEXTO}
    Create File     ./my_files/meu_novo_arquivo.txt      ${NOVO_TEXTO}

Quero tudo minúsculo!
    ${TEXTO}        Pega arquivo
    ${TEXTO}        Convert To Lowercase    ${TEXTO}
    Log             Meu texto todo minúsculo:\n${TEXTO}

Quero tudo maiúsculo!
    ${TEXTO}        Pega arquivo
    ${TEXTO}        Convert To Uppercase    ${TEXTO}
    Log             Meu texto todo maiúsculo:\n${TEXTO}
