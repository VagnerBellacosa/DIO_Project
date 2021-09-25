*** Settings ***
Resource    ../resources/services.robot


*** Test Cases ***

#Lista todas as informações cadastradas 
Apresentar Lista de Informações Cadastradas 
    
    ${resp}=    Listar Informações Cadastradas           200
   
    Log   ${resp.text}

