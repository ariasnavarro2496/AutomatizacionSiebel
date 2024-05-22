#PRIMERA SESION, ASIGNAR TECNICO A LA ACTIVIDAD POR MEDIO DEL 
COOORDINADOR 


*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem

*** Variables ***

${FILE_PATH}    id_actividad.txt

${username}    Leandro.ward
${password}    Oracle2023.
${technical}    tec0022


${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
Visitar Siebel

    Open Browser   https://vtr4.test.etadirect.com/    browser=chrome    options=add_argument("--incognito")
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

    Sleep    13s
    Click Element     css:input.search-bar-input

    Sleep    8s
    ${idActividad}         Get File    ${FILE_PATH}    #ASIGNA VALOR
    Log    ${idActividad}    
    
    Press Keys     css:input.search-bar-input   ${idActividad}    #ID ACTIVIDAD
    
    #Press Keys     css:input.search-bar-input        1-91KR7U8
    Sleep   10s
    Click Element    css:div.global-search-found-item div.activity-title
    
    Sleep    7S
    Click Element    css:button[data-ofsc-id='move_activity']

    Sleep    8S
    Click Element    xpath://button[contains(text(),'Continuar')]

    Sleep    8S
    Click Element    css:div.oj-switch-thumb 

    Sleep    10S
    Input Text    css:input.oj-inputsearch-input[type='text']    ${technical}
    
    Sleep    10S
    Click Element     xpath://div[@class="resource-main-info"]
    Sleep    10S
    
    Click Element    xpath://button[contains(text(),'Mover')]
    Sleep    15s    
