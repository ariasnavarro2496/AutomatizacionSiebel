*** Settings ***
Library  SeleniumLibrary
Library    Dialogs
Library    Process



*** Test Cases ***
Alta AltaPlay1VTR

    Run Process    robot    AltaPlayVTR/AltaPlay1VTR.robot   #ALTA PLAY1
    Run Process    robot     Coordinador/CoorAsignaTecnico.robot   #ASIGNACION TECNICO
    Run Process    robot    Tecnico/TecnicoAprovisionar.robot    #APROVISIONAR

Alta Play2VTR    
    Run Process    robot    AltaPlayVTR/AltaPlay2VTR.robot

Alta Play3VTR    
    Run Process    robot    AltaPlayVTR/AltaPlay3VTR.robot

Alta Play1CLARO
    Run Process    robot    AltaPlayClaro/AltaPlay1CLARO.robot


