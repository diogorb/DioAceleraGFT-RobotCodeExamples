***Settings
Library     AppiumLibrary

***Test Cases
Deve abrir a tela principal
    Log To Console          ${EXECDIR}

    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UIAutomator2
    ...                     platformName=Android
    ...                     deviceName=Emulator
    ...                     app=${EXECDIR}/app/twp.apk
    ...                     uuid=emulator-5554
    
    Wait Until Page Contains    Training Wheels Protocol     10
    Wait Until Page Contains    Mobile Version     10
    Close Application