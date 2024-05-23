*** Settings ***
Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem



*** Test Cases ***
Alta AltaPlay1VTR

    Run Process    robot    AltaPlayVTR/AltaPlay1VTR.robot   #ALTA PLAY1
    Run Process    robot     Coordinador/CoorAsignaTecnico.robot   #ASIGNACION TECNICO
    Run Process    robot    Tecnico/TecnicoAprovisionarALTAPLAY1.robot    #APROVISIONAR ALTAPLAY1
    Run Process    robot    DetalleActividad/DetalleActividad.robot        #DETALLE DE LA ACTIVIDAD
    Run Process    robot    Coordinador/CoordinadorNiveles.robot    #COMPLETA LOS NIVELES
    Run Process    robot    Tecnico/TecnicoFin.robot        #FIN DE LA ACTIVIDAD
    Run Process    robot    DetalleActividad/DetalleActividad.robot        #PROCESO COMPLETO

Alta Play2VTR    
    Run Process    robot    AltaPlayVTR/AltaPlay2VTR.robot

Alta Play3VTR    
    Run Process    robot    AltaPlayVTR/AltaPlay3VTR.robot

Alta Play1CLARO
    Run Process    robot    AltaPlayClaro/AltaPlay1CLARO.robot


