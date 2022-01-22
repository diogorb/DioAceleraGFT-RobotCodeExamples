*** Test Cases ***
Relembrando argumentos posicionais x nomeados
    Teste de Argumentos Básico     1   2   3   4
    Teste de Argumentos Básico     arg4=1   arg3=2   arg2=3   arg1=4

Teste de Argumentos Opcionais
    Passando argumentos opcionais como parâmetro      nome=Mayara   ultimo_nome=Fernandes
    Passando argumentos opcionais como parâmetro      nome=Mayara   nome_do_meio=Ribeiro     ultimo_nome=Fernandes

Criando lista e dicionário via parâmetro
    [Documentation]     No Python é conhecido como "kwargs"
    Teste Criando um Dicionário     cwd=/home/user  shell=True   env=False
    Teste Criando uma Lista         may   ribeiro   fernandes
    Teste Criando os dois           may   ribeiro   fernandes    shell=True    env=False

*** Keywords ***
Teste de Argumentos Básico
    [Arguments]     ${arg1}  ${arg2}  ${arg3}  ${arg4}
    Log    ${arg1} - ${arg2} - ${arg3} - ${arg4}

Passando argumentos opcionais como parâmetro
    ### Parâmetros OPCIONAIS ficam por último
    ### O Robot é case-sensitive, se o parâmetro está minúsculo, lá na keyqord tem que estar também!
    [Arguments]     ${nome}   ${ultimo_nome}   ${nome_do_meio}=silva
    Log   Nome completo: ${nome} ${nome_do_meio} ${ultimo_nome}

Teste Criando um Dicionário
    ### REGRA: Somente um dicionário pode ser criado
    [Arguments]     &{meu_dicionario}
    Log    ${meu_dicionario}

Teste Criando uma Lista
    ### REGRA: Somente uma lista pode ser criada
    [Arguments]     @{minha_lista}
    Log    ${minha_lista}

Teste Criando os dois
    ### REGRA: a lista vem primeiro
    [Arguments]     @{minha_lista}  &{meu_dicionario}
    Log    ${minha_lista}\n${meu_dicionario}
