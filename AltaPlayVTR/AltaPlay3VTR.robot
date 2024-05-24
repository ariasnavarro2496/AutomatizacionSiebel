*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem


*** Variables ***

${username}    skim
${password}    skim
${nombre}    JAIRO
${apellido}    ARIAS
${direccion}    VARAS MENA
${email}    LEONARDO@GMAIL.COM
${BUTTON_SELECTOR}    class:siebui-ctrl-btn.appletButton.siebui-icon-change.position.s_1_1_0_0

${FILE_PATH}   ID.txt
${SCREENSHOT_DIR}    Evidencia\screenshots
${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
AltaPlay3VTR
    Open Browser    http://172.17.227.70:2080/ecommunications_VTR_esn/start.swe?SWECmd=Login&SWECM=S&SRN=&SWEHo=172.17.227.70    Chrome    options=add_argument("--start-maximized")

    Login    
    Navigate To Main Page
    Create New Account
    Fill Account Information
    Add Address
    Add Phone Number
    New Order Record
    Sales Orders - Examine Catalog
    
    

*** Keywords ***
Login

    Input Text    name:SWEUserName    ${username}
    Input Password    name:SWEPassword    ${password}
    Click Element    xpath://*[@id="s_swepi_22"]
    
Navigate To Main Page

    Wait Until Page Contains Element    ${BUTTON_SELECTOR}    timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_1_1_0_0_Ctrl"] 

    Sleep    10s
    Click Element    xpath://*[@id="s_sctrl_tabScreen"]/ul/li[2]

    Wait Until Page Contains Element   xpath:/html/body/div[1]/div/div[4]/div/div/div[1]/div[2]/ul/li[2]   timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_sctrl_tabView"]/ul/li[2]


Create New Account

    Wait Until Page Contains Element   xpath://*[@id="s_2_1_116_0_Ctrl"]   timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_2_1_116_0_Ctrl"]
    
    Sleep    5s  #FALTA AUTOMATIZAR
    ${result}    Run Process    python   GeneradorRutAleatoreo/Generador.py
    Input Text     xpath://*[@id="a_2"]/div/table/tbody/tr[3]/td[3]/div/input   ${result.stdout}
    Sleep    5s

    

Fill Account Information

    Click Element   xpath://*[@id="a_2"]/div/table/tbody/tr[4]/td[3]/div/input 
	Sleep    5s
    
    Input Text    xpath://*[@id="a_2"]/div/table/tbody/tr[4]/td[3]/div/input    ${nombre}
    Sleep    3s
    Input Text    xpath://*[@id="a_2"]/div/table/tbody/tr[5]/td[3]/div/input    ${apellido}
    Input Text    xpath://*[@id="a_2"]/div/table/tbody/tr[5]/td[5]/div/input    ${email}

    Click Element    xpath://*[@id="s_2_1_124_0_icon"]

Add Address

    Wait Until Element Is Visible    xpath://*[@id="sieb-ui-popup-mvg-available"]/form/table/tbody/tr[1]/td[2]/span[4]/input    timeout=${WAIT_TIMEOUT}
    Input Text    xpath://*[@id="sieb-ui-popup-mvg-available"]/form/table/tbody/tr[1]/td[2]/span[4]/input    ${direccion}
    #
    
    
    Click Element    xpath://*[@id="s_4_1_188_0_Ctrl"]     #CLICK BUSCAR
    Click Element    xpath://*[@id="last_pager_s_4_l"]/span    #SIGUIENTE
    Sleep    7S
    Click Element    xpath://*[@id="1_s_4_l_Street_Address"]    #SELECCIONO DIRECCION
    
    
    Click Element    xpath://*[@id="s_3_1_185_0_Ctrl"]
    Sleep    5s
    Click Element    xpath://*[@id="s_3_1_189_0_Ctrl"]
    
    Sleep     5s

        
Add Phone Number

    Click Element    xpath://*[@id="s_2_1_25_0_icon"]
    Wait Until Element Is Visible    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/table/tbody/tr/td[1]/span[2]/button  timeout=${WAIT_TIMEOUT}
    Click Element    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/table/tbody/tr/td[1]/span[2]/button

    Sleep    3s
    Click Element    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[3]/div/table/tbody/tr[2]/td[3]/span
    Sleep    3s
    Click Element    xpath:/html/body/div[8]/ul[2]/li[2]
    Sleep    3s
    Click Element    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[3]/div/table/tbody/tr[2]/td[4]  
    Wait Until Element Is Visible    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[3]/div/table/tbody/tr[2]/td[4]/input           timeout=${WAIT_TIMEOUT}
    Input Text      xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[3]/div/table/tbody/tr[2]/td[4]/input   999555888
    Wait Until Element Is Visible    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[2]/span/button    timeout=${WAIT_TIMEOUT}
    Click Element    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[2]/span/button
    Sleep    5s 
    Click Element    xpath://*[@id="s_2_1_119_0_Ctrl"]


New Order Record

    Wait Until Element Is Visible    xpath://*[@id="1_s_1_l_OCS_Identificador_de_la_cuenta"]/a     timeout=45s
    Click Element    xpath://*[@id="1_s_1_l_OCS_Identificador_de_la_cuenta"]/a
    
    Wait Until Element Is Visible    xpath://*[@id="s_at_m_7"]     timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_at_m_7"]
    Sleep    5S
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div/div[3]/div[2]/div/form/span/div/div[1]/div[2]/span[1]/span/ul/li[4]/a
    Wait Until Element Is Visible    xpath://*[@id="1_s_7_l_Order_Number"]/a     timeout=45s    #CLICK NUMERO DE PEDIDO
    Click Element    xpath://*[@id="1_s_7_l_Order_Number"]/a


Sales Orders - Examine Catalog

    Sleep    10s   #CLICK CATALOGO
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[2]/div[2]/ul/li[2]/a  #CLICK RESIDENCIAL
    
    
    Wait Until Element Is Visible     xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div[1]/div[2]/div/div/div/span/table/tbody/tr[1]/td/div/ul/li/ul/li[1]/i  timeout=45s   #CLICK RESIDENCIAL
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div[1]/div[2]/div/div/div/span/table/tbody/tr[1]/td/div/ul/li/ul/li[1]/i  

    Sleep    5S   #CLICK RESIDENCIAL NORMAL
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div[1]/div[2]/div/div/div/span/table/tbody/tr[1]/td/div/ul/li/ul/li[1]/ul/li[1]/i


    Wait Until Element Is Visible    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div[1]/div[2]/div/div/div/span/table/tbody/tr[1]/td/div/ul/li/ul/li[1]/ul/li[1]/ul/li[1]/a   #TIEMPO DE ESPERA 3PLAY
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div[1]/div[2]/div/div/div/span/table/tbody/tr[1]/td/div/ul/li/ul/li[1]/ul/li[1]/ul/li[1]/a  #CLICK 3PLAY


    Sleep    8S   #CLICK SIGUIENTE PAGINA
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div[2]/div[3]/div/div/div/form/span/div/div[3]/div/div/div[5]/div/table/tbody/tr/td[2]/table/tbody/tr/td[4]/span


    sleep    10s   #PROMOCION 
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div[2]/div[3]/div/div/div/form/span/div/div[3]/div/div/div[3]/div[3]/div/table/tbody/tr[5]/td[2]



    Sleep    30S  #AGREGAR ITEM
    Click Element    xpath://*[@id="a_6"]/div[2]/div[1]    #AGREGAR ITEM

    Sleep   30s
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[2]/div[2]/ul/li[3]/a   # DETALLES
    Sleep   20s
    Click Element     xpath://*[@id="a_1"]/div/table/tbody/tr[12]/td[6]/div/input    # DEUDA NO VINCULANTE
    Sleep   10s
    Click Element     xpath://*[@id="a_1"]/div/table/tbody/tr[14]/td[4]/div/input    # Pago Upfront Primera Boleta
    Sleep   5s
    Click Element     xpath://*[@id="s_1_1_11_0_Ctrl"]  #TSQ
    Sleep   30s
    Click Element     xpath://*[@id="s_1_1_69_0_Ctrl"]    #GENERAR DOCUMENTO  
    Sleep    10s
    Switch Window    MAIN   #DEVUELVE A LA PAGINA PRINCIPAL
    Sleep    6s
    Pause Execution  
    Wait Until Element Is Visible      xpath://*[@id="s_1_1_37_0_icon"]   timeout=40s
    Click Element    xpath://*[@id="s_1_1_37_0_icon"]
    Sleep    12S
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/ul[3]/li[2]   #VISITA TECNICA 
    Sleep    18s
    Click Element    xpath://*[@id="s_1_1_79_0_Ctrl"]   #ENVIAR
    Pause Execution 
    Sleep    5s  

Copy and save to txt file

    ${idActividad}    Get Value     xpath://*[@id="a_2"]/div/table/tbody/tr[3]/td[3]/div/input    #COPIA IDACTIVIDAD
    Log    ${idActividad}
    # GUARDA EN ARCHIVO id_actividad.txt
    Create File    ${FILE_PATH}    ${idActividad}
    
    Sleep    10s
    
