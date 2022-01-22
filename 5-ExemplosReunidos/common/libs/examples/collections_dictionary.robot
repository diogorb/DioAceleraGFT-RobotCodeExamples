***Settings
Documentation       Criando dicionário
Library             Collections
***Test Cases
Criar dicionário
    &{headers}=         Create Dictionary    Authorization="&%¨$*&$*&GFTOIUYGOI"    Content-Type=application/json
    ${tipo_headers}     Evaluate        type(&{headers})
    Log to console      Tipo_headers: ${tipo_headers}
    #Imprime dicionário "&{headers}"

    ${sorted} =	        Get Dictionary Items	${headers}	
    ${tipo_sorted}      Evaluate        type(${sorted})
    log to console      Tipo_sorted: ${tipo_sorted}
    
    log to console      Lista: ${sorted}

Passando Dicionario por argumento
    ${a dict}=    Create Dictionary     key1=value1    key2=another value
    Keyword que trabalha com Dicionario via parâmetro    ${a dict}

Tamanho Dicionario
    &{dict} =    Create Dictionary    first=1    second=${2}    ${3}=third
    Length Should Be    ${dict}    3
    #Do Something    &{dict}
    Log    ${dict.first} 

***Keywords
Keyword que trabalha com Dicionario via parâmetro
    [Arguments]     ${dct}
    #&{dict}    Create Dictionary    a=1    b=2
    FOR    ${key}    IN    @{dct.keys()}
        Log to console   ${dct["${key}"]}
    END

    ${tipo_dicionario}=    Evaluate    type($dct)
    
    Log To Console  O argumento passado é do tipo: ${tipo_dicionario}    # will print dict

    ${chaves_do_dicionario}=    Get Dictionary Keys    ${dct}   # a list will all dictionary keys

    # 1st way to iterate/loop
    FOR   ${key}    IN    @{chaves_do_dicionario}
        Log To Console   Abrindo a chave: ${key}
        ${value}=     Get From Dictionary   ${dct}    ${key}
        Log To Console   Valor da chave: "${value}" 
        Log To Console   Outra forma de pegar o valor: ${dct['${key}']})
    END

    # the 2nd way
    FOR   ${key}    IN    @{dct}  
    # this comes from the python's syntax "for key in dct:" - an 
    # iterator over a dictionary returns its keys
        Log To Console   Trabalhando com a chave: ${key}
    # and so on
    END