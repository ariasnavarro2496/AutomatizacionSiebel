#COMPLETAR NIVELES


*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem

*** Variables ***

${FILE_PATH}    ID.txt

${username}    Leandro.ward
${password}    Oracle2023.


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

    Sleep    8s     css:input.search-bar-input
    Click Element     css:input.search-bar-input

    Sleep    8s
    ${RutCliente}         Get File    ${FILE_PATH}    #ASIGNA VALOR
    Log    ${RutCliente}    
    
    Press Keys     css:input.search-bar-input   ${RutCliente}    #RUT CLIENTE
    
    
    Wait Until Element Is Visible    css:div.global-search-found-item div.activity-title
    Click Element    css:div.global-search-found-item div.activity-title

    Sleep    8s
    Click Element    xpath://button[@title='Acciones']

    Sleep    8s    #RESULTADOS
    Click Element    xpath=//span[@class='toolbar-menu-button-title' and text()='Resultados']

    Sleep    7s
    Click Element    xpath://button[@aria-owns='#list_index_13']    #NIVELES
    
    Sleep    5s
    Click Element    xpath://div[@role='option' and @data-value='OK']

    Sleep    7s
    Click Element    xpath://button[@aria-owns='#list_index_20']    #FALLAS MASIVAS

    Sleep    5s            
    Click Element    css:div.list-option[data-value='OK']
    
    Sleep    10s 
    Click Button    xpath://button[text()='OK']

    Pause Execution