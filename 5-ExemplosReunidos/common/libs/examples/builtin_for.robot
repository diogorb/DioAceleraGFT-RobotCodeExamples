*** Test Cases ***
Teste do novo formato do FOR
    Velho formato do FOR de listas
    Novo formato do FOR de listas

Teste de FOR aninhado
    Cria cadastro de produtos (FOR aninhado)

Teste FOR usando várias váriaveis
    Cria dicionário de traduções

Teste FOR com numeração da lista
    For com numeração

Teste mais opções IN RANGE
    Tradicional
    Apenas quantidade de laços informada (limite superior)
    Aritmético
    Intervalos específicos

*** Keywords ***
# ## NOVO FORMATO
Velho formato do FOR de listas
    :FOR    ${animal}    IN    gato    cachorro    cavalo
    \    Log    O animal desse laço é: ${animal}!
    \    Log    Vamos para o próximo animal da lista...

Novo formato do FOR de listas
    FOR    ${animal}    IN    gato    cachorro    cavalo
        Log    O animal desse laço é: ${animal}!
        Log    Vamos para o próximo animal da lista...
    END

### FOR DENTRO DE FOR (Loop aninhado)
### Não é possível fazer aninhamentos diretamente
### O recomendado é criar uma keyword que chama a outra no laço
Cria cadastro de produtos (FOR aninhado)
    FOR    ${produto}    IN    baby look    camiseta    blusa
        Imprime tamanhos para o produto    ${produto}
    END

Imprime tamanhos para o produto
    [Arguments]  ${produto}
    FOR    ${tamanho}    IN    P   M   G
        Log    Produto: ${produto} - Tam: ${tamanho}
    END

### Usando várias variáveis
Cria dicionário de traduções
    FOR    ${index}    ${english}    ${finnish}    ${portugues}   IN
    ...     1           cat           kissa         gato
    ...     2           dog           koira         cachorro
    ...     3           horse         hevonen       cavalo
        Log    Animal ${index}:\nEm inglês: ${english}\nEm finlandês: ${finnish}\nEm português: ${portugues}
    END

### FOR com posicionamento na Lista
For com numeração
    FOR    ${index}    ${item}    IN ENUMERATE    P   M   G   GG   XG   XXG
        Log    Item da lista: ${item} - Posição do item na lista: ${index}
    END

### FOR mais opções IN RANGE
Tradicional
    [Documentation]    Percorre de 1 até 10
    FOR    ${index}    IN RANGE    1    11
        Log    ${index}
    END

Apenas quantidade de laços informada (limite superior)
    [Documentation]    Percorre de 0 até 9
    FOR    ${index}    IN RANGE    10
        Log    ${index}
    END

Aritmético
    [Documentation]    Percorre de 0 até 5
    ${var}   Set Variable    ${5}
    FOR    ${index}    IN RANGE    ${var} + 1
        Log    ${index}
    END

Intervalos específicos
    [Documentation]    Percorre de 0 até 30, pulando de 5 em 5
    FOR    ${index}    IN RANGE    0    31    5
        Log    ${index}
    END
