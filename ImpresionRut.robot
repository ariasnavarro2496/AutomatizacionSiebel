*** Settings ***
Library    OperatingSystem
Library        Process
Library  SeleniumLibrary

*** Test Cases ***
Ejemplo de Prueba

    Open browser    http://172.17.227.70:2080/ecommunications_VTR_esn/start.swe?SWECmd=Login&SWECM=S&SRN=&SWEHo=172.17.227.70  Chrome
	Sleep   5s
    
    ${result}    Run Process    python   generate.py
    Input Text     name:SWEUserName      ${result.stdout}


	
	Sleep   5s

	Input Password    name:SWEPassword    skim  #CONTRASEÑA
	Sleep    3s

    