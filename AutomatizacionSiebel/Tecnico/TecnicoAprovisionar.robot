#Inicia la actividad y aprovisiona

*** Settings ***
Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem


*** Variables ***

${username}    tec03
${password}    Oracle@123

${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
Visitar Siebel
    Open Browser    https://vtr4.test.etadirect.com/    browser=chrome    options=add_argument("--incognito")

    Login    
    Start Activity
    

*** Keywords ***
Login
    Sleep    5s
    Input Text    xpath://*[@id="username"]    ${username}

    Input Password     xpath://*[@id="password"]    ${password}
    Click Element    xpath://*[@id="sign-in"]
    Sleep    10S

    Click Element    xpath://*[@id="delsession"]
    Sleep    5S
    
    Input Password     xpath://*[@id="password"]    ${password}
    Click Element    xpath://*[@id="sign-in"]
    
Start Activity

    Sleep    12S
    Click Element   xpath://div[@class='activity-action' and contains(text(), 'Start')]   #START A LA ACTIVIDAD
    Sleep    10S
    Click Element    xpath://button[contains(text(),'Submit')]  #SUBMIT


    #Sleep    8s
    #Click Element  xpath://div[@class="activity-info"]  #PRUEBA


    Sleep    8S
    Click Element    xpath://button[@title="Inventory"]  #INVENTARIO
    Sleep    8S
    Click Element    xpath://*[@id="content"]/div/div/div/div/div[1]/table/tbody[1]/tr[1]
    Sleep    8S
    Click Element    xpath://button[@title="Install"]
    Sleep    8s
    Click Element    xpath:/html/body/div[19]/div/div/button[1]
    Sleep    8s
    Click Element    xpath://button[@class="button submit"]
    Sleep    8s
    Click Element    xpath://button[@title="Activity details"]
    Sleep    8s
    Click Element    xpath://button[@title="Aprovisionar"]    #APROVISIONAR
    Sleep    8s
    #Click Element    xpath=//input[@value="Aprovisionar"]    #FALTA CAPTURAR
    Pause Execution
    