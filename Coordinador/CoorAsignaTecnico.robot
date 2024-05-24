#PRIMERA SESION, ASIGNAR TECNICO A LA ACTIVIDAD POR MEDIO DEL 
COOORDINADOR 


*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem

*** Variables ***

${username}    Leandro.ward
${password}    Oracle2023.

${technical}    tec0022

${FILE_PATH}    ID.txt
${SCREENSHOT_DIR}    Evidencia\screenshots
${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
Visitar Siebel

    Open Browser   https://vtr4.test.etadirect.com/    browser=chrome    options=add_argument("--incognito --start-maximized")
    
    Login    
    Assign technician
    

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
    
    


Assign technician

    Sleep    8s    css:input.search-bar-input
    Click Element     css:input.search-bar-input

    Sleep    8s
    ${idActividad}         Get File    ${FILE_PATH}    #ASIGNA VALOR
    Log    ${idActividad}    
    
    Press Keys     css:input.search-bar-input   ${idActividad}    #ID ACTIVIDAD
    
    #Press Keys     css:input.search-bar-input        1-91KR7U8
    Sleep    5s
    Wait Until Element Is Visible    css:div.global-search-found-item div.activity-title
    Click Element    css:div.global-search-found-item div.activity-title
    
    Sleep    5s
    Wait Until Element Is Visible    css:button[data-ofsc-id='move_activity']
    Click Element    css:button[data-ofsc-id='move_activity']

    Sleep    8S
    Click Element    xpath://button[contains(text(),'Continuar')]

    Sleep    8S
    Click Element    css:div.oj-switch-thumb 

    Sleep    8S
    Input Text    css:input.oj-inputsearch-input[type='text']    ${technical}
    
    Sleep    10S
    Click Element     xpath://div[@class="resource-main-info"]

    Sleep    10S
    Click Element    xpath://button[contains(text(),'Mover')]
    
    Pause Execution   
