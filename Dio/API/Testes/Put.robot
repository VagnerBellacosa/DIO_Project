*** Settings ***
Resource    ../resources/services.robot


*** Test Cases ***

#Editar as informações informando um id válido 
Editar Informações Cadastradas de um Id Válido
    
    ${resp}=    Editar Informações de um Registro       301         {"id": 301, "name": "TesteEdit", "isCompleted": true}       200
    
    Log   ${resp.text}

#Editar as informações de um Id inválido - teste irá falhar
Editar Informações Cadastradas de um Id Inválido
    
    ${resp}=    Editar Informações de um Registro       xx         {"id": 0, "name": "TesteEdit", "isCompleted": true}      400
   
    Log   ${resp.text}

#Editar as informações de um Id inexistente - teste irá falhar
Editar Informações Cadastradas de um Id Inexistente
    
    ${resp}=    Editar Informações de um Registro       0         {"id": 200, "name": "TesteEdit", "isCompleted": true}     404
   
    Log   ${resp.text}

