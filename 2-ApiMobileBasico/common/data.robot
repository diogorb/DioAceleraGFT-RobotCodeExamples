***Settings
Library     SeleniumLibrary
Library     DateTime
Library     ./libs/DateExtraction.py

***Variables
${days}     -30

***Keywords
Data atual 
    ${date}= 	Get Current Date    result_format=datetime
    ${month}=   Set Variable    ${date.month}
    ${year}=   Set Variable    ${date.year}
    Set Suite Variable   ${date}
    Log To Console    ${date}
    Log To Console    ${month}
    Log To Console    ${year}

Dia de hoje
    ${dd} =	    Get Time	day
    ${mm} =	    Get Time	month
    ${yyyy} =   Get Time	year
    Log To Console        ${dd}/${mm}/${yyyy}  

Add data "${days}"
    ${date}= 	Get Current Date    result_format=datetime
    ${date}=	Add Time To Date	${date}	${days} days
    Log To Console      ${date}
    #Log To Console      ${date.month}
    #Log To Console      01/${date.month}/2020

Month and year
   ${currentYear}=    Get Current Date  result_format=%y
   ${currentDate}=    Get Current Date
   ${datetime} =  Convert Date  ${currentDate}    datetime
   ${getMonth}=   evaluate   ${datetime.month} - 1
   log to console   ${getMonth}

Month and year by python lib
   ${current_date} =  DateExtraction.Return Inicio do Mes Anterior
   log to console  ${current_date}

Preenche campo "${campo}" com data atual
    ${dd} =	    Get Time	day
    ${mm} =	    Get Time	month
    ${yyyy} =   Get Time	year
    
    Click Element               id:${campo}
    Press Keys                  id:${campo}          CTRL+a+BACKSPACE
    Input Text                  id:${campo}          ${dd}/${mm}/${yyyy}
    Press keys                  id:${campo}          ENTER

Preenche campo "${campo}" com data atual mais "${dias}"
    ${date}= 	Get Current Date    result_format=datetime
    ${date}=	Add Time To Date	${date}	${days} days
    Log To Console      ${date}

    Wait Until Element Is Visible       id:${campo}
    sleep                       3
    Click Element               id:${campo}
    Press Keys                  id:${campo}          CTRL+a+BACKSPACE
    Input Text                  id:${campo}          ${date}
    Press keys                  id:${campo}          ENTER

Preenche campo "${campo}" com data atual menos 4 meses
    ${quatroMesesAntes} =  DateExtraction.Return Inicio quatro Meses Antes
    Convert To String           ${quatroMesesAntes}
    Wait Until Element Is Visible       id:vDATAINICIO
    sleep                       3
    Click Element               id:${campo}
    Press Keys                  id:${campo}          CTRL+a+BACKSPACE
    Input Text                  id:${campo}          ${quatroMesesAntes}
    Press keys                  id:${campo}          ENTER