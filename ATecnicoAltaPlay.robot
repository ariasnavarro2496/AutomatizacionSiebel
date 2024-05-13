*** Settings ***
Library  SeleniumLibrary
Library    XML




*** Variables ***

${username}    tec0022
${password}    Oracle@123

${nombre}    JAIRO
${apellido}    ARIAS
${direccion}    VARAS MENA
${email}    LEONARDO@GMAIL.COM
${BUTTON_SELECTOR}    class:siebui-ctrl-btn.appletButton.siebui-icon-change.position.s_1_1_0_0
${BUTTON_CLIENTESPRIMERNIVEL}    
${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
Visitar Siebel
    Open Browser    https://vtr4.test.etadirect.com/    Chrome 

    Login    
    Start Activity
    
    

*** Keywords ***
Login
    Sleep    5s
    Input Text    xpath://*[@id="username"]    ${username}

    Input Password     xpath://*[@id="password"]    ${password}
    Click Element    xpath://*[@id="sign-in"]
    Sleep    8S
    Click Element    xpath://*[@id="delsession"]
    Sleep    5S
    Input Password     xpath://*[@id="password"]    ${password}
    Click Element    xpath://*[@id="sign-in"]
    Sleep    8S
Start Activity

    Click Element    css:{light: enrouteAction &amp;&amp; enrouteAction.visible}
    
    Sleep    10S



    
    Click Element    xpath://*[@id="dashboard-content"]/div[2]/div/div[3]/div  #START A LA ACTIVIDAD
    Sleep    8s
    Click Element    xpath://*[@id="predefined-layout"]/div[5]/div/div/section/div
    Sleep    8S
    Click Element    xpath:/html/body/div[14]/div[1]/main/controls:page-header/header/div[2]/div[1]/div[3]/controls:toolbar/div/div[1]/div[5]/controls:toolbar-items:toolbar-button/button





    Sleep    20S