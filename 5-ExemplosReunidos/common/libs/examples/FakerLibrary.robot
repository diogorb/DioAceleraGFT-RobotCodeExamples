*** Settings ***
Documentation   Faker com dados brasileiros using FakerLibrary
Library         FakerLibrary    locale=pt_BR

*** Test Cases ***
#Keywords docs: "https://guykisel.github.io/robotframework-faker/"
Teste dados fakes BRASILEIROS
    [tags]      faker
    ${CPF}      FakerLibrary.cpf
    ${NOME}     FakerLibrary.name
    ${CIDADE}   FakerLibrary.city
    ${CEP}      FakerLibrary.postcode
    ${ESTADO}   FakerLibrary.state

    Log to console      ${CPF}, ${NOME}, ${CIDADE}, ${CEP}, ${ESTADO}