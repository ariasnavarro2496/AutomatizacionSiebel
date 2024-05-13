*** Settings ***
Library  SeleniumLibrary
Library    OperatingSystem




*** Variables ***

${rut_python}      =   
    

*** Test Cases ***
Visitar Siebel
	Open browser    http://172.17.227.70:2080/ecommunications_VTR_esn/start.swe?SWECmd=Login&SWECM=S&SRN=&SWEHo=172.17.227.70  Chrome
	Sleep   5s
    Input Text     name:SWEUserName    skim

	
	Sleep   5s
	Input Password    name:SWEPassword    skim  #CONTRASEÑA
	Sleep    3s

	Click element    xpath://*[@id="s_swepi_22"]  #INICIO DE SESION
	Sleep   13s

    Click element    xpath://*[@id="s_1_1_0_0_Ctrl"]  #CAMBIAR PUESTO DE TRABAJO
    Sleep   8s

	Click Element    xpath://*[@id="s_sctrl_tabScreen"]/ul/li[2]  #BARRA DE VISTA DE PRIMER NIVEL CLIENTE
	Sleep    8s  

	Click Element    xpath://*[@id="s_sctrl_tabView"]/ul/li[2]   #BARRA DE VISTA DE SEGUNDO NIVEL LISTA DE CLIENTES
	Sleep    8s

	Click Element   xpath://*[@id="s_2_1_116_0_Ctrl"]   #CUENTA NUEVO
	Sleep    8s

    Input Text     xpath://*[@id="a_2"]/div/table/tbody/tr[3]/td[3]/div/input    123456161-4  #RUT CHILENO
    Sleep   8s

	Click Element   xpath://*[@id="a_2"]/div/table/tbody/tr[4]/td[3]/div/input 
	Sleep    5s

	Input Text    xpath://*[@id="a_2"]/div/table/tbody/tr[4]/td[3]/div/input    DIOMEDEZ   #NOMBRE
	Sleep    5s

	Input Text    xpath://*[@id="a_2"]/div/table/tbody/tr[5]/td[3]/div/input   DIAZ  #APELLIDO PATERNO
    Sleep   5s

	Click Element   xpath://*[@id="s_2_1_124_0_icon"]  #CLICK CUENTA APPLET DE FORMULARIO DIRECCION
	Sleep    8s

	
	Input Text    xpath://*[@id="sieb-ui-popup-mvg-available"]/form/table/tbody/tr[1]/td[2]/span[4]/input    VARAS MENA  #AÑADE LA DIRECCION
    Sleep    5s


	Click Element   xpath://*[@id="s_4_1_188_0_Ctrl"]  #BUSCA LA DIRECCION
	Sleep    5s

	Click Element   xpath://*[@id="10_s_4_l_Street_Address"]  #SELECCIONA VARAS MENA 1015 DEPTO 1001 
	Sleep    5s
    

	Click Element   xpath://*[@id="s_3_1_185_0_Ctrl"]  #DIRECCION DE LA CUENTA A AGREGAR
	Sleep    5s


	Click Element   xpath://*[@id="s_3_1_189_0_Ctrl"]  #CLICK ACEPTAR 
	Sleep    5s

	Input Text    xpath://*[@id="a_2"]/div/table/tbody/tr[5]/td[5]/div/input    DIOMEDEZDIAZ@GMAIL.COM  #AÑADE GMAIL
    Sleep   8s

    Click Element   xpath://*[@id="s_2_1_25_0_icon"]  #CLICK CUENTA APPLET DE FORMULARIO NUMERO DE TELEFONO
	Sleep    8s


	Click Element   xpath:/html/body/div[8]/div[2]/div/div/div/form/div/table/tbody/tr/td[1]/span[2]/button  #AGREGA NUMERO TELEFONICO 
	Sleep    8s


	Click Element   xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[3]/div/table/tbody/tr[2]/td[3]/span  #TIPO DE TELEFONO
	Sleep    8s
	


#HASTAA ACA FUNCIONAL


	Click ElemenT   xpath://*[@id="ui-id-133"]  #CELULAR
	Sleep    5s

	Input Text     xpath://*[@id="1_OCS_Numero_Telefono"]   999000999  #AGREGA EL NUMERO DE TELEFONO
	Sleep    5s

	Click Element   xpath://*[@id="s_10_1_189_0_Ctrl"]  #CLICK ACEPTAR NUMERO TELEFONICO


	Sleep    30s




    Log    This will not be executed

    # Click element    xpath://*[@id="s_1_1_0_0_Ctrl"]

	
	#close browser