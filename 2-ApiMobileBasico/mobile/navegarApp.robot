***Settings
Library     AppiumLibrary

***Test Cases
Deve abrir a tela DIALOGS
    Log To Console          ${EXECDIR}

    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UIAutomator2
    ...                     platformName=Android
    ...                     deviceName=Emulator
    ...                     app=${EXECDIR}/app/twp.apk
    ...                     uuid=emulator-5554
    
    Wait Until Page Contains        COMEÇAR     10
    Click Text                      COMEÇAR
    Wait Until Element is Visible   xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]      5
    Click Element                   xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]
    Wait Until Element is Visible   id=io.qaninja.android.twp:id/navView
    Click Text                      DIALOGS
    Wait Until Element is Visible   id=io.qaninja.android.twp:id/toolbarTitle       5
    Element Text Should Be          id=io.qaninja.android.twp:id/toolbarTitle       DIALOGS
    Close Application

Deve abrir a tela FORMS
    Log To Console          ${EXECDIR}

    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UIAutomator2
    ...                     platformName=Android
    ...                     deviceName=Emulator
    ...                     app=${EXECDIR}/app/twp.apk
    ...                     uuid=emulator-5554
    
    Wait Until Page Contains        COMEÇAR     10
    Click Text                      COMEÇAR
    Wait Until Element is Visible   xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]      5
    Click Element                   xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]
    Wait Until Element is Visible   id=io.qaninja.android.twp:id/navView
    Click Text                      FORMS
    Verifica Texto do Elemento  id=io.qaninja.android.twp:id/toolbarTitle  FORMS
    Wait Until Element is Visible   id=io.qaninja.android.twp:id/toolbarTitle       5
    
    Close Application

***Keywords
Verifica Texto do Elemento
    [Arguments]     ${locator}      ${value}
    Element Text Should Be      ${locator}      ${value}